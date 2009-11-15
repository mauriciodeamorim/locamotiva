class CreateRunners < ActiveRecord::Migration
  def self.up
    create_table :runners do |t|
      t.string :name
      t.boolean :sex
      t.date :birthday
      t.string :cpf
      t.string :phone
      t.string :nick
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :runners
  end
end
