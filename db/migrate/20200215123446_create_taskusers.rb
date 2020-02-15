class CreateTaskusers < ActiveRecord::Migration[5.2]
  def change
    create_table :taskusers do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
