# frozen_string_literal: true

require_relative "hexlet_code/version"

# Module for HexletCode
module HexletCode
  autoload(:Tag, "./lib/hexlet_code/tag")
  autoload(:Form, "./lib/hexlet_code/form")
  autoload(:FormBuilder, "./lib/hexlet_code/form_builder")

  def self.form_for(entity, url: "#", method: "post", &block)
    form_builder = FormBuilder.new(entity)
    block.call(form_builder) if block_given?
    Form.build(entity, url: url, method: method, content: form_builder.fields)
  end
end
