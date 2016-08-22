class CreateStudentsGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :students_groups, id: false do |t|
      t.integer :studenta, null: false
      t.integer :studentb, null: false
    end
  end
end
