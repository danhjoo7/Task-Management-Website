class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :assigner_id
      t.integer :assignee_id
      t.string :title
      t.string :category
      t.string :status
      t.string :priority
      t.string :content

      t.timestamps
    end
  end
end
