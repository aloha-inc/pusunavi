class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
    @courses_list = @schools.tag_counts_on(:courses).map(&:name).unshift("ALL")
    @purposes_list = @schools.tag_counts_on(:purposes).map(&:name).unshift("ALL")

    if params[:name].present? 
      @schools = @schools.get_by_name params[:name]
    end

   # if params[:course_list].present? 
      @course_tag = params[:course_list]
      @purpose_tag = params[:purpose_list]
      @schools =  School.all
      if @course_tag.present? and @course_tag != "ALL" then
        @schools =  @schools.tagged_with(@course_tag, :on => :courses)
      end
      if @purpose_tag.present? and @purpose_tag != "ALL" then
        @schools =  @schools.tagged_with(@purpose_tag, :on => :purposes)
      end
    # end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :company_list, :purpose_list, :style_list, :status_list, :course_list)
    end
end
