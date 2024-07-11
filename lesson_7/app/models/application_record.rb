class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

class Report < ApplicationRecord
  has_many :grades
end

class Grade < ApplicationRecord
  belongs_to :report
end