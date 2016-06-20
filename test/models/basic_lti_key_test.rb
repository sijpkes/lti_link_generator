require 'test_helper'

class BasicLtiKeyTest < ActiveSupport::TestCase
  self.set_fixture_class exp_blti_keys: BasicLtiKey
  fixtures :exp_blti_keys

  def test_blti_key
     blti_key =  BasicLtiKey.new oauth_consumer_key: exp_blti_keys(:lti_test1).oauth_consumer_key,
                                 secret: exp_blti_keys(:lti_test1).secret,
                                 name: exp_blti_keys(:lti_test1).name,
                                 context_id: exp_blti_keys(:lti_test1).context_id,
                                 url_segment: exp_blti_keys(:lti_test1).url_segment

     assert blti_key.save

     blti_key_copy = BasicLtiKey.find(blti_key.id)

     assert_equal blti_key.name, blti_key_copy.name

     blti_key.name = "lti_test1_updated"

     assert blti_key.save
     assert blti_key.destroy
  end
end
