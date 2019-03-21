class TestmodulesController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @testmodules = @project.testmodules

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

  def copy
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id]).amoeba_dup
    @testmodule.save

    binding.pry
    if @testmodule.save
       redirect_to [project, @testmodule], notice: 'New copy of test module was successfully created.'
    else
      logger.info @testmodule.errors.messages
      raise 'Unable to copy object'
    end
  end

  def edit
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id])
  end

  def update
    @testmodule = Testmodule.find(params[:id])
    # project = Project.find(params[:project_id])
    # @testmodule = project.testmodules.find(params[:id])

    if @testmodule.update(testmodule_params)
      redirect_to project_testmodule_path(project_id: @testmodule.project_id, id: @testmodule.id), notice: 'Test module was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id])
    @testmodule.destroy
    redirect_to project_testmodules_path, notice: 'Test module was successfully deleted.'
  end

  def show
    project = Project.find(params[:project_id])
    @testmodule = project.testmodules.find(params[:id])
    @testcases = @testmodule.testcases
    @testcase = Testcase.new
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

