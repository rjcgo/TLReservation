require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "notify_next" do
    mail = NotificationMailer.notify_next
    assert_equal "Notify next", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
