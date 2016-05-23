require 'hashie'
require 'instagram'
module SpreeInstagramPhotos
  class << self
    def get_photos_for_tag(tag, *args)
      return unless tag.is_a? String
      begin
        photos = Instagram.tag_recent_media(tag, args)
	puts photos.present?
	puts "instagram method running"
        return nil unless photos.present?
        photos.map(&:images).collect{|i| Hashie::Mash.new(thumbnail: i.thumbnail.url, full: i.standard_resolution.url) }
      rescue Exception => e
        nil
      end
    end
  end
end
