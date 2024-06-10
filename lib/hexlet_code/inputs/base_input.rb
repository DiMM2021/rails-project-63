# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(name, value, **attributes)
        @name = name
        @value = value
        @attributes = attributes
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

      def input_attributes
        { name: @name }.merge(@attributes)
      end

      def tag_content
        @value.to_s
      end
    end
  end
end
