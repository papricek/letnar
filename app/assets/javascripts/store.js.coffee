# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

DS.RESTAdapter.reopen
  namespace: 'api'

App.Store = DS.Store.extend()
App.ApplicationAdapter = DS.ActiveModelAdapter.extend()