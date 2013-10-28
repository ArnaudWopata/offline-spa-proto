# Configure 'app' routing. The $stateProvider and $urlRouterProvider
# will be automatically injected into the configurator.
app.config ['$routeProvider',($routeProvider, assetsHost) ->

  # Make sure that any other request beside one that is already defined
  # in stateProvider will be redirected to root.



  rootsRouteSettings =
    templateUrl: 'views/root.html',
    controller: ($scope, items)->
      $scope.items = items
    resolve:
      items: (Item)->
        Item.itemsPromise()

  itemRouteSettings =
    templateUrl: 'views/item.html',
    controller: ($scope, item)->
      $scope.item = item
    resolve:
      item: ($route, Item)->
        item_id = $route.current.params.itemId
        Item.itemPromise(item_id)

  $routeProvider
    .when('/', rootsRouteSettings)
    .when('/items/:itemId', itemRouteSettings)
    .otherwise({redirectTo:"/"})]
