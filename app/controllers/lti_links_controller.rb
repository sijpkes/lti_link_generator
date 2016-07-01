class LtiLinksController < ApplicationController

	def create
		key_id = params[:keyset_id].to_i
		@key_set = BasicLtiKey.find(key_id)
	end
end
