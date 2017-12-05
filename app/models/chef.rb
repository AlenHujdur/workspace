class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  has_many :pages
  mount_uploader :picture, PictureUploader
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length:{ minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{ maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
  has_secure_password                
    
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture,'should be less than 5MB')
    end
  end
end