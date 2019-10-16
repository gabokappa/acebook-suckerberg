class Album < ApplicationRecord
  belongs_to :user
  has_many_attached :pics
end
