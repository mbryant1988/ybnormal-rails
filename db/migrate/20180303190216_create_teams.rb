class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :title
      t.string :twitter
      t.string :facebook
      t.string :youtube

      t.timestamps
    end
  end
end
