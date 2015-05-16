class Event < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_time 
      t.string :location
      t.string :link
      t.references :tag, index: true

      t.timestamps
    end

    create_table :tag do |t|
      t.string :name
      t.references :tag, index: true

      t.timestamps
    end
  end
end
