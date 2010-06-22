class AddColumnEventIdToRace < ActiveRecord::Migration
  def self.up
    add_column :races, :event_id, :integer
  end

  def self.down
    remove_column :races, :event_id
  end
end
