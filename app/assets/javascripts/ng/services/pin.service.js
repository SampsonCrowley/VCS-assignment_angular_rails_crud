pins.factory('pinService', [
  'Restangular', 'Auth', '_',
  function(restangular, auth, _) {
    const _rest = restangular.all('pins');
    var _pins = {};

    var _newPin = (pin) => {
      return {
        pin: {
          purchase: (!!pin.purchase),
          description: pin.description,
          item_name: pin.name
        }
      }
    }
    

    var _extend = function _extend() {
      _pins.create = create;
      return _pins;
    }

    var _denormalize = function _denormalize(collection){
      angular.copy({}, _pins);
      for(var i = 0; i < collection.length; i++){
        _pins[collection[i].id] = collection[i];
      }
      return _extend();
    }

    var get = function get(){
      if(_.isEmpty(_pins)){
        return _rest.getList()
          .then(pins => _denormalize(pins));
      }
      return new Promise.resolve(_pins);
    }

    var create = function create(pin) {
      return _rest.post(_newPin(pin))
      .then(pin => _pins[pin.id] = pin);
    }

    return {
      get: get,
      create: create
    }

  }
])
