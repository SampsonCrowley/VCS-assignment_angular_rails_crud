pins.directive('loginForm', [
  function() {
    return {
      restrict: 'E',
      scope: true,
      templateUrl: 'templates/user/log-in.html'
    }
  }]);