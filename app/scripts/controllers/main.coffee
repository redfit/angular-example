'use strict'

angular.module('memomemoApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.markdown = "#test\n##test\n###test\n```\ndef aaa\n  puts 'aaa'\nend\n```"
    # 対象のemailを設定
    $scope.email = "d.fuchiwaki@everyleaf.com"
    # ボタン押下時の処理を作成
    $scope.test = ->
      console.log "test"
      alert "controller function"

    marked.setOptions
      highlight: (code) ->
        hljs.highlightAuto(code).value

    $scope.$watch 'markdown', ((content) ->
       $scope.preview = marked(content)
    ), true

  .directive "profileWithGravatar", (md5) ->
    return {
      restrict: "E"
      replace: true
      # HTML側で設定された文字列をテンプレート内に挿入するか
      transclude: true
      # HTML側で設定された文字列をテンプレート内に挿入するか
      # '@' 子scopeのプロパティ値をディレクティブのDOM属性値と紐付ける
      # '=' 子scopeのプロパティを親scopeのプロパティと双方向バインディングで紐付ける
      # '&' 子scopeのプロパティにAngularのExpression関数を紐付ける
      scope: {
        email: "="
        name: "@"
        test: "&alert" # 別名を浸かられる
      }
      template: "<div class=\"row\">\n<div class=\"col-md-4\">\n  <div class=\"thumbnail\">\n    <img src=\'{{ src }}\' class=\"thumbnail\"/>\n    <div class=\"caption\">\n      <h3>{{ name }}</h3>\n      <p ng-transclude></p>\n      <p><a ng-click=\"test()\" class=\"btn btn-primary\" role=\"button\">Button</a></p>\n    </div>\n  </div>\n</div>\n</div>"
      link: (scope, element, attrs) ->
        # scopeからemailを取得
        email = scope.email
        hash = md5.createHash(email.toLowerCase())  if angular.isDefined(email) && !(angular.equals(email, null))
        scope.src = "https://secure.gravatar.com/avatar/#{hash}?s=200&d=mm"
    }

