class CreateStudyCases < ActiveRecord::Migration[5.2]
  def change
    create_table :study_cases do |t|
      t.string :title
      t.text :description
      t.references :class_room, foreign_key: true

      t.timestamps
    end
  end
end
