
app.service('resourcesService', function ($http, $q, $window) {
    
    var baseApiURL = 'http://secret-mesa-8573.herokuapp.com/api/v1';

    var config = {
        headers: {
            'Content-Type': 'application/json'
        }
    };

    this.getResources = function (url) {
        url = url || baseApiURL + '/resources';

        return $http.get(url, config);
    };

    this.getResource = function (id) {
        var url =  baseApiURL + '/resources/' + id;

        return $http.get(url, config);

    };

    this.deleteResource = function(resource) {
        var url = baseApiURL + '/resources/' + resource.id;

        config.headers['X-Access-Token'] =  $window.sessionStorage.token;

        return $http.delete(url, config);
    }

    this.updateResource = function(resource) {
        
        config.headers['X-Access-Token'] =  $window.sessionStorage.token;

        return $http.put(baseApiURL + '/resources/' + resource.id, resource, config);
    }

    this.addResource = function(resource) {

        config.headers['X-Access-Token'] =  $window.sessionStorage.token;

        return $http.post(baseApiURL + '/resources', resource, config);
    }


});