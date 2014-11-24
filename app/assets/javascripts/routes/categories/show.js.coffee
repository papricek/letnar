App.CategoriesShowRoute = Ember.Route.extend

  model: (params) -> @store.find('category', params.category_id)

  setupController: (controller, model) ->
    controller.set('model', model)
    @controllerFor('categories').set('contacts', model.get('contacts'))
