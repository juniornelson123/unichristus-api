class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.references :study_case, foreign_key: true
      t.references :class_room, foreign_key: true

      t.timestamps
    end
  end
end
