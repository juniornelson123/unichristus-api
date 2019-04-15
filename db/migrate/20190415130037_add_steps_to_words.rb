class AddStepsToWords < ActiveRecord::Migration[5.2]
  def change
    add_reference :words, :step, foreign_key: true
  end
end
