class GymBasicInfo < ApplicationRecord
  belongs_to :master_prefecture
  belongs_to :master_gym

  scope :shop_name_search, ->(keyword) { where('shop_name LIKE ?', "%#{keyword}%") }
  scope :address_search, ->(keyword) { where('address LIKE ?', "%#{keyword}%") }
  scope :freeword_search, ->(keyword) { shop_name_search(keyword).or(address_search(keyword)) }

  def self.all_data_import
    CsvImport::Curves.data_import
    CsvImport::CentralSports.data_import
    CsvImport::Joyfit.data_import
    CsvImport::KonamiSportsClub.data_import
    CsvImport::Renaissance.data_import
  end
end
