class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string        :name
      t.text          :description      
      t.timestamps
    end
    
    create_table :groups_items, :id => false do |t|
      t.integer       :item_id
      t.integer       :group_id
    end
  end

  def self.down
    drop_table :groups
    drop_table :groups_items
  end
end
