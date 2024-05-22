module HexletCode
  class Error < StandardError; end
  
  class Tag
    def self.build(tag_name, attributes = {}, &block)
      self_closed_tags = %w[br img input link meta]
      attrs = attributes.map { |attr, value| value ? "#{attr}=\"#{value}\"" : attr }
      attrs_str = attrs.join(' ')
      tag_opening = "<#{tag_name}#{' ' unless attrs_str.empty?}#{attrs_str}>"

      if block_given?
        "#{tag_opening}#{yield}</#{tag_name}>"
      elsif self_closed_tags.include?(tag_name)
        tag_opening
      else
        "#{tag_opening}</#{tag_name}>"
      end
    end
  end
end