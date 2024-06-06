# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :fields

    def initialize(entity)
      @entity = entity
      @fields = ""
    end

    def input(field_name, as: :input, **attributes)
      value = @entity.public_send(field_name)
      unless @entity.members.include?(field_name)
        raise NoMethodError, "undefined method `#{field_name}` for #{@entity.class}"
      end

      case as
      when :text
        textarea(field_name, value, attributes)
      else
        input_field(field_name, value, attributes)
      end
    end

    private

    def input_field(name, value, attributes)
      attributes = { type: "text", value: value }.merge(attributes)
      @fields += Tag.build("input", { name: name }.merge(attributes))
    end

    def textarea(name, value, attributes)
      attributes = { cols: 20, rows: 40 }.merge(attributes)
      @fields += Tag.build("textarea", { name: name }.merge(attributes)) { value }
    end
  end
end
