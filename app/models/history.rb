class History < ActiveRecord::Base
  belongs_to :lender
  belongs_to :borrower
  validates :lender_id, :borrower_id, presence:true
end
