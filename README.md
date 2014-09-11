focus_watcher
===========

Gem для отслеживания получения и потери фокуса dom-элементами

Gem for tracking the receipt and loss focus of dom elements


Зарегистрировав любой dom элемент

```javascript
FocusWatcher.register($('.xxx'))
```

он будет получать событие ‘focused’ при клике по нему или любому дочернему элементу и событие ‘defocused’ при клике за его пределами, если до этого фокус был на нем

```javascript
$('.xxx').on('focused', function(){console.log('focused')})
$('.xxx').on('defocused', function(){console.log('defocused')})
```

## Installation

Add this line to your application's Gemfile:

    gem 'focus_watcher'

And then execute:

    $ bundle

Add this line to your application.js

    //= require focus_watcher
