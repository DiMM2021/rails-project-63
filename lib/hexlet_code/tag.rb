# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  # Class for building HTML tags
  class Tag
    SELF_CLOSED_TAGS = %w[br img input link meta].freeze

    def self.build(tag_name, attributes = {}, &_block)
      attrs_str = attributes.map { |key, value| "#{key}=\"#{value}\"" if value }.compact.join(' ')
      tag_opening = "<#{tag_name}#{" " unless attrs_str.empty?}#{attrs_str}"

      if SELF_CLOSED_TAGS.include?(tag_name)
        "#{tag_opening}>"
      else
        content = block_given? ? yield : ''
        "#{tag_opening}>#{content}</#{tag_name}>"
      end
    end
  end
end
