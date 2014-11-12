App.Contact = DS.Model.extend
  name: DS.attr('string')
  urls: DS.attr('string')
  phones: DS.attr('string')
  address: DS.attr('string')
  category: DS.belongsTo('category')
