class State < ActiveRecord::Base
  delegate  :to_s, to: :name
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :short, presence: true, uniqueness: { case_sensitive: false }

  scope :with_open_jobs, ->{ where(id: City.with_open_jobs.select(:state_id).uniq) }
end
