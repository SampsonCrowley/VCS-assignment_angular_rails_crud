pins.controller('NewPinCtrl', [
  '$scope', '$state', 'Auth',
  function($scope, $state, Auth){
    if(!(Auth._currentUser)){
      $state.go('user');
    }

    $scope.$on('devise:logout', function() {
      console.log("logout");
      $state.go('user')
    })
  }
])
