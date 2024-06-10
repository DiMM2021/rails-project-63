# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(form_builder)
      Form.build(
        form_builder.fields,
        url: form_builder.form_attributes[:url] || "#",
        method: form_builder.form_attributes[:method] || "post",
        content: form_builder.fields
      )
    end
  end
end
