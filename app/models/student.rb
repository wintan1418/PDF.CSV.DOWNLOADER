require 'csv'
class Student < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :admission_date, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      student_hash = row.to_hash
      student = Student.where(email: student_hash['email']).first_or_initialize
      student.update!(student_hash)
    end
  end
end
