class CreateMindMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :mind_maps do |t|
      t.string :file
      t.references :user, foreign_key: true
      t.references :study_case, foreign_key: true

      t.timestamps
    end
  end
end
