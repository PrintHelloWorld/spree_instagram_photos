ApplicationHelper.module_eval do
  def instagram_photos_for_tag(tag, *args)
    photos = SpreeInstagramPhotos.get_photos_for_tag(tag,args)
    if block_given? && photos.present?
      photos.each do |e|
        yield e
      end
    else
      photos
    end
  end
end
