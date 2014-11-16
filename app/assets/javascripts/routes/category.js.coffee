App.CategoryRoute = Ember.Route.extend

  model: (params) -> @store.find 'category', params.id

  setupController: (controller, model) ->
    @controllerFor('category').set('model', model)
    @controllerFor('application').set('model', model.get('contacts'))
