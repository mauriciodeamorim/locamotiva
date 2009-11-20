class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.string :start_number
      t.string :category
      t.string :team
      t.datetime :liquid_time
      t.datetime :official_time
      t.integer :class_general
      t.integer :class_sex
      t.integer :class_category
      t.datetime :pace
      t.string :distance
      t.string :substitute
      t.text :notes
      t.integer :race_id
      t.integer :athlete_id

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
