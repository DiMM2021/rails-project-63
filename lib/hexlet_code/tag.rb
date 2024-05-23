# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  # Class for building HTML tags
  class Tag
    SELF_CLOSED_TAGS = %w[br img input link meta]

    def self.build(tag_name, attributes = {}, &_block)
      attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }
      attrs_str = attrs.join(" ")
      tag_opening = "<#{tag_name}#{' ' unless attrs_str.empty?}#{attrs_str}>"

      if SELF_CLOSED_TAGS.include?(tag_name)
        tag_opening.chomp('>') + "/>"
      elsif block_given?
        "#{tag_opening}#{yield}<\/#{tag_name}>"
      else
        "#{tag_opening}<\/#{tag_name}>"
      end
    end
  end
end