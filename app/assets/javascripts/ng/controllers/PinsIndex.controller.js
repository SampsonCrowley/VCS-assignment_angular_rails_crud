pins.controller('PinsIndexCtrl', ['$scope', 'pinService',
  function($scope, pinService) {
    pinService.get().then(pins => $scope.pins = pins)

  }]);
