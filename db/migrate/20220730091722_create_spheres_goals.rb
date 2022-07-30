class CreateSpheresGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :spheres_goals do |t|
      t.integer :goal_id
      t.integer :sphere_id

      t.timestamps
    end
  end
end
