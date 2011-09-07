class CreateAthletes < ActiveRecord::Migration
  def self.up
    create_table :athletes do |t|
      t.string :name
      t.string :sex
      t.date :birthday
      t.string :cpf
      t.string :phone
      t.string :nick
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :athletes
  end
end
