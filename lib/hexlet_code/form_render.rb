# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(form_builder)
      Tag.build('form',
                action: form_builder.form_attributes[:url] || '#',
                method: form_builder.form_attributes[:method] || 'post') do
        form_builder.fields
      end
    end
  end
end
