# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to(:photo_owner, {:class_name => "User", :foreign_key => "owner_id"})

  has_many(:photo_fans, {:class_name => "Like", :foreign_key => "photo_id"})

  has_many(:photo_comment, {:class_name => "Comment", :foreign_key => "photo_id"})

  has_many(:photo_fan_users, {:through => :photo_fans, :source => :like_owner})

end
