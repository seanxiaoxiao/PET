class LifecyclesController < ApplicationController
  # GET /lifecycles
  # GET /lifecycles.json
  def index
    @lifecycles = Lifecycle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lifecycles }
    end
  end

  # GET /lifecycles/1
  # GET /lifecycles/1.json
  def show
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lifecycle }
    end
  end

  # GET /lifecycles/new
  # GET /lifecycles/new.json
  def new
    @lifecycle = Lifecycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lifecycle }
    end
  end

  # GET /lifecycles/1/edit
  def edit
    @lifecycle = Lifecycle.find(params[:id])
  end

  # POST /lifecycles
  # POST /lifecycles.json
  def create
    @lifecycle = Lifecycle.new(params[:lifecycle])

    respond_to do |format|
      if @lifecycle.save
        format.html { redirect_to @lifecycle, notice: 'Lifecycle was successfully created.' }
        format.json { render json: @lifecycle, status: :created, location: @lifecycle }
      else
        format.html { render action: "new" }
        format.json { render json: @lifecycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lifecycles/1
  # PUT /lifecycles/1.json
  def update
    @lifecycle = Lifecycle.find(params[:id])

    respond_to do |format|
      if @lifecycle.update_attributes(params[:lifecycle])
        format.html { redirect_to @lifecycle, notice: 'Lifecycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lifecycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifecycles/1
  # DELETE /lifecycles/1.json
  def destroy
    @lifecycle = Lifecycle.find(params[:id])
    @lifecycle.destroy

    respond_to do |format|
      format.html { redirect_to lifecycles_url }
      format.json { head :no_content }
    end
  end
end
