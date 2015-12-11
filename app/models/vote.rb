class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates_uniqueness_of :user, scope: :event
end
