class LtiLinksController < ApplicationController

	def create
		key_id = params[:keyset_id].to_i
		@key_set = BasicLtiKey.find(key_id)
		if (@key_set == nil)
			#redirect
		end
		@key_set.used = true
		@key_set.save

		@settings = ExpLtiInstructorSetting.new
		@settings.problem_prefix = "temp"
		@settings.solution_prefix = "temp"
		@settings.enable_group_import = false
		@settings.course_key = "temp"
		@settings.institution_id = 0
		@settings.last_update = DateTime.now
		@settings.total_score = 0

		@settings.show_comments = params[:show_comments] == "yes"
		@settings.show_grade_column = params[:show_grade_column] == "yes"
		@settings.allow_self_assessment = params[:allow_self] == "yes"
		@settings.include_self_in_mean_score = params[:include_self] == "yes"

		if @settings.valid?
			@settings.save
		end
	end
end
