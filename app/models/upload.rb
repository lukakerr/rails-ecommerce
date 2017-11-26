class Upload < ApplicationRecord
  belongs_to :user
  
  has_attached_file :image, 
    styles: { 
      original: "1000x" 
    }, 
    :url => "/pictures/uploads/:id/:style/:filename", 
    :path => ":rails_root/public/pictures/uploads/:id/:style/:filename",
    :convert_options => {
      :original => "-strip",
    },
    default_url: "/images/missing.png"
  
  validates_attachment :image, 
    presence: true,
    content_type: { 
      content_type: ["image/jpeg", "image/jpg", "image/png"] 
    },
    size: {
      less_than: 1.megabytes 
    },
    if: Proc.new {|a| a.image.present? }
      
end