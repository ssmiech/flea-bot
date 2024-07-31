class Answer < ApplicationRecord
  belongs_to :participant
  belongs_to :survey
end
