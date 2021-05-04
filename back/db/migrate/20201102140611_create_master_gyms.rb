class CreateMasterGyms < ActiveRecord::Migration[5.2]
  def up
    create_table :master_gyms do |t|
      t.string        :gym_name,    null: false,    unique: true,    comment: 'ジム名'
      t.timestamps
    end

    MasterGym.reset_column_information
    MasterGym.delete_all
    %w(セントラルスポーツ カーブス ジョイフィット コナミスポーツクラブ ルネッサンス).each do |gym|
      MasterGym.create(gym_name: gym)
    end
  end

  def down
    drop_table :master_gyms
  end
end
