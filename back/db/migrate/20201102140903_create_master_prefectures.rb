class CreateMasterPrefectures < ActiveRecord::Migration[5.2]
  PREFS = [
      { sort_no: 1, name: '北海道' },
      { sort_no: 2, name: '青森県' },
      { sort_no: 3, name: '岩手県' },
      { sort_no: 4, name: '宮城県' },
      { sort_no: 5, name: '秋田県' },
      { sort_no: 6, name: '山形県' },
      { sort_no: 7, name: '福島県' },
      { sort_no: 8, name: '茨城県' },
      { sort_no: 9, name: '栃木県' },
      { sort_no: 10, name: '群馬県' },
      { sort_no: 11, name: '埼玉県' },
      { sort_no: 12, name: '千葉県' },
      { sort_no: 13, name: '東京都' },
      { sort_no: 14, name: '神奈川県' },
      { sort_no: 15, name: '新潟県' },
      { sort_no: 16, name: '富山県' },
      { sort_no: 17, name: '石川県' },
      { sort_no: 18, name: '福井県' },
      { sort_no: 19, name: '山梨県' },
      { sort_no: 20, name: '長野県' },
      { sort_no: 21, name: '岐阜県' },
      { sort_no: 22, name: '静岡県' },
      { sort_no: 23, name: '愛知県' },
      { sort_no: 24, name: '三重県' },
      { sort_no: 25, name: '滋賀県' },
      { sort_no: 26, name: '京都府' },
      { sort_no: 27, name: '大阪府' },
      { sort_no: 28, name: '兵庫県' },
      { sort_no: 29, name: '奈良県' },
      { sort_no: 30, name: '和歌山県' },
      { sort_no: 31, name: '鳥取県' },
      { sort_no: 32, name: '島根県' },
      { sort_no: 33, name: '岡山県' },
      { sort_no: 34, name: '広島県' },
      { sort_no: 35, name: '山口県' },
      { sort_no: 36, name: '徳島県' },
      { sort_no: 37, name: '香川県' },
      { sort_no: 38, name: '愛媛県' },
      { sort_no: 39, name: '高知県' },
      { sort_no: 40, name: '福岡県' },
      { sort_no: 41, name: '佐賀県' },
      { sort_no: 42, name: '長崎県' },
      { sort_no: 43, name: '熊本県' },
      { sort_no: 44, name: '大分県' },
      { sort_no: 45, name: '宮崎県' },
      { sort_no: 46, name: '鹿児島県' },
      { sort_no: 47, name: '沖縄県' }
  ].freeze

  def up
    create_table :master_prefectures do |t|
      t.integer       :sort_no,     null: false,  unique: true,   comment: 'ソートNo'
      t.string        :name,        null: false,  unique: true,   comment: '都道府県名'
      t.timestamps
    end

    MasterPrefecture.reset_column_information

    ActiveRecord::Base.transaction do
      MasterPrefecture.delete_all
      PREFS.each do |pref|
        MasterPrefecture.create(sort_no: pref[:sort_no], name: pref[:name])
      end
    end
  end

  def down
    drop_table :master_prefectures
  end
end
