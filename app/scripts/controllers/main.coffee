'use strict'

angular.module('memomemoApp')
  .controller 'MainCtrl', ($scope) ->
    # 初期値設定
    $scope.markdown = "#test\n##test\n###test\n```\ndef aaa\n  puts 'aaa'\nend\n```"

    # marked.jsのハイライト設定
    marked.setOptions
      highlight: (code) ->
        hljs.highlightAuto(code).value

    # $watchを使ってmarkdownの値を監視
    $scope.$watch 'markdown', ((content) ->
       $scope.preview = marked(content)
    ), true

