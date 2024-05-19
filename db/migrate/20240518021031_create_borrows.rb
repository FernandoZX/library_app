class CreateBorrows < ActiveRecord::Migration[7.1]
  def change
    create_table :borrows do |t|
      t.datetime :start_date, default: DateTime.now
      t.datetime :return_date
      t.datetime :due_date, default: DateTime.now + 2.weeks
      t.datetime :overdue_date
      t.boolean :returned, default: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
