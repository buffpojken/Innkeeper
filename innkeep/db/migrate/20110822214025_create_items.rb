class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string    :name
      t.text      :description
      t.string    :code
      t.integer   :category_id
      t.timestamps
    end
  end
end
