class Project < ApplicationRecord
  has_many :milestones
  validates :name , presence: true, uniqueness: true
  validates :person_responsible, presence: true
  validates :project_start_date, presence: true
  validates :planned_termination_date, presence: true
  validate :expiration_date_cannot_be_in_the_past

  def progress
    @progress ||= if self.milestones.exists?
      (self.milestones.where("completed = ?", true).length).to_f / (self.milestones.length).to_f * 100.to_f
    else
      0
    end
  end

end
WillPaginate.per_page = 10
