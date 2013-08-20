class FollowUp < ActiveRecord::Base
  belongs_to :note
  belongs_to :user
end
