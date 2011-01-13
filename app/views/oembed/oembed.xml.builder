xml.instruct!

xml.oembed do
  @oembed.each do |key, value|
    xml.tag! key, value
  end
end
