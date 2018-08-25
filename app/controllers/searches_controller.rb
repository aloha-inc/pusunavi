class SearchesController < ApplicationController
  def index
    @schools = School.all
    @courses_list = @schools.tag_counts_on(:courses).map(&:name).unshift("ALL")
    @purposes_list = @schools.tag_counts_on(:purposes).map(&:name).unshift("ALL")
    @styles_list = @schools.tag_counts_on(:styles).map(&:name).unshift("ALL")
    @statuses_list = @schools.tag_counts_on(:statuses).map(&:name).unshift("ALL")

    if params[:name].present? 
      @schools = @schools.get_by_name params[:name]
    end

   # if params[:course_list].present? 
    @course_tag = params[:course_list]
    @purpose_tag = params[:purpose_list]
    @style_tag = params[:style_list]
    @status_tag = params[:status_list]
    @schools =  School.all
      if @course_tag.present? and @course_tag != "ALL" then
        @schools =  @schools.tagged_with(@course_tag, :on => :courses)
      end
      if @purpose_tag.present? and @purpose_tag != "ALL" then
        @schools =  @schools.tagged_with(@purpose_tag, :on => :purposes)
      end
      if @style_tag.present? and @style_tag != "ALL" then
        @schools =  @schools.tagged_with(@style_tag, :on => :styles)
      end
      if @status_tag.present? and @status_tag != "ALL" then
        @schools =  @schools.tagged_with(@status_tag, :on => :statuses)
      end
    # end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end
end
