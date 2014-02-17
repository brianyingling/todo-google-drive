class TodosController < ApplicationController
  def index
    @todos = GoogleDriveService.fetch_todos current_user.token
    # binding.pry
    # @items = GoogleDriveService.fetch_file_list current_user.token
  end
end 