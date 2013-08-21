class FollowUp < ActiveRecord::Base
  belongs_to :note
  belongs_to :user 
  validates :task, :assigned_user_id, presence: true 
end
