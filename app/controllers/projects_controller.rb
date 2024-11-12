# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def index
    projects = current_user.projects

    @pinned_projects = projects.where(pinned: true)
    @unpinned_projects = projects.where(pinned: false)
  end

  def update
  end
end
