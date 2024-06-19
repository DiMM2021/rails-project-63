# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(name, value)
        @name = name
        @value = value
      end

      def render
        Tag.build(tag_name, input_attributes) do
          tag_content
        end
      end

      private

      def tag_name
        raise NotImplementedError, "#{self.class} должен реализовать метод 'tag_name'"
      end

      def input_html_attributes
        base_attributes = { name: @name, value: @value }.merge(@attributes)
        Tag.build('input', base_attributes)
      end

      def tag_content
        @value.to_s
      end
    end
  end
end
