pins.directive('pin', function(){
  return {
    restrict: "A",
    scope:{
      pin: "="
    },
    templateUrl: "templates/directives/pin.html"
  }
})
