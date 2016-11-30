class EntriesController < ApplicationController
	before_action :logged_in_user,only: [:create,:destroy]

	def create
		@entry=current_user.entries.build(entry_params)
		if @entry.save
			flash[:success]="Entry created"
			redirect_to root_url
		else
			@feed_items=[]
			render 'pages/home'
		end
	end

	def index
		@entries=Entry.paginate(page: params[:page])
	end

  def show
    	@entry=Entry.find(params[:id])
    	@comments=@entry.comments.paginate(page: params[:page])
  end

    private
    def entry_params
    	params.require(:entry).permit(:content,:title)
    end
end
