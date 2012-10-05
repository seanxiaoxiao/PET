class DeliverablesController < ApplicationController
  respond_to :html

  def new
    @deliverable = Deliverable.new
    respond_with @deliverable
  end

  def create
    @deliverable = Deliverable.create(params[:deliverable])
    respond_with @deliverable
  end

end