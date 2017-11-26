class Page < ApplicationRecord
  belongs_to :user
  
  before_create :set_slug
  before_update :set_slug
  
  scope :published, -> {
    where(:published => true)
  }
  
  validates :name, presence: true, length: { in: 2..25 }, uniqueness: true
  validates :content, presence: true
  validates :user_id, presence: true
  
  has_attached_file :image, 
    styles: { 
      original: "300x300#" 
    }, 
    :url => "/pictures/pages/:id/:style/:filename", 
    :path => ":rails_root/public/pictures/pages/:id/:style/:filename",
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
  
  def to_param
    slug
  end
  
  private

  def set_slug
    self.slug = self.name.parameterize
  end

end
