class MasterPrefecture < ApplicationRecord
  has_many :gym_basic_infos

  def self.find_by_pref_name(pref_name)
    find_by(name: pref_name)
  end
end
