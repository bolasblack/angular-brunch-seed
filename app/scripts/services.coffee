'use strict'

### Sevices ###

angular.module('app.services', [])

# Wrap `window.alert`, `window.prompt`, `window.confirm`
#
# So make custom dialog component after a long time can be easier,
# because you can override those method.
.factory('$dialog', [ # [[[
  '$window'
  '$q'

($window, $q) ->
  methods =
    alert: (defer, result) ->
      defer.resolve()
    confirm: (defer, result) ->
      deferMethod = if result then 'resolve' else 'reject'
      defer[deferMethod] result
    prompt: (defer, result) ->
      deferMethod = if result? then 'resolve' else 'reject'
      defer[deferMethod] result

  _(methods).map (name, handler) ->
    [
      name
      (options) ->
        defer = $q.defer()
        result = $window[name] options.message, options.defaultText
        handler defer, result
        defer.promise
    ]
  .zipObject().value()

]) # ]]]

