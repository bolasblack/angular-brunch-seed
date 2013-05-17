# Karma configuration

module.exports = (config) ->
  config.set

    # register plugins
    plugins: [
      'karma-mocha'
      'karma-chai'
      'karma-chrome-launcher'
      'karma-coffee-preprocessor'
    ]

    # base path, that will be used to resolve all patterns, eg. files, exclude
    basePath: '..'

    # frameworks to use
    frameworks: ['mocha', 'chai']

    # list of files / patterns to load in the browser
    files: [
      'public/js/vendor.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'public/js/app.js'
      'test/unit/**/*Spec.coffee'
    ]

    # list of files to exclude
    exclude: []

    # test results reporter to use
    # possible values: 'dots', 'progress', 'junit', 'growl', 'coverage'
    reporters: ['progress']

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
    browsers: ['Chrome']

    # If browser does not capture in given timeout [ms], kill it
    captureTimeout: 60000

    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: false
