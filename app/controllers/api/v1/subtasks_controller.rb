# frozen_string_literal: true

module Api
  module V1
    class SubtasksController < ApplicationController
      before_action :set_subtask, only: %i[show update destroy]

      # GET /subtasks
      def index
        @subtasks = Subtask.all

        render json: @subtasks
      end

      # GET /subtasks/1
      def show
        render json: @subtask
      end

      # GET /subtasks/completed
      def completed
        completed_subtasks = current_user.subtasks.completed
        render json: completed_subtasks
      end

      # GET /subtasks/incomplete
      def incomplete
        incomplete_subtasks = current_user.subtasks.incomplete
        render json: incomplete_subtasks
      end

      # GET /subtasks/incomplete
      def overdue
        overdue_subtasks = current_user.subtasks.overdue
        render json: overdue_subtasks
      end

      # POST /subtasks
      def create
        @subtask = Subtask.new(subtask_params)

        if @subtask.save
          render json: @subtask, status: :created, location: api_v1_subtasks_path(@subtask)
        else
          render json: @subtask.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /subtasks/1
      def update
        if @subtask.update(subtask_params)
          render json: @subtask
        else
          render json: @subtask.errors, status: :unprocessable_entity
        end
      end

      # DELETE /subtasks/1
      def destroy
        @subtask.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_subtask
        @subtask = Subtask.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def subtask_params
        params.require(:subtask).permit(:title, :description, :date, :time, :tag, :completed, :task_id, :deadline)
      end
    end
  end
end
