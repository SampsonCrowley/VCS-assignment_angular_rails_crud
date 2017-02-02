pins.factory('pinService', [
  'Restangular', 'Auth', '_',
  (restangular, auth, _) => {
    const _rest = restangular.all('pins');
    var _pins;

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
        return _rest.post(_newPin(pin))
        .then(pin => _pins.unshift(pin));
      }
      console.log(pins)
      return pins;
    }

    restangular.extendCollection('pins', _extend)

    var get = () => {
      if(!_pins){
        console.log('getting list')
        return _rest.getList().then(pins => _pins = pins);
      }
      return new Promise.resolve(_pins);
    }

    return {
      get: get
    }

  }
])
