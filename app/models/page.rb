class Page < ActiveRecord::Base
  belongs_to :chef
  
  mount_uploader :welcomepic, PictureUploader
  validate :picture_size
  
  private

    def picture_size
      if welcomepic.size > 5.megabytes
        errors.add(:welcomepic,'should be less than 5MB')
      end
    end
end