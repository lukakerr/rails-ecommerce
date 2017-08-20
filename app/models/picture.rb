class Picture < ApplicationRecord
	belongs_to :imageable, polymorphic: true

	has_attached_file :image, 
		styles: { 
			banner: "1000x", product: "750x", grid: "300x300#", thumb: "100x" 
		}, 
		:url => "/pictures/:id/:filename",
    :path => ":rails_root/public/pictures/:id/:filename",
    :convert_options => { 
    	:banner => "-strip", :product => "-strip", :grid => "-strip", :thumb => "-thumbnail" 
    },
		default_url: "/images/:style/missing.png"
  
  validates_attachment :image, 
  	presence: true,
  	content_type: { 
  		content_type: ["image/jpeg", "image/jpg", "image/png"] 
  	},
  	less_than: 1.megabytes

end
