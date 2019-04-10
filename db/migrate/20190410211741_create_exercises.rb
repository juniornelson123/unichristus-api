class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :file
      t.string :title
      t.text :description
      t.references :study_case, foreign_key: true

      t.timestamps
    end
  end
end
