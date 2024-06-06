# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :fields

    def initialize(entity)
      @entity = entity
      @fields = ""
    end

    def input(field_name, as: :input, **attributes)
      raise NoMethodError, "undefined method `#{field_name}` for #{@entity}" if field_name_not_found?(field_name)

      label = build_label(field_name)
      input_field = build_input_field(field_name, as, attributes)

      @fields += label + input_field
    end

    def submit(value = "Save")
      @fields += Tag.build("input", { type: "submit", value: value })
    end

    private

    def field_name_not_found?(field_name)
      !@entity.respond_to?(field_name)
    end

    def build_label(field_name)
      Tag.build("label", { for: field_name }) { field_name.capitalize }
    end

    def build_input_field(field_name, as, attributes)
      value = @entity.public_send(field_name)

      case as
      when :text
        build_textarea(field_name, value, attributes)
      else
        build_regular_input(field_name, value, attributes)
      end
    end

    def build_textarea(field_name, value, attributes)
      attributes = { cols: 20, rows: 40 }.merge(attributes)
      Tag.build("textarea", { name: field_name }.merge(attributes)) { value }
    end

    def build_regular_input(field_name, value, attributes)
      attributes = { type: "text", value: value || "" }.merge(attributes)
      Tag.build("input", { name: field_name }.merge(attributes))
    end
  end
end
