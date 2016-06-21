require 'test_helper'

class BasicLtiKeyTest < ActiveSupport::TestCase
  self.set_fixture_class exp_blti_keys: BasicLtiKey
  fixtures :exp_blti_keys

  def test_blti_key
      blti_key =  BasicLtiKey.new oauth_consumer_key: "sasoi42jadfojodf",
                              secret: "&8348903q4",
                              name: "Test Name",
                              context_id: "894jkodfgj023049u09refu8r",
                              url_segment: "test/insert1"

     if ! blti_key.valid?
        puts "Validation failed"
        exit
     end

     assert blti_key.save

     blti_key_copy = BasicLtiKey.find(blti_key.id)

     assert_equal blti_key.name, blti_key_copy.name

     blti_key.name = blti_key.name+"_updated"

     if ! blti_key.valid?
        puts "Validation failed"
        exit
     end

     assert blti_key.save

     assert_not_equal blti_key.name, blti_key_copy.name

     assert blti_key.save

     assert blti_key.destroy
  end
end
