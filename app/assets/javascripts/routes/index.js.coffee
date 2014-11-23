App.IndexRoute = Ember.Route.extend

  model: ->
    Ember.RSVP.hash
      contacts: @store.find 'contact'
      categories: @store.find 'category'

  setupController: (controller, model) ->
    if controller.content
      controller.set('contacts', model.contacts)
      controller.set('categories', model.categories)

