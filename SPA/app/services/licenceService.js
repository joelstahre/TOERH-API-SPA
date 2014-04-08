app.service('licenceService', function ($http) {
    
    var baseApiURL = 'http://secret-mesa-8573.herokuapp.com/api/v1';
    var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };
        
    this.getLicences = function () {

        var url = baseApiURL + '/licences';

        return $http.get(url, config);

    };



});