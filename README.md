seedman
===========

Gem для добавления прогресбара к сидам

Пример

```ruby
users: [
          {
            email: 'user@example.com',
            password: '123456'
          }
        ]

seedman = Seedman.new(title: 'Заполнение...')

seedman.add 'Создание пользователей', users.count do
  seedman.store.users = users.map do |attrs|
    result = User.create!(attrs)
    seedman.inc
    result
  end
end

seedman.process
```

В ```seedman.store.users``` будут находиться созданные пользователи

## Installation

Add this line to your application's Gemfile:

    gem 'seedman'

And then execute:

    $ bundle