'use strict'

angular.module('memomemoApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.markdown = "#test\n##test\n###test\n```\ndef aaa\n  puts 'aaa'\nend\n```"

    marked.setOptions
      highlight: (code) ->
        hljs.highlightAuto(code).value

    $scope.$watch 'markdown', ((content) ->
       $scope.preview = marked(content)
    ), true

  .directive "fuvatar", (md5) ->
    email = "d.fuchiwaki@everyleaf.com"
    return {
      restrict: "E"
      replace: true
      template: "<img src='{{ src }}' class=\"thumbnail\"/>"
      link: (scope, element, attrs) ->
        hash = md5.createHash(email.toLowerCase())  if angular.isDefined(email) && !(angular.equals(email, null))
        scope.src = "https://secure.gravatar.com/avatar/#{hash}?s=200&d=mm"
    }

