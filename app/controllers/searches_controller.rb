class SearchesController < ApplicationController
  def index
  	@schools = School.all
  end
end
