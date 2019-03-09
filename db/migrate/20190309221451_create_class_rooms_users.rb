class CreateClassRoomsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :class_rooms_users do |t|
      t.references :user, foreign_key: true
      t.references :class_room, foreign_key: true

      t.timestamps
    end
  end
end
