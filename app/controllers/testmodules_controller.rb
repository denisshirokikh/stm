class TestmodulesController < ApplicationController

  def index
    @testmodules = Testmodule.all
   end

  def new
    @testmodule = Testmodule.new
  end

  def create
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.new(testmodule_params)

    if @testmodule.save
      redirect_to [project, @testmodule], notice: 'New test module was successfully created.'
    else
      render :new
    end
  end

  def edit
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id])
  end

  def update
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id])

    if @testmodule.update(testmodule_params)
      redirect_to project_testmodule_path(project_id: project.id, id: @testmodule.id), notice: 'Test module was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id])
    @testmodule.destroy
    redirect_to project_testmodule_path(project_id: project.id, id: @testmodule.id), notice: 'Test module was successfully deleted.'
  end

  def show
    @testmodule = Testmodule.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_testmodule
    @testmodule = Testmodule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def testmodule_params
    params.require(:testmodule).permit(:title, :content, :project_id)
  end


end

