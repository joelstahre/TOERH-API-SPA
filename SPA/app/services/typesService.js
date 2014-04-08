app.service('typesService', function ($http, $q, $window) {
    
    var baseApiURL = 'http://secret-mesa-8573.herokuapp.com/api/v1';

    var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };

    this.getTypes = function () {

        var url = baseApiURL + '/resource_types';

        return $http.get(url, config);

    };



});