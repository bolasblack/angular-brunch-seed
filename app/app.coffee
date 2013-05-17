'use strict'

# Declare app level module which depends on filters, and services
angular.module('app', [
  'ngRoute'

  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
])

.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider) ->
  $routeProvider
    .when('/', templateUrl: 'partials/home.html')

    .otherwise redirectTo: '/'

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false).hashPrefix("!")
])

angular.element(document).ready ->
  angular.bootstrap(document, ['app'])

