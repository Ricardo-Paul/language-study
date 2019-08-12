class Pub < ApplicationRecord
    belongs_to :type
    belongs_to :user
    has_many :answers
end
