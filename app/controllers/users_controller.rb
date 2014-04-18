class UsersController < ApplicationController
	def show
		get_user
	end
	def edit
		get_user
	end
	def update
		get_user
		if @user.update_attributes(params[:user])
			redirect_to @user
		else
			render "edit"
		end
	end
	def destroy
		get_user
		authenticate
		if @user.destroy
			redirect_to root_url, notice: 'User was successfully deleted.'
		else
			render "show"
		end
	end
	private
	def get_user
		@user = User.find(params[:id])
	end
	def authenticate
		redirect_to root_url if current_user.blank?
		unless (current_user.has_role? :admin || (current_user.present? && @user.id == current_user.id)) 
			redirect_to root_url, notice: "You may not do this action!"
			return false
		end
	end
end
