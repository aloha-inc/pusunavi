class School < ApplicationRecord
	acts_as_taggable
	acts_as_ordered_taggable_on :companies, :purposes, :styles, :statuses, :courses

  scope :get_by_name, ->(name) {where("name like ?", "%#{name}%")}
end
