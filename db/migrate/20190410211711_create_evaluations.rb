class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.float :value
      t.references :study_case, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
