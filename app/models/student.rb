class Student < ApplicationRecord
  has_and_belongs_to_many(:students, join_table: "students_groups", foreign_key: "studenta", association_foreign_key: "studentb")

  def self.generate_groups
    uniquely
  end

  # private





  def self.cohort
    Student.all
  end

  def self.uniquely
    return divides_groups_evenly if Student.all.first.students.empty?
    unique_groups
  end

  def self.unique_groups
    cohort, groups, count = [], [], 0
    extra = Student.all.length % 4
    Student.all.each do |student|
      groups << student
      count += 1
      if count == 4
        cohort << groups
        count, groups = 0, []
      end
    end
    count = 0
    if extra > 0
      until extra == count
        cohort[count] << Student.all[-count]
        count += 1
      end
    end
    cohort
  end

  def self.divides_groups_evenly
    groups = cohort.each_slice(4).to_a
    groups = uneven_case(groups) if groups.last.count < 3
    # remember_groups(groups)
  end

  def self.uneven_case(groups) # for if group%4 != 0
    count = 0
    groups.last.each do |student|
      groups[count] << student
      count += 1
    end
    groups.pop
    groups
  end

  def self.remember_groups(groups)
    uniquely.each do |group|
      group.each{ |student| student.students << group - [student] } #removes self student from group
    end
  end

end
