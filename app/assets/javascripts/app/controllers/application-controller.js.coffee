app.controller "ApplicationController", ['$scope', '$rootScope', 'offlineFlag', '$timeout',  ($scope, $rootScope, offlineFlag, $timeout) ->

  $scope.online = offlineFlag.online

  $rootScope.$on 'onlineStatus', (event, status)->
    $timeout ()->
      $scope.online = status
    , 1, true

  $rootScope.$on '$routeChangeStart', (event, next, current)->

  $rootScope.$on '$routeChangeSuccess', (event, current, previous)->

  $rootScope.$on '$routeChangeError', (event, current, previous, error)->
]
