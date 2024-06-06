# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, keyword_init: true)

  def test_generates_form_with_default_action_and_method
    user = User.new(name: "John", job: "Developer")
    form = HexletCode.form_for(user) { |f| }
    assert_equal '<form action="#" method="post"></form>', form
  end

  def test_generates_form_with_custom_action_and_default_method
    user = User.new(name: "John", job: "Developer")
    form = HexletCode.form_for(user, url: "/users") { |f| }
    assert_equal '<form action="/users" method="post"></form>', form
  end

  def test_generates_form_with_custom_method_and_default_action
    user = User.new(name: "John", job: "Developer")
    form = HexletCode.form_for(user, method: "put") { |f| }
    assert_equal '<form action="#" method="put"></form>', form
  end

  def test_generates_form_with_custom_action_and_method
    user = User.new(name: "John", job: "Developer")
    form = HexletCode.form_for(user, url: "/users", method: "put") { |f| }
    assert_equal '<form action="/users" method="put"></form>', form
  end

  def test_generates_form_with_inputs
    user = User.new(name: "rob", job: "hexlet")
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end
    input_name = '<input name="name" type="text" value="rob">'
    input_job = '<textarea name="job" cols="20" rows="40">hexlet</textarea>'
    expected = "<form action=\"#\" method=\"post\">#{input_name}#{input_job}</form>"
    assert_equal expected, form
  end

  def test_generates_form_with_inputs_and_attributes
    user = User.new(name: "rob", job: "hexlet")
    form = HexletCode.form_for(user, url: "#") do |f|
      f.input :name, class: "user-input"
      f.input :job
    end
    input_name = '<input name="name" type="text" value="rob" class="user-input">'
    input_job = '<input name="job" type="text" value="hexlet">'
    expected = "<form action=\"#\" method=\"post\">#{input_name}#{input_job}</form>"
    assert_equal expected, form
  end
end
