class Like < ApplicationRecord
  belongs_to :user,
  optional: true
end
