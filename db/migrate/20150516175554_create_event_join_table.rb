class CreateEventJoinTable < ActiveRecord::Migration
  def change
    create_join_table :events, :tags do |t|
      t.index :event_id
      t.index :tag_id
    end
  end
end
