# frozen_string_literal: true

require "test_helper"

class TestHexletCodeBasicForms < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end
end

class TestHexletCodeFormGeneration1 < Minitest::Test
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
end

class TestHexletCodeFormGeneration2 < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_generates_form_with_inputs
    user = User.new(name: "rob", job: "hexlet")
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job, as: :text
    end
    expected = [
      '<form action="#" method="post">',
      '<label for="name">Name</label>',
      '<input name="name" type="text" value="rob">',
      '<label for="job">Job</label>',
      '<textarea name="job" cols="20" rows="40">hexlet</textarea>',
      "</form>"
    ].join
    assert_equal expected, form
  end

  def test_generates_form_with_inputs_and_attributes
    user = User.new(name: "rob", job: "hexlet")
    form = HexletCode.form_for(user, url: "#") do |f|
      f.input :name, class: "user-input"
      f.input :job
    end
    expected = [
      '<form action="#" method="post">',
      '<label for="name">Name</label>',
      '<input name="name" type="text" value="rob" class="user-input">',
      '<label for="job">Job</label>',
      '<input name="job" type="text" value="hexlet">',
      "</form>"
    ].join
    assert_equal expected, form
  end

  def test_generates_form_with_text_area_and_custom_attributes
    user = User.new(name: "rob", job: "hexlet")
    form = HexletCode.form_for(user, url: "#") do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    expected = [
      '<form action="#" method="post">',
      '<label for="job">Job</label>',
      '<textarea name="job" cols="50" rows="50">hexlet</textarea>',
      "</form>"
    ].join
    assert_equal expected, form
  end

  def test_generates_form_with_submit_button
    user = User.new(name: "John", job: "Developer")
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job
      f.submit
    end
    expected = [
      '<form action="#" method="post">',
      '<label for="name">Name</label>',
      '<input name="name" type="text" value="John">',
      '<label for="job">Job</label>',
      '<input name="job" type="text" value="Developer">',
      '<input type="submit" value="Save">',
      "</form>"
    ].join
    assert_equal expected, form
  end

  def test_generates_form_with_custom_submit_button_text
    user = User.new(name: "John", job: "Developer")
    form = HexletCode.form_for(user) do |f|
      f.input :name
      f.input :job
      f.submit "Wow"
    end

    expected_form = '<form action="#" method="post">'
    expected_form += '<label for="name">Name</label>'
    expected_form += '<input name="name" type="text" value="John">'
    expected_form += '<label for="job">Job</label>'
    expected_form += '<input name="job" type="text" value="Developer">'
    expected_form += '<input type="submit" value="Wow">'
    expected_form += "</form>"

    assert_equal expected_form, form
  end

  def test_raises_error_for_nonexistent_field
    user = User.new(name: "John", job: "Developer")
    assert_raises(NoMethodError) do
      HexletCode.form_for(user) do |f|
        f.input :name
        f.input :job
        f.input :nonexistent_field
      end
    end
  end
end
