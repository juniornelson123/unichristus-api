class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name
      t.integer :kind, default: 0
      t.references :study_case, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
