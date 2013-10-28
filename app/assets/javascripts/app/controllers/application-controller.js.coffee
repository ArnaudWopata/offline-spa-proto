app.controller "ApplicationController", ['$routeScope', ($routeScope) ->

  $rootScope.$on '$routeChangeStart', (event, next, current)->
    console.log 'routeChangeStart'

  $rootScope.$on '$routeChangeSuccess', (event, current, previous)->
    console.log 'routeChangeSuccesss'

  $rootScope.$on '$routeChangeError', (event, current, previous, error)->
    console.log 'routeChangeError', error
]
