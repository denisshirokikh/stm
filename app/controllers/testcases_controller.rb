class TestcasesController < ApplicationController

  def index
    @testmodule = Testmodule.find(params[:testmodule_id])
    @testcases = @testmodule.testcases
    @project = Project.find(params[:project_id])

  end

  def show
    @testcase = Testcase.find(params[:id])
    # @testmodule = Testmodule.find(params[:testmodule_id])
    # @testcase = @testmodule.testcases.find(params[:id])
  end

  def new
    @testcase = Testcase.new
  end

  # GET /testcases/1/edit
  def edit
    @testcase = Testcase.find(params[:id])
  end

  def copy
    project = Project.find(params[:project_id])
    testmodule = project.testmodules.find(params[:testmodule_id])
    @testcase = testmodule.testcases.find(params[:id]).amoeba_dup
    @testcase.save

    if @testcase.save
      redirect_to [project, testmodule, @testcase], notice: 'New copy of testcase was successfully created.'
    else
      logger.info @testcase.errors.messages
      raise 'Unable to copy object'
    end
  end

  # POST /testcases
  def create
    project = Project.find(params[:project_id])
    testmodule = project.testmodules.find(params[:testmodule_id])
    @testcase = testmodule.testcases.new(testcase_params)

    if @testcase.save
      redirect_to [project, testmodule, @testcase], notice: 'New Testcase was successfully created.'
    else
      render :new
    end
    end

  def update
    @testmodule = Testmodule.find(params[:testmodule_id])
    @testcase = @testmodule.testcases.find(params[:id])

    if @testcase.update(testcase_params)
      redirect_to project_testmodule_testcase_path(project_id: @testmodule.project_id,
                                                    testmodule_id: @testcase.testmodule_id,
                                                    id: @testcase.id), notice: 'Testcase was successfully updated.'
    else
      render :edit
    end

  end


  def destroy
    @testmodule = Testmodule.find(params[:testmodule_id])
    @testcase = @testmodule.testcases.find(params[:id])
     @testcase.destroy
     redirect_to project_testmodule_testcases_path, notice: 'Testcase was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testcase
      @testcase = Testcase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testcase_params
      params.require(:testcase).permit(:title, :body, :testmodule_id)
    end
end
