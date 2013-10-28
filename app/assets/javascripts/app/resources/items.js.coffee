app.factory "Item", ['$resource', 'apiPrefix', '$q', ($resource, apiPrefix, $q) ->
  resource = $resource( apiPrefix + "/items/:id",
    id: "@id"
  ,
    update:
      method: "PUT"
  )

  resource.itemsPromise = ()->
    deferred = $q.defer()
    @query {}
      ,(response) ->
        deferred.resolve response
      ,(error) ->
        error.message = 'unable to retrieve items list'
        deferred.resolve []

    deferred.promise

  resource.itemPromise = (itemId)->
    deferred = $q.defer()
    @get
        id: itemId
      , (response) ->
        deferred.resolve response
      ,(error) ->
        error.message = 'unable to retrieve item'
        deferred.resolve []

    deferred.promise

  resource
]
