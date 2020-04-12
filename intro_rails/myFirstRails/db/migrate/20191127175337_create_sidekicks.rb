class CreateSidekicks < ActiveRecord::Migration[5.0]
  def change
    create_table :sidekicks do |t|
      t.string, :name
      t.references :hero, foreign_key: true

      t.timestamps
    end
  end
end
