class MasterGym < ApplicationRecord
  has_many :gym_basic_infos

  scope :search_by_gym_name, ->(gym_name) { where(gym_name: gym_name) }

  def self.find_by_gym_name(gym_name)
    search_by_gym_name(gym_name).first
  end
end
