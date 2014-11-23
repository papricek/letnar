App.CategoryRoute = Ember.Route.extend

  model: (params) -> @store.find 'category', params.id

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('contacts').set('contacts', model.get('contacts'))
