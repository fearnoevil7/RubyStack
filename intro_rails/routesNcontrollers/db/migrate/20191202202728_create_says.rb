class CreateSays < ActiveRecord::Migration[5.0]
  def change
    create_table :says do |t|

      t.timestamps
    end
  end
end
