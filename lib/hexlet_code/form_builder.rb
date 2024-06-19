# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :fields, :form_attributes

    def initialize(entity, **attributes)
      @entity = entity
      @fields = ''
      @form_attributes = attributes
    end

    def input(field_name, as: :string, **attributes)
      raise NoMethodError, "undefined method `#{field_name}` for #{@entity}" if field_name_not_found?(field_name)

      label = build_label(field_name)
      input_field = build_input_field(field_name, as, attributes)

      @fields += label + input_field
    end

    def submit(value = 'Save')
      @fields += Tag.build('input', { type: 'submit', value: value })
    end

    private

    def field_name_not_found?(field_name)
      !@entity.respond_to?(field_name)
    end

    def build_label(field_name)
      Tag.build('label', { for: field_name }) { field_name.capitalize }
    end

    def build_input_field(field_name, as, _attributes)
      value = @entity.public_send(field_name)
      input_class = input_class_for(as)

      input = input_class.new(field_name, value || '')
      input.render
    end

    def input_class_for(type)
      class_name = "#{type.to_s.split("_").map(&:capitalize).join}Input"
      Inputs.const_get(class_name)
    rescue NameError
      raise ArgumentError, "Unsupported input type: #{type}"
    end
  end
end
