
app.service('resourcesService', function ($http, $q, $window) {
    

    this.getResources = function (url) {
        url = url || 'http://localhost:3000/api/v1/resources';

        var config = {
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'Content-Type': 'application/json'
            }
        };

        return $http.get(url, config);

    };

    this.getResource = function (id) {
        var url =  'http://localhost:3000/api/v1/resources/' + id;

        var config = {
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'Content-Type': 'application/json'
            }
        };

        return $http.get(url, config);

    };

    this.deleteResource = function(resource) {
        var url = 'http://localhost:3000/api/v1/resources/' + resource.resource.id;


        var config = {
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'X-Access-Token': $window.sessionStorage.token,
                'Content-Type': 'application/json'
            }
        };

        return $http.delete(url, config);

    }

    this.updateResource = function(resource) {
        
        var config = {
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'X-Access-Token': $window.sessionStorage.token,
                'Content-Type': 'application/json'
            }
        };

        return $http.put('http://localhost:3000/api/v1/resources/' + resource.id, resource, config);
    }

    this.addResource = function(resource) {

        var config = {
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'X-Access-Token': $window.sessionStorage.token,
                'Content-Type': 'application/json'
            }
        };

        return $http.post('http://localhost:3000/api/v1/resources', resource, config);
 
    }


});