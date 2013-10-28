app.filter 'humanize', ()->
  (string)->
    string.charAt(0).toUpperCase() + string.slice(1)
