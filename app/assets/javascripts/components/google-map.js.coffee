App.GoogleMapComponent = Ember.Component.extend

  # initialize map canvas
  showMap: ( ->
    @set('markers', [])
    container = @$('.map-canvas')
    options = {
      center: new google.maps.LatLng(@get("latitude"), @get("longitude")),
      zoom: 14,
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
      coordinates = new google.maps.LatLng(contact.get('latitude'), contact.get('longitude'))
      marker = new google.maps.Marker
        position: coordinates
        map: map

      contact.marker = marker
      markers.pushObject(marker)

    @set('markers', markers)

  ).observes('contacts.@each')
