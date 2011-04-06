class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :sex, :string
    add_column :users, :birthday, :date
    add_column :users, :cpf, :string
    add_column :users, :rg, :string
    add_column :users, :teamcode, :string
    add_column :users, :mobile, :string
  end

  def self.down
    remove_column :users, :mobile
    remove_column :users, :teamcode
    remove_column :users, :rg
    remove_column :users, :cpf
    remove_column :users, :birthday
    remove_column :users, :sex
    remove_column :users, :name
    remove_column :users, :username
  end
end
