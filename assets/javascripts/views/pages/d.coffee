#= require views/pages/base

class app.views.DPage extends app.views.BasePage
  prepare: ->
    @highlightCode @findAll('pre.language-d, code.language-d'), 'd'
    return

app.views.PhobosPage = app.views.DPage
