class TestrunsController < ApplicationController
  before_action :set_testrun, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.find(params[:project_id])
    @testruns = @project.testruns
  end

  def show
    project = Project.find(params[:project_id])
    @testrun = project.testruns.find(params[:id])
    # @testmodule = project.testmodules.find(params[:id])
    # @testcases = @testmodule.testcases
    # @testcase = Testcase.new
  end

  def new
    @testrun = Testrun.new(params[:testrun])
    project = Project.find(params[:project_id])
    @testmodule_id = project.testmodules.ids
    # @testrun = Testrun.create(params[:testrun])
    @testcases = []
    @testmodule_id.each do |id|
      tc = Testcase.all.where(testmodule_id: id)
      @testcases << tc
    end
      @testcases.flatten!
  end

  def edit
    project = Project.find(params[:project_id])
    @testrun = project.testruns.find(params[:id])
  end

  def create
    project = Project.find(params[:project_id])
    @testrun = project.testruns.new(testrun_params)

    if @testrun.save
      redirect_to [project, @testrun], notice: 'New testrun was successfully created.'
    else
      render :new
    end
  end

  def update

  end


  def destroy


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testrun
      @testrun = Testrun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testrun_params
      params.require(:testrun).permit(:title, :body, :completed, :project_id, testcase_ids:[])
    end
end
