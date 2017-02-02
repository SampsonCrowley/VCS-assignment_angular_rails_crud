pins.controller('UserCtrl', ['$scope', 'Auth',
  function($scope, Auth) {
    Auth.currentUser()
      .then(function(user) {
        $scope.currentUser = user;
      })
      .catch(function() {
        $scope.currentUser = null;
      })

    $scope.login = function(loginForm, loginData) {

      Auth.login(loginData).then(function(r) { console.log(r)})
    }
  }]);