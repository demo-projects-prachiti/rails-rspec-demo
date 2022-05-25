class CreateJoinTableStudentTeacher < ActiveRecord::Migration[6.1]
  def change
    create_join_table :Students, :Teachers do |t|
      # t.index [:student_id, :teacher_id]
      # t.index [:teacher_id, :student_id]
    end
  end
end
