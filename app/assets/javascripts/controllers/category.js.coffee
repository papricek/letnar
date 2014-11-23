App.CategoryController = Ember.ObjectController.extend

  actions:
    saveChanges: ->
      if @get('model.isDirty')
        @get('model').save().then ->
          @transitionToRoute 'categories'

    delete: ->
      @get('model').destroyRecord().then =>
        @transitionToRoute 'categories'
