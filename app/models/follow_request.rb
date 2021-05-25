# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  validates(:recipient_id, {:uniqueness => {:scope => [:sender_id]}})

  belongs_to(:following_user, {:class_name => "User", :foreign_key => "recipient_id"})

  belongs_to(:pending_requests, {:class_name => "User", :foreign_key => "sender_id"})
end
