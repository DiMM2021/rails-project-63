## HexletCode

HexletCode - это библиотека для генерации HTML-форм на Ruby.

## Установка

Чтобы установить гем HexletCode, добавьте следующую строку в ваш Gemfile: 

#```ruby
#gem 'hexlet_code'
#```

Затем выполните: 

#```ruby
#bundle install
#```

## Использование

Сначала подключите библиотеку HexletCode в вашем Ruby-скрипте: require 'hexlet_code'

Определите структуру данных, представляющую ваш объект формы. Например, давайте определим структуру для пользователя: 

User = Struct.new(:name, :email, :age, keyword_init: true)

Создайте новый экземпляр User и передайте его в метод HexletCode.form_for вместе с блоком для определения полей формы:

user = User.new(name: "John Doe", email: "john.doe@example.com", age: 30)

form = HexletCode.form_for(user, url: "/users") do |f|
  f.input :name, label: "Имя"
  f.input :email, placeholder: "user@example.com"
  f.input :age, type: :number, min: 18, max: 100
end

puts form

Это сгенерирует следующую HTML-форму:

<form action="/users" method="post">
  <label for="user_name">Имя</label>
  <input type="text" id="user_name" name="name" value="John Doe">

  <input type="email" name="email" placeholder="user@example.com" value="john.doe@example.com">

  <input type="number" name="age" min="18" max="100" value="30">
</form>

## Разработка

После клонирования репозитория, выполните bin/setup для установки зависимостей. Затем выполните rake test для запуска тестов. Вы также можете запустить bin/console для интерактивного терминала, который позволит вам экспериментировать с кодом.

Чтобы установить этот гем на локальную машину, выполните bundle exec rake install. Чтобы выпустить новую версию, обновите номер версии в version.rb, а затем выполните bundle exec rake release, что создаст git-тег для версии, запушит git-коммиты и созданный тег, а также отправит .gem файл на rubygems.org.

## Внесение вклада

Сообщения о багах и пулл-реквесты приветствуются на GitHub по адресу https://github.com/DiMM2021/hexlet_code. Этот проект предназначен для безопасного и гостеприимного сотрудничества, и участники ожидают соблюдения кодекса поведения.

## Лицензия

Гем доступен как open source на условиях MIT License.(https://opensource.org/licenses/MIT).

## Кодекс поведения

Все взаимодействующие с проектом HexletCode в кодовой базе, трекерах задач, чатах и списках рассылки должны соблюдать кодекс поведения.(https://github.com/DiMM2021/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## Значки проекта

[![CI](https://github.com/DiMM2021/rails-project-63/actions/workflows/CI.yml/badge.svg)](https://github.com/DiMM2021/rails-project-63/actions/workflows/CI.yml)
[![Hexlet Check](https://github.com/DiMM2021/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DiMM2021/rails-project-63/actions/workflows/hexlet-check.yml)
