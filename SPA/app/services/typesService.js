app.service('typesService', function ($http, $q, $window) {
    

    this.getTypes = function () {

        var url = 'http://localhost:3000/api/v1/resource_types';

        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };


        return $http.get(url, config);

    };



});