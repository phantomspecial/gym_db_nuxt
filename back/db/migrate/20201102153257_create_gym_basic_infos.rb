class CreateGymBasicInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_basic_infos do |t|
      t.references	:master_gym,        	null: false,      	comment: 'ジム名'
      t.references	:master_prefecture, 	null: false,      	comment: '都道府県'
      t.string	    :shop_name,         	null: false,      	comment: '店舗名'
      t.string	    :post_address,      	null: false,      	comment: '郵便番号'
      t.string	    :tel_no,            	null: false,      	comment: '電話番号'
      t.string	    :address,             null: false,      	comment: '住所'
      t.string	    :url,               	null: false,      	comment: 'URL'
      t.text  	    :access,            	                  	comment: 'アクセス'
      t.text  	    :opening_hours,     	null: false,      	comment: '営業日・休館日'
      t.text  	    :parking,                     		        comment: '駐車場・駐輪場'
      t.text  	    :facility,                    		        comment: 'ジム設備'
      t.text  	    :other_info1,                 		        comment: 'その他情報1'
      t.timestamps
    end
  end
end
