# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def initialize(name, value, **attributes)
        super(name, value)
        @attributes = attributes
      end

      private

      def tag_name
        'input'
      end

      def input_attributes
        base_attributes = { name: @name, type: 'text', value: @value }
        base_attributes.merge(@attributes || {})
      end
    end
  end
end
