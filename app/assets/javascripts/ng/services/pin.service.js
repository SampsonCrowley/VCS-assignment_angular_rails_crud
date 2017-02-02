pins.factory('pinService', [
  'Restangular', 'Auth', '_',
  (restangular, auth, _) => {
    const _rest = restangular.all('pins');
    var _pins = [];

    var _newPin = (pin) => {
      return {
        pin: {
          purchase: (!!pin.purchase),
          description: pin.description,
          item_name: pin.name
        }
      }
    }

    var _extend = (pins) => {
      pins.create = (pin) => {
        return rest.post(_newPin(pin))
        .then(pin => _pins.unshift(pin));
      }
    }

    restangular.extendCollection('pins', _extend)

    var get = () => {
      if(_.isEmpty(_pins)){
        return rest.getList().then(pins => return angular.copy(pins, _pins);
      }
      return new Promise.resolve(_pins);
    }

    return {
      get: get
    }

  }
])
