pins.directive('newPin', [ 'pinService',
  function(pinService){
    var _setup = function(s){
      s.createPin = function createPin(valid, data, form){
        pinService.create(data).then((pin) => {
          angular.copy({}, data);
          form.$setPristine()
          form.$setUntouched()
        })
        .catch(err => alert(err));
      }
    }
    
    return {
      restrict: 'E',
      scope: true,
      templateUrl: 'templates/directives/new-pin.html',
      link: _setup
    }
  }
])
