# frozen_string_literal: true

require_relative "base_input"

module HexletCode
  module Inputs
    class TextInput < BaseInput
      private

      def tag_name
        "textarea"
      end

      def input_attributes
        { name: @name, cols: 20, rows: 40 }.merge(@attributes)
      end

      def tag_content
        @value.to_s
      end
    end
  end
end
