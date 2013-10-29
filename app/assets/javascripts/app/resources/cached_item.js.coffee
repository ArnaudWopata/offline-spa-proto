app.factory "CachedItem"
, ['Item', '$q', '$localStorage', 'offlineFlag', '$rootScope'
, (Item, $q, $localStorage, offlineFlag, $rootScope) ->
  class CachedItem
    constructor: ()->
      @online = offlineFlag.online

      $rootScope.$on 'onlineStatus', (event, status)=>
        @online = status

    allPromise: ()->
      def = $q.defer()

      if @online
        console.log 'online, getting data form API'
        Item.itemsPromise().then (data)=>

          console.log 'promise resolved with', data

          # Cache data
          @_set('items', data)

          # Forward data
          def.resolve data
        , (error)->
          def.resolve @_get('items')
      else
        console.log 'offline, getting data form LS'
        def.resolve @_get('items')

      def.promise

    _set: (key, data)->
      $localStorage[key] = data

    _get: (key)->
      $localStorage[key]

  new CachedItem()
]
