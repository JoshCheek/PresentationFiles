class CreateContestants < ActiveRecord::Migration
  def self.up
    create_table :contestants do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :contestants
  end
end
