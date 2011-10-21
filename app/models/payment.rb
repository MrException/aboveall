class Payment < ActiveRecord::Base
  belongs_to :user

  attr_accessible :payment_method
  
  validates :payment_method, presence: true
  
  after_initialize :init

  private

  def init
    self.payment_method ||= "None"
  end
end
