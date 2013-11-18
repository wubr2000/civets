class Vitae < ActiveRecord::Base
  before_create :set_code
  
  belongs_to :user
  
  has_and_belongs_to_many :jobs
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :refs
  
  private
  
  def set_code
    self.code = SecureRandom.urlsafe_base64
  end
end
