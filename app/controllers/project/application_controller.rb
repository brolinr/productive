class Project::ApplicationController < ApplicationController
  layout "project_application"
  before_action :authenticate_user!
  before_action :set_current_project
  before_action :current_project
  before_action :current_project_user

  private

  def current_project
    # debugger
    @current_project ||=  Project.includes(:message_board).find(cookies.encrypted[:current_project_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, notice: "Project not found. Try again"
  end

  def current_project_user
    @current_project_user ||=  current_project.project_users.accepted.find_by!(user_id: current_user.id)
  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, notice: "Project not found. Try again"
  end

  def set_current_project
    return if params[:project_id].nil? || params[:project_id].to_s == cookies.encrypted[:current_project_id]

    current_project = Project.find(params[:project_id])
    cookies.permanent.encrypted[:current_project_id] = current_project.id

  rescue ActiveRecord::RecordNotFound
    redirect_to projects_path, notice: "Project not found. Try again"
  end
end
