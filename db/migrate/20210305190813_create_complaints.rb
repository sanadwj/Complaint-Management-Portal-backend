class CreateComplaints < ActiveRecord::Migration[6.1]
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status
      t.boolean :check_box

      t.timestamps
    end
  end
end
