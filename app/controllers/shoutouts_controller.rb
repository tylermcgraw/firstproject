class ShoutoutsController < ApplicationController
  # GET /shoutouts
  # GET /shoutouts.json
  def index
    @shoutouts = Shoutout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shoutouts }
    end
  end

  # GET /shoutouts/1
  # GET /shoutouts/1.json
  def show
    @shoutout = Shoutout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shoutout }
    end
  end

  # GET /shoutouts/new
  # GET /shoutouts/new.json
  def new
    @shoutout = Shoutout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shoutout }
    end
  end

  # GET /shoutouts/1/edit
  def edit
    @shoutout = Shoutout.find(params[:id])
  end

  # POST /shoutouts
  # POST /shoutouts.json
  def create
    @shoutout = Shoutout.new(params[:shoutout])

    respond_to do |format|
      if @shoutout.save
        format.html { redirect_to @shoutout, notice: 'Shoutout was successfully created.' }
        format.json { render json: @shoutout, status: :created, location: @shoutout }
      else
        format.html { render action: "new" }
        format.json { render json: @shoutout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shoutouts/1
  # PUT /shoutouts/1.json
  def update
    @shoutout = Shoutout.find(params[:id])

    respond_to do |format|
      if @shoutout.update_attributes(params[:shoutout])
        format.html { redirect_to @shoutout, notice: 'Shoutout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shoutout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoutouts/1
  # DELETE /shoutouts/1.json
  def destroy
    @shoutout = Shoutout.find(params[:id])
    @shoutout.destroy

    respond_to do |format|
      format.html { redirect_to shoutouts_url }
      format.json { head :no_content }
    end
  end
end
