App.GoogleMapComponent = Ember.Component.extend

  # initialize map canvas
  showMap: ( ->
    @set('markers', [])
    container = @$('.map-canvas')
    options = {
      center: new google.maps.LatLng(@get("latitude"), @get("longitude")),
      zoom: 17,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @set('map', new google.maps.Map(container[0], options))
    @showMarkers()
  ).on('didInsertElement')

  # show markers for 
  showMarkers: ( ->
    contacts = @get('contacts')
    map = @get('map')
    markers = @get('markers')

    # remove all markers from map
    markers.forEach (marker) ->
      marker.setMap(null)
    markers = []

    # set them again from current contacts
    contacts.forEach (contact) ->
      marker = new google.maps.Marker
        position: new google.maps.LatLng(contact.get('latitude'), contact.get('longitude'))
        map: map

      markers.pushObject(marker)

    # save markers
    @set('markers', markers)

  ).observes('contacts.@each.latitude', 'contacts.@each.longitude')
