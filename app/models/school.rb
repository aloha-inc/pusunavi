class School < ApplicationRecord
	acts_as_ordered_taggable_on :companies, :purposes, :styles, :statuses, :courses
end
