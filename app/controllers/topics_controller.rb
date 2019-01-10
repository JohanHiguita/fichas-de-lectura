class TopicsController < ApplicationController

	def new
		@topic=Topic.new
	end

	def create

		@topic = Topic.new(topic_params)
		if @topic.save

		else
     
  		end

	end

private

def topic_params
  		params.require(:topic).permit(:name) #solo permite estos datos
  	end


  end
