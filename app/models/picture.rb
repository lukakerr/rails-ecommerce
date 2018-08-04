class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true

  DEFAULT_STYLES = {
    original: "1000x", 
    product: "750x", 
    grid: "300x300#",
    thumb: "100x" 
  }

  has_attached_file :image, 
    styles: -> (image) { image.instance.styles }, 
    :url => "/pictures/:imageable_type/:id/:style/:filename", 
    :path => ":rails_root/public/pictures/:imageable_type/:id/:style/:filename",
    :convert_options => {
      :original => "-strip",
      :product => "-strip",
      :grid => "-strip",
      :thumb => "-quality 75 -strip" 
    },
    default_url: "/images/missing.png"

  validates_attachment :image, 
    presence: true,
    content_type: { 
      content_type: ["image/jpeg", "image/jpg", "image/png"] 
    },
    size: {
      less_than: 1.megabytes 
    }

  # Workaround to pickup styles from imageable model(s)
  # Paperclip starts processing before all attributes are in the model
  # So we start processing after saving

  before_post_process -> {
    !@image_reprocessed.nil?
  }

  after_save -> {
    # If the image hasn't been processed, or it has been updated, then re-process it
    if not @image_reprocessed || image_updated_at_changed? || imageable_type_changed?
      @image_reprocessed = true
      image.reprocess!
    end
  }

  # If the imageable class has image styles then use those, otherwise use the defaults
  def styles
    if imageable_class.respond_to?(:image_styles)
      imageable_class.image_styles
    end || DEFAULT_STYLES
  end

  def imageable_class
    imageable_type.constantize if imageable_type.present?
  end

end
