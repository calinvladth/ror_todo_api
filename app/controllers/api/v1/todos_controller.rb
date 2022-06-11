module Api
  module V1
    class TodosController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        render json: Todo.all.order("completed ASC").order("created_at DESC")
      end

      def show
        render json: Todo.find(params[:id])
      end

      def create
        @todo = Todo.new(todo_params)
        if @todo.save
          render json: @todo
        end
      end

      def update
        @todo = Todo.find(params[:id])
        puts("TODO UPDATE: ", todo_params)
        if @todo.update(todo_params)
          render json: @todo
        end
      end

      def destroy
        render json: Todo.destroy(params[:id])
      end

      private def todo_params
        params.require(:todo).permit(:title, :completed)
      end

    end
  end
end