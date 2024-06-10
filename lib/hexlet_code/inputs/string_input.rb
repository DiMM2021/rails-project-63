# frozen_string_literal: true

require_relative "base_input"

module HexletCode
  module Inputs
    class StringInput < BaseInput
      private

      def tag_name
        "input"
      end

      def input_attributes
        base_attributes = { name: @name, type: "text", value: @value }
        base_attributes.merge(@attributes)
      end
    end
  end
end
