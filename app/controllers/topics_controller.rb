class TopicsController < ApplicationController

	def new
		@topic=Topic.new
	end

	def create

		@topic = Topic.create(topic_params)


	end

private

def topic_params
  		params.require(:topic).permit(:name) #solo permite estos datos
  	end


  end
