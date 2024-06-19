# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def initialize(name, value, **attributes)
        super(name, value)
        @attributes = attributes
      end

      private

      def tag_name
        'textarea'
      end

      def base_attributes
        {
          name: @name,
          value: @value
        }
      end

      def input_attributes
        base_attributes.merge(@attributes || {})
      end

      def tag_content
        @value.to_s
      end
    end
  end
end
