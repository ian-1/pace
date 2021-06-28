require 'uri'

module MessagesHelper
# based on  https://gist.github.com/O-I/4dd3a936a09474df97a0

def replace_text_urls_with_links(text)
  urls = URI.extract(text)
    urls.each do |url|
      text.gsub!(url, "<a href=#{url} target='_blank'>#{url}</a>")
    end
    text.html_safe
end

end
