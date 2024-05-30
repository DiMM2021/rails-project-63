# frozen_string_literal: true

require_relative "hexlet_code/version"

# Module for HexletCode
module HexletCode
  autoload(:Tag, "./lib/hexlet_code/tag")
  autoload(:Form, './lib/hexlet_code/form')

  def self.form_for(entity, url: '#', method: 'post', &block)
    Form.build(entity, url: url, method: method, &block)
  end
end
