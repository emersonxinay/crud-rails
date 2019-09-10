class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path
    else
      redirect_to todos_show_path, notice:'ERROR'
    end
  end

  def show
    @todo =Todo.find(params[:id])

  end

  def edit
    @todo =Todo.find(params[:id])
      redirect_to todos_edit_path
  end
  def update
    @todos = Todo.find(params[:id])
    @todos.update(todo_params)
    redirect_to todos_path

  end
  def destroy
    @todos = Todo.find(params[:id])
    @todos.destroy
    redirect_to todos_path
  end

  def complete
    @todo = Todo.find(params[:id])
    completed = true
    redirect_to todos_path
  end
  def list
    @todos = Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:description)
  end

end
