class Course < ActiveRecord::Base
  resourcify
  has_many :offering, inverse_of: :course
  validates :course_number, :title, presence: true
  validates_inclusion_of :required, in: [true, false]
end
