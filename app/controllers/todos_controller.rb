class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  def create
    @todos = GoogleDriveService.fetch_todos current_user.token
    GoogleDriveService.create_todo params, @todos
    redirect_to todos_path
  end

  def index
    @todos = GoogleDriveService.fetch_todos current_user.token
  end


  # Need to build the following:
  # You are passing in the :id as a parameter, which
  # is a row index in the Google spreadsheet. 
  # Find the row
  # Then populate the fields of a @todo object
  # Saving it will overwrite that field in the spreadsheet
  # Note: this should actually be an edit action, not show.
  def show
    binding.pry
  end
end 