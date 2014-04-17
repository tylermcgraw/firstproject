class CreateShoutouts < ActiveRecord::Migration
  def change
    create_table :shoutouts do |t|
      t.string :comment
      t.references :user

      t.timestamps
    end
  end
end
