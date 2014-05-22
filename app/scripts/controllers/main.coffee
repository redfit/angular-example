'use strict'

angular.module('memomemoApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.markdown = "#test\n##test\n###test\n```\ndef aaa\n  puts 'aaa'\nend\n```"

  .filter 'preview', ($sce)->
    marked.setOptions
      highlight: (code) ->
        hljs.highlightAuto(code).value
    return (input) ->
      # inputにfilter対象がはいっているので
      # 変換して返却するだけ
      marked(input)


