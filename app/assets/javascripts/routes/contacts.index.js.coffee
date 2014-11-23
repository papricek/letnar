App.ContactsIndexRoute = Ember.Route.extend

  model: -> @store.find 'contact'

  setupController: (controller, model) ->
    @controllerFor('contacts').set('contacts', model)
