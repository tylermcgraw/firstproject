class ShoutoutsController < ApplicationController
  def index
    @shoutouts = Shoutout.all
  end
  def show
    @shoutout = Shoutout.find(params[:id])
  end
  def new
    unless current_user.present?
      redirect_to new_user_registration_path, :notice => "Please create an account to make shoutouts"
      return false
    end
    @shoutout = Shoutout.new
  end
  def edit
    @shoutout = Shoutout.find(params[:id])
  end
  def create
    @shoutout = Shoutout.new(params[:shoutout])
    if @shoutout.save
      redirect_to @shoutout, notice: 'Shoutout was successfully created.'
    else
      render action: "new"
    end
  end
  def update
    @shoutout = Shoutout.find(params[:id])
    if @shoutout.update_attributes(params[:shoutout])
      redirect_to @shoutout, notice: 'Shoutout was successfully updated.'
    else
      render action: "edit"
    end
  end
  def destroy
    @shoutout = Shoutout.find(params[:id])
    @shoutout.destroy
    redirect_to root_url
  end
end
