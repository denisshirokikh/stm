class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects

  def index
    @projects = current_user.projects
  end

  # GET /projects/1

  def show
    @project = Project.find(params[:id])
    @testmodules = @project.testmodules
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  def create
    @project = current_user.projects.new(project_params)

    if @project.save
        redirect_to @project, notice: 'Project was successfully created.'
    else
        render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
       redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
       redirect_to projects_url, notice: 'Project was successfully deleted.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :content, :user_id)
    end
end
