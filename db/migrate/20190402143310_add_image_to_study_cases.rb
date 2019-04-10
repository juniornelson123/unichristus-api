class AddImageToStudyCases < ActiveRecord::Migration[5.2]
  def change
    add_column :study_cases, :image, :string
    add_column :study_cases, :video, :string
  end
end
