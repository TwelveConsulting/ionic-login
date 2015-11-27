angular.module('starter', ['ionic', 'oauth'])
.run ($ionicPlatform)->
  $ionicPlatform.ready ->
    console.log 'App Started in coffee !'
    if window.cordova && window.cordova.plugins.Keyboard
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
    if window.StatusBar
      StatusBar.styleDefault()
.config ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise('/')
  $stateProvider
    .state('index',
      url: '/?access_token'
      templateUrl: 'templates/index.html'
      controller: 'indexCtrl',
      controllerAs: 'c'
    )
    .state('/twelve',
      url: '/twelve'
      templateUrl: 'templates/twelve.html'
    )
.run ($location, AccessToken)->
  hash = $location.path().substr(1)
  AccessToken.setTokenFromString(hash)

.controller 'indexCtrl', ($scope)->
  this.oauth_id = $('body').data('oauth-id')
  this.oauth_app = '//' + $('body').data('oauth-domain')
  this.redirect = 'http://'+ window.location.host
