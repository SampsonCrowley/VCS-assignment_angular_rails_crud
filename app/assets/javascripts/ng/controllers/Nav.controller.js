pins.controller('NavCtrl', ['$scope', 'Auth',
  function($scope, Auth) {
    $scope.signedInUser = function() {
      return !!Auth._currentUser;
    }

    $scope.signOut = function() {
      Auth.logout()
    }
  }]);