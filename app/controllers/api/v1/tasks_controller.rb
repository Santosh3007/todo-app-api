# frozen_string_literal: true

module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: %i[show update destroy]
      # GET /tasks
      def index
        @tasks = current_user.tasks
        render json: tasks_with_subtasks(@tasks)
      end

      # GET /tasks/completed
      def completed
        completed_tasks = current_user.tasks.completed
        render json: tasks_with_subtasks(completed_tasks)
      end

      # GET /tasks/incomplete
      def incomplete
        incomplete_tasks = current_user.tasks.incomplete
        render json: tasks_with_subtasks(incomplete_tasks)
      end

      # GET /tasks/incomplete
      def overdue
        overdue_tasks = current_user.tasks.overdue
        render json: overdue_tasks
      end

      # GET /tasks/1
      def show
        render json: @task
      end

      # POST /tasks
      def create
        @task = current_user.tasks.new(task_params)

        if @task.save
          render json: @task, status: :created, location: api_v1_tasks_path(@task)
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/1
      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/1
      def destroy
        @task.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def task_params
        # ADD ALL REQUIRED PARAMS IN REQUIRED
        params.require(:task)
              .permit(:title, :description, :date, :time, :tag, :deadline, :completed, :user_id)
      end

      def tasks_with_subtasks(tasks)
        tasks.map do |task|
          subtasks = task.subtasks.map do |subtask|
            {
              id: subtask.id,
              title: subtask.title,
              description: subtask.description,
              completed: subtask.completed,
              tag: subtask.tag,
              deadline: subtask.deadline
            }
          end

          {
            id: task.id,
            title: task.title,
            description: task.description,
            tag: task.tag,
            completed: task.completed,
            deadline: task.deadline,
            tagColor: task.tagColor,
            subtasks: subtasks
          }
        end
      end
    end
  end
end
