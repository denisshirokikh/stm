class TestmoduleController < ApplicationController

  def index
    @testmodule = Testmodule.all
  end

  def new
    @testmodule = Testmodule.new
  end

  def create
    @testmodule = current_project.testmodule.new(testmodule_params)

    if @testmodule.save
      redirect_to @testmodule, notice: 'New test module was successfully created.'
    else
      render :new
    end
  end

  def edit
    @testmodule = Testmodule.find(params[:id])
  end

  def update
    if @testmodule.update(testmodule_params)
      redirect_to @testmodule, notice: 'Test module was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @testmodule.destroy
    redirect_to testmodule_url, notice: 'Test module was successfully deleted.'
  end

  def show
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

