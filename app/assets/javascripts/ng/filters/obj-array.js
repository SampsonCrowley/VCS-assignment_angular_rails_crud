pins.filter('objArray', function() {
  return function(obj) {
    var array = [];
    for(var id in obj) {
      array.push(obj[id]);
    }
    return array;
  }
})