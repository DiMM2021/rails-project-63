# frozen_string_literal: true

module HexletCode
  # Class for generating forms
  class Form
    def self.build(_entity, url: "#", method: "post", content: "")
      Tag.build("form", action: url, method: method) { content }
    end
  end
end
