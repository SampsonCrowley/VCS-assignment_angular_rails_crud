var _ = window.Lodash
var pins = angular.module('pins', ['ui.router', 'Devise', 'restangular'])

pins.constant('_', _)

pins.config(
  ["$httpProvider",
  function($httpProvider) {
    var token = angular.element('meta[name=csrf-token]')
      .attr('content');
    $httpProvider
      .defaults
      .withCredentials = true;
      
    $httpProvider
      .defaults
      .headers
      .common['X-CSRF-Token'] = token;
  }]);

pins.config(['RestangularProvider', function(RestangularProvider) {
  RestangularProvider.setBaseUrl("/api/v1");
  RestangularProvider.setRequestSuffix('.json');
  RestangularProvider.setDefaultHttpFields({
    'content-type' : 'application/json'
  });
}]);

pins.config(['AuthProvider', function(AuthProvider) {
  // AuthProvider.loginPath('/users/sign_in.json');
  AuthProvider.loginMethod('POST');
  AuthProvider.resourceName('user');
}]);

pins.config(['$stateProvider', '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.otherwise('/user');

    $stateProvider
      .state('main', {
        url: "/",
        abstract: true,
        views: {
          'pins' : {
            templateUrl: 'templates/pins/index.html',
            controller: 'PinsIndexCtrl'
          },
          'user' : {
            template: '<ui-view/>',
          },
          'nav' : {
            templateUrl: 'templates/nav.html',
            controller: 'NavCtrl'
          }
        }
      })
      .state('pins', {
        parent: 'main',
        abstract: true,
        url: 'pins',
        template: '<ui-view/>'
      })
      .state('pins.new', {
        url: '',
        template: '<new-pin></new-pin>',
        controller: 'NewPinCtrl'
      })
      .state('pins.show', {
        url: '/:id',
        template: 'show'
      })
      .state('user', {
        parent: 'main',
        url: 'user',
        templateUrl: '/templates/user.html',
        controller: 'UserCtrl'
      })

  }]);
