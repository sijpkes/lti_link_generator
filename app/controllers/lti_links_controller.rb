class LtiLinksController < ApplicationController

	def create
		#Validate post paramaters and load keys
		key_id = params[:keyset_id].to_i
		if (key_id <= 0 || (@key_set = BasicLtiKey.find(key_id)) == nil)
			redirect_to "/"
		end

		if (@key_set.used)
			@error = "That key has already been used, please start"
		end

		@key_set.used = true
		@key_set.save

		#Generate template group row for group_id
		group = ExpTemplateGroup.new
		group.group_name = @key_set.url_segment
		group.group_order = 0
		group.save

		folder_path = Rails.configuration.x.final_template_file_path + @key_set.url_segment + ".group"
		puts folder_path.inspect
		Dir.mkdir(folder_path) unless Dir.exist?(folder_path)

		index = params[:html_template]
		index.sub! Rails.configuration.x.group_sub_heading, params[:group_sub_heading]
		index.sub! Rails.configuration.x.evaluation_form_heading, params[:evaluation_form_heading]
		#Write to external file
		File.open(folder_path + "/index.html", "w") { |file| file.write index }
		#Write to database
		index_template = ExpTemplate.new
		index_template.group_id = group.group_id #Generated above as exp_template_groups primary key
		index_template.template_name = "index"
		index_template.template_data = index
		index_template.save

		marking_impact = params[:marking_instructions]
		File.open(folder_path + "/marking_impact.html", "w") { |file| file.write marking_impact }
		marking_template = ExpTemplate.new
		marking_template.group_id = group.group_id #Generated above as exp_template_groups primary key
		marking_template.template_name = "marking_impact"
		marking_template.template_data = marking_impact
		marking_template.save

		@settings = ExpLtiInstructorSetting.new
		@settings.problem_prefix = "temp"
		@settings.solution_prefix = "temp"
		@settings.enable_group_import = false
		@settings.institution_id = 0
		@settings.last_update = DateTime.now

		@settings.course_key = @key_set.oauth_consumer_key + ":" + @key_set.linkgen_id
		@settings.total_score = params[:total_score].to_i
		@settings.show_comments = params[:show_comments] == "yes"
		@settings.show_grade_column = params[:show_grade_column] == "yes"
		@settings.allow_self_assessment = params[:allow_self] == "yes"
		@settings.include_self_in_mean_score = params[:include_self] == "yes"

		if @settings.valid?
			@settings.save
		end
	end
end
