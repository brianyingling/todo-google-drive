class OAuthUser
  
  attr_reader :provider, :user

  def initialize(creds, user=nil)
    @auth     = creds
    @user     = user
    @provider = @auth.provider
    @policy   = "#{@provider}_policy".classify.constantize.new @auth
  end

  def login_or_create
    logged_in? ? create_new_account : (login || create_new_account)
  end

  def logged_in?
    @user.present?
  end

  private

  def login
    @account = OAuthAccount.where(@auth.slice("provider", "uid")).first
    if @account.present?
      refresh_tokens
      @user = @account.user
      @policy.refresh_callback @account
    else
      false
    end
  end

  def refresh_tokens
    params = {
      :oauth_token   => @policy.oauth_token,
      :oauth_expires => @policy.oauth_expires,
      :oauth_secret  => @policy.oauth_secret
    }
    @account.update_attributes params
  end

  def create_new_account
    create_new_user if @user.nil?
    
    unless account_already_exists?
      params = {
        :provider      => @provider,
        :uid           => @policy.uid,
        :oauth_token   => @policy.oauth_token,
        :oauth_expires => @policy.oauth_expires,
        :oauth_secret  => @policy.oauth_secret,
        :username      => @policy.username
      }
      @account = @user.accounts.create! params
      @policy.create_callback @account
    end
  end

  def account_already_exists?
    @user.account.exists? :provider => provider, :uid => @policy.uid
  end

  def create_new_user
    params = {
      :first_name => @policy.first_name,
      :last_name  => @policy.last_name,
      :email      => @policy.email,
      :picture    => @policy.email,
      :picture    => image
    }
    @user = User.create! params
  end

  def image
    image = open(URI.parse(@policy.image_url), :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE)
    def image.original_filename; base_uri.path.split('/').last; end
    image
  end


end