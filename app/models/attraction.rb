class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  def total_users
    users.all.size
  end
end
