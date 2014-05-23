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

  # md5ハッシュの.jsを注入する
  .directive "fuchivatar", (md5) ->
    # 自分のemail を設定
    email = "d.fuchiwaki@everyleaf.com"
    return {
      # A: attribute <any fuvatar>
      # E: element   <fuvatar></fuvatar>
      # C: class     <any class="fuvatar">
      # "AEC" と複数指定可能
      restrict: "E"
      # タグをまるごと入れ替えるかどうか
      replace: true
      # テンプレート指定(htmlを直接指定出来ます)
      templateUrl: "views/_gravatar.html"
      # タグとの紐付け
      link: (scope, element, attrs) ->
        hash = md5.createHash(email.toLowerCase())  if angular.isDefined(email) && !(angular.equals(email, null))
        scope.src = "https://secure.gravatar.com/avatar/#{hash}?s=200&d=mm"
    }

