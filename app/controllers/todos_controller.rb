class TodosController < ApplicationController
  before_action :find_todo, only: [:show, :edit, :completed, :update, :destroy]
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


  end

  def edit


  end
  def update

    @todo.update(todo_params)
    redirect_to todos_path

  end
  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def completed

    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
    @todos_completed = Todo.where(completed: true)
    @todos_incompleted = Todo.where(completed: [false, nil])
  end

  private
  def todo_params
    params.require(:todo).permit(:description)
  end

def find_todo
  @todo =Todo.find(params[:id])

end
end
