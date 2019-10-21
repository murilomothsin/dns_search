class CreateHostnames < ActiveRecord::Migration[5.2]
  def change
    create_table :hostnames do |t|
      t.string :hostname

      t.timestamps
    end
  end
end
