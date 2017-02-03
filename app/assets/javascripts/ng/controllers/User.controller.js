pins.controller('UserCtrl', ['$scope', '$state', 'Auth', '$timeout',
  function($scope, $state, Auth, $timeout) {
    var test = function(){
      Auth.currentUser().then((user) => {
        
        $state.go('pins.new')

      }).catch(err => console.log(err))
    }
    test()

    $scope.$on('devise:login', function(){
      $state.go('pins.new')
    })

    $scope.$on('devise:new-session', function(){
      $state.go('pins.new')
    })


    $scope.login = function(loginForm, loginData) {
      Auth.login(loginData)
        .then(r => $state.go('pins.new'))
        .catch(e => { alert("Invalid Credentials") })
    }
  }]);
