app.service('licenceService', function ($http) {
    
    var baseApiURL = 'http://secret-mesa-8573.herokuapp.com/api/v1';

    this.getLicences = function () {

        var url = baseApiURL + '/licences';

        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };


        return $http.get(url, config);

    };



});