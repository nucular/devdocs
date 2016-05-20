#= require views/pages/base

class app.views.DPage extends app.views.BasePage
  prepare: ->
    for el in @findAllByTag('pre') when el.hasAttribute('data-language')
      @highlightCode el, el.getAttribute('data-language')
    for el in @findAllByTag('code') when el.hasAttribute('data-language')
      @highlightCode el, el.getAttribute('data-language')
    return

app.views.PhobosPage = app.views.DPage
