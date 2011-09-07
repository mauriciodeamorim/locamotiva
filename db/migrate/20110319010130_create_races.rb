class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name
      t.string :stage
      t.datetime :date
      t.string :place
      t.string :distance
      t.string :url
      t.boolean :showme

      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
