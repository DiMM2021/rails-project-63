# frozen_string_literal: true

module HexletCode
  # Class for generating forms
  class Form
    def self.build(_entity, url: "#", method: "post")
      Tag.build("form", action: url, method: method)
    end
  end
end
