# HexletCode

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

# My Project

[![CI](https://github.com/DiMM2021/rails-project-63/actions/workflows/CI.yml/badge.svg)](https://github.com/DiMM2021/rails-project-63/actions/workflows/CI.yml)
[![Hexlet Check](https://github.com/DiMM2021/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DiMM2021/rails-project-63/actions/workflows/hexlet-check.yml)

# HexletCode

HexletCode - это библиотека для генерации форм на Ruby.

# Установка

Установите библиотеку, добавив следующую строку в Gemfile: gem 'hexlet_code'

Затем выполните: bundle install

# Использование

Подключите библиотеку HexletCode: require "hexlet_code"

Определите структуру данных, которая представляет ваш объект формы. 
Например, определим структуру User: 

User = Struct.new(:name, :email, :age, keyword_init: true)

Создайте новый экземпляр User и передайте его в HexletCode.form_for вместе с блоком для определения полей формы:

user = User.new(name: "John Doe", email: "john.doe@example.com", age: 30)

form = HexletCode.form_for(user, url: "/users") do |f|
  f.input :name, label: "Полное имя"
  f.input :email, placeholder: "user@example.com"
  f.input :age, type: :number, min: 18, max: 100
end

Это сгенерирует следующую HTML-форму: 

<form action="/users" method="post">
  <label for="user_name">Полное имя</label>
  <input type="text" id="user_name" name="name" value="John Doe">

  <input type="email" name="email" placeholder="user@example.com" value="john.doe@example.com">

  <input type="number" name="age" min="18" max="100" value="30">
</form>