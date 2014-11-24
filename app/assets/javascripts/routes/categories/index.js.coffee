App.CategoriesIndexRoute = Ember.Route.extend

  model: -> @store.find('contact')

  setupController: (controller, model) ->
    @controllerFor('categories').set('contacts', model)
