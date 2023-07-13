require 'test_helper'

class TrashNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trash_notes_index_url
    assert_response :success
  end

end
