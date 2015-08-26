class TodosController < ApplicationController
	
	def index
	
		@todos = Todo.all
	
	end

	def new 
	
		@todo = Todo.new

	end

	def show
		@todo = Todo.find(params[:id])
	end

  def create

	     @todo = Todo.new(todo_params)
			 respond_to do |format|
			   if @todo.save
			     format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
			     format.json { render :index, status: :created, location: @todo }
			   else
			     format.html { render :new }
			     format.json { render json: @todo.errors, status: :unprocessable_entity }
			   end
			 end
 end
 
	def update
	
		
		@todo = Todo.find(params[:id])
		respond_to do |format|
			if @todo.update(todo_params)
				format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
				format.json { render :index, status: :ok, location: @todo }
			else
				format.html { render :edit }
				format.json { render json: @todo.errors, status: :unprocessable_entity }
			end
	  end

	end

	def edit

	  @todo = Todo.find(params[:id])	
	
	end

	def destroy

		 @todo = Todo.find(params[:id])
		 @todo.destroy
		 
		 respond_to do |format|
			format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
			format.json { head :no_content }
		 end

	end

  private 
	
	def todo_params
	
		params.require(:todo).permit(:task)
	
	end

end
