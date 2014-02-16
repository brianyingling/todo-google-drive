class TodosController < ApplicationController
  def index
    @items = GoogleDriveService.fetch_file_list current_user.token
  end
end 