class Semester < ActiveRecord::Base
  resourcify
  has_many :offering, inverse_of: :semester
  validates :academic_year, :academic_term, presence: true, uniqueness: { scope: [:academic_term, :academic_year]}
  validates_inclusion_of :archived, in: [true, false]
  
  after_initialize :defaults, unless: :persisted?
  
  def defaults
    self.archived||=false
  end
  
  def getName 
    return academic_term + " " + academic_year
  end
end
