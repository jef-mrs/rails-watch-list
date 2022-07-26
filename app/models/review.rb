class Review < ApplicationRecord

  belongs_to :list
  
  MARK = (1..5)


  validates :comment, length: { minimum: 6 }
  validates :rating, inclusion: { in: MARK }
end
