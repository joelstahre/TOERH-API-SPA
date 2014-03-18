app.service('typesService', function ($http, $q, $window) {
    

    this.getTypes = function () {

        var url = 'http://localhost:3000/api/v1/resource_types';

        var config = {
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'Content-Type': 'application/json'
            }
        };


        return $http.get(url, config);

    };



});