Paperclip.interpolates :imageable_type do |attachment, style|
  attachment.instance.imageable_type.downcase.pluralize
end