class RemoveStudyCaseIdToExercises < ActiveRecord::Migration[5.2]
  def change
    remove_column :exercises, :study_case_id, :integer
    add_column :exercises, :class_room_id, :integer
  end
end
