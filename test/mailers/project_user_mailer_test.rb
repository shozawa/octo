require 'test_helper'

class ProjectUserMailerTest < ActionMailer::TestCase
  test "add_user" do
    mail = ProjectUserMailer.add_user
    assert_equal "Add user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "reject_user" do
    mail = ProjectUserMailer.reject_user
    assert_equal "Reject user", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
