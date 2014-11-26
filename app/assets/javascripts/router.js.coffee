# For more information see: http://emberjs.com/guides/routing/

App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map ()->
  @route 'categories', path: '/', ->
    @route 'show', path: '/categories/:category_id'
