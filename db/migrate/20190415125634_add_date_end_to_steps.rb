class AddDateEndToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :date_end, :datetime
  end
end
