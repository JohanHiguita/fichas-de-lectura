class TopicsController < ApplicationController

	before_action :authenticate_user!

	def new
		@topic=Topic.new
	end

	def create

		@topic = Topic.new(topic_params)
		@topic.user = current_user
		if @topic.save
			#
		else
			#
		end


	end

private

def topic_params
  		params.require(:topic).permit(:user_id,:name) #solo permite estos datos
  	end


  end
