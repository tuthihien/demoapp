class UsersController < ApplicationController
	before_action :logged_in_user ,only: [:edit, :update]

    def index
    	@users = User.paginate(page: params[:page])
    end

	def show
		@user=User.find(params[:id])
		@entries = @user.entries.paginate(page: params[:page])
	end

	def new
		@user=User.new
	end

	def create
		@user=User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] ="Welcome to the Sample App!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user=User.find(params[:id])
	end

    def update
    	@user=User.find(params[:id])
    	if @user.update_attributes(user_params)
    		flash[:success]="Profile updated"
    		redirect_to @user
    	else
    		render 'edit'
    	end
    end

	def following
	    @title = "Following"
	    @user  = User.find(params[:id])
	    @users = @user.following.paginate(page: params[:page])
	    render 'show_follow'
    end

	  def followers
	    @title = "Followers"
	    @user  = User.find(params[:id])
	    @users = @user.followers.paginate(page: params[:page])
	    render 'show_follow'
	  end

	private
	  def user_params
	  	params.require(:user).permit(:name,:email,:password,
	  		:password_confirmation)
	  end


end
