# For more information see: http://emberjs.com/guides/routing/

App.Router.reopen
  location: 'auto'
  rootURL: '/'

App.Router.map ()->
  @resource 'contacts', path: '/', ->
    @resource 'category', path: '/categories/:id'
