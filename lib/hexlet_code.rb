# frozen_string_literal: true

require_relative "hexlet_code/version"

# Module for HexletCode
module HexletCode
  autoload(:Tag, "./lib/hexlet_code/tag")
  autoload(:Form, "./lib/hexlet_code/form")
  autoload(:FormBuilder, "./lib/hexlet_code/form_builder")
  autoload(:FormRenderer, "./lib/hexlet_code/form_render")

  def self.form_for(entity, attributes = {})
    form_builder = FormBuilder.new(entity, **attributes)
    yield(form_builder) if block_given?
    FormRenderer.render_html(form_builder)
  end
end
