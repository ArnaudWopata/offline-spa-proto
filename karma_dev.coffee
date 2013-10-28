# Karma configuration
# Generated on Tue Sep 03 2013 10:56:00 GMT+0200 (CEST)

module.exports = (config) ->

  sharejs_server_url = process.env.SHARE_SERVER_URL || 'http://localhost:3000'

  config.set

    # base path, that will be used to resolve all patterns, eg. files, exclude
    basePath: ''

    # frameworks to use
    frameworks: ['jasmine']

    # preprocessors: {
    #   '**/*.html': ['ng-html2js']
    # }

    # list of files / patterns to load in the browser
    files: [
      # 3rd party, start with main
      'vendor/assets/javascripts/jquery.js'
      'vendor/assets/javascripts/rangyinputs_jquery.js'
      'vendor/assets/javascripts/autosize.js'
      'vendor/assets/javascripts/chai.js'
      'vendor/assets/javascripts/jquery-keyboard-event.js'
      sharejs_server_url + "/channel/bcsocket.js"
      sharejs_server_url + "/share/share.js"
      sharejs_server_url + "/share/textarea.js"
      sharejs_server_url + "/share/json.js"
      'vendor/assets/javascripts/angular/angular.js'
      'vendor/assets/javascripts/angular/*.js'

      # App
      'app/assets/javascripts/app/main.js.coffee'
      'app/assets/javascripts/config/test_constants.coffee'
      'app/assets/javascripts/app/services/*.coffee'
      'app/assets/javascripts/app/resources/*.coffee'
      'app/assets/javascripts/app/directives/*.coffee'

      # Tests
      'app/assets/javascripts/spec/shared.coffee'
      'app/assets/javascripts/spec/**/*.coffee'
    ]

    # list of files to exclude
    exclude: [

    ]

    # test results reporter to use
    # possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['dots']

    # web server port
    port: 9876

    # enable / disable colors in the output (reporters and logs)
    colors: true

    # level of logging
    # possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO

    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true

    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: ['Chrome', 'Firefox', 'Safari', 'Opera']

    # If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: false
