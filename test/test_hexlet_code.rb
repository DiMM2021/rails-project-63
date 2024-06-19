# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, keyword_init: true)

  def test_generates_form_with_default_action_and_method
    user = User.new(name: 'John', job: 'Developer')
    form = HexletCode.form_for(user) { |f| }
    assert_equal load_fixture('form_with_default_action_and_method.html'), form.strip.gsub(/\s+/, ' ')
  end

  def test_generates_form_with_custom_action_and_default_method
    user = User.new(name: 'John', job: 'Developer')
    form = HexletCode.form_for(user, url: '/users') { |f| }
    assert_equal load_fixture('form_with_custom_action_and_default_method.html'), form.strip.gsub(/\s+/, ' ')
  end

  def test_generates_form_with_custom_method_and_default_action
    user = User.new(name: 'John', job: 'Developer')
    form = HexletCode.form_for(user, method: 'put') { |f| }
    assert_equal load_fixture('form_with_custom_method_and_default_action.html'), form.strip.gsub(/\s+/, ' ')
  end

  def test_generates_form_with_custom_action_and_method
    user = User.new(name: 'John', job: 'Developer')
    form = HexletCode.form_for(user, url: '/users', method: 'put') { |f| }
    assert_equal load_fixture('form_with_custom_action_and_method.html'), form.strip.gsub(/\s+/, ' ')
  end

  def test_generates_form_with_submit_button
    user = User.new(name: 'John', job: 'Developer')
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal load_fixture('form_with_submit_button.html'), form.strip.gsub(/\s+/, ' ')
  end

  def test_generates_form_with_custom_submit_button_text
    user = User.new(name: 'John', job: 'Developer')
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal load_fixture('form_with_custom_submit_button_text.html'), form.strip.gsub(/\s+/, ' ')
  end

  def test_raises_error_for_nonexistent_field
    user = User.new(name: 'John', job: 'Developer')
    assert_raises(NoMethodError) do
      HexletCode.form_for(user) do |f|
        f.input :name
        f.input :job
        f.input :nonexistent_field
      end
    end
  end
end
