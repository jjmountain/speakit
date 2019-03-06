class Attendance < ApplicationRecord
  belongs_to :lesson
  belongs_to :student
  has_many :time_trials
  def time_trials
    TimeTrial.where(attendance_a_id: id).or(TimeTrial.where(attendance_b_id: id))
  end
end
