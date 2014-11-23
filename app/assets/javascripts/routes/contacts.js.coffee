App.ContactsRoute = Ember.Route.extend

  model: ->
    Ember.RSVP.hash
      contacts: @store.find 'contact'
      categories: @store.find 'category'

