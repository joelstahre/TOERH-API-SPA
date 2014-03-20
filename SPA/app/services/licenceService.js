app.service('licenceService', function ($http) {
    

    this.getLicences = function () {

        var url = 'http://localhost:3000/api/v1/licences';

        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };


        return $http.get(url, config);

    };



});