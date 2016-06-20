json.array!(@basic_lti_keys) do |basic_lti_key|
  json.extract! basic_lti_key, :id, :title, :body
  json.url basic_lti_key_url(basic_lti_key, format: :json)
end
