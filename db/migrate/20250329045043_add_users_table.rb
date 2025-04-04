class AddUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :username
      t.timestamps
    end
  end
end
