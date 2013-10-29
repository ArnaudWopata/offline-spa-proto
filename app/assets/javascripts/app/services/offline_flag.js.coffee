app.service 'offlineFlag', ($rootScope)->

  $(window).bind 'online', (event, data)->
    this.online = true
    $rootScope.$broadcast 'onlineStatus', true
    $rootScope.$broadcast 'online', true
    $rootScope.$broadcast 'offline', false

  $(window).bind 'offline', (event, data)->
    this.online = false
    $rootScope.$broadcast 'onlineStatus', false
    $rootScope.$broadcast 'online', false
    $rootScope.$broadcast 'offline', true

  this.online = window.navigator.onLine

