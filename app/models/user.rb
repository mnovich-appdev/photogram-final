# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  comments_count  :integer
#  email           :string
#  likes_count     :integer
#  password_digest :string
#  private         :boolean
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:followers, {:class_name => "FollowRequest", :foreign_key => "recipient_id"})

  has_many(:following, {:class_name => "FollowRequest", :foreign_key => "sender_id"})

  has_many(:following_accepted, -> {where status: "accepted"}, {:class_name => "FollowRequest", :foreign_key => "sender_id"})

  has_many(:following_pending, -> {where status: "pending"}, {:class_name => "FollowRequest", :foreign_key => "recipient_id"})

  has_many(:owned_photos, {:class_name => "Photo", :foreign_key => "owner_id"})

  has_many(:feed_users, {:through => :following_accepted, :source => :following_user})

  has_many(:feed_photos, {:through => :feed_users, :source => :owned_photos})

  def private_text

    if self.private == true
      return "Yes"
    else
      return "No"
    end
    
  end

end
