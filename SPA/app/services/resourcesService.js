
app.service('resourcesService', function ($http, $q, $window) {
    
    var baseApiURL = 'http://secret-mesa-8573.herokuapp.com/api/v1';

    this.getResources = function (url) {
        url = url || baseApiURL + '/resources';

        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };

        return $http.get(url, config);

    };

    this.getResource = function (id) {
        var url =  baseApiURL + 'resources/' + id;

        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        };

        return $http.get(url, config);

    };

    this.deleteResource = function(resource) {
        var url = baseApiURL + '/resources/' + resource.resource.id;


        var config = {
            headers: {
                'X-Access-Token': $window.sessionStorage.token,
                'Content-Type': 'application/json'
            }
        };

        return $http.delete(url, config);

    }

    this.updateResource = function(resource) {
        
        var config = {
            headers: {
                'X-Access-Token': $window.sessionStorage.token,
                'Content-Type': 'application/json'
            }
        };

        return $http.put(baseApiURL + '/resources/' + resource.id, resource, config);
    }

    this.addResource = function(resource) {

        var config = {
            headers: {
                'X-Access-Token': $window.sessionStorage.token,
                'Content-Type': 'application/json'
            }
        };

        return $http.post(baseApiURL + '/resources', resource, config);
 
    }


});