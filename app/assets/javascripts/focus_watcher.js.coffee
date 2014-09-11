class FocusWatcher
  elements: []
  focus: {
    current: null
    currentParents: []
    currentObserved: []
    previous: null
    previousParents: []
    previousObserved: []
  }

  register: (element) ->
    @elements.push(element) for element in $(element)

  constructor: ->
    $(document).on 'click', (e) => @changeFocus(e.target)

  changeFocus: (target) =>
    return unless target?
    cleanTarget = if target instanceof jQuery then target.get(0) else target
    return if @focus.current == cleanTarget
    # Копируем предыдущий элемент
    @focus.previous = @focus.current
    @focus.current  = cleanTarget
    # Копируем предыдущих предков
    @focus.previousParents = @focus.currentParents
    (@focus.currentParents = $(@focus.current).parents().toArray()).unshift(cleanTarget)
    # Копируем предыдущие контроллируемые элементы
    @focus.previousObserved = @focus.currentObserved
    @focus.currentObserved = []
    for parent in @focus.currentParents
      @focus.currentObserved.push(parent) if @elements.indexOf(parent) > -1
    @_processChange()
    @focus.current

  _processChange: ->
    @_sendDefocused(parent) for parent in @focus.previousObserved
    @_sendFocused(parent)   for parent in @focus.currentObserved


  _sendFocused: (target) =>
    $(target).trigger('focused', [@focus.previous, @focus.current])

  _sendDefocused: (target) =>
    $(target).trigger('defocused', [@focus.previous, @focus.current])

window.FocusWatcher = new FocusWatcher