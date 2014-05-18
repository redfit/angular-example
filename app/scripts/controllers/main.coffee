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

