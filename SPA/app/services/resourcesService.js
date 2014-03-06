
app.service('resourcesService', function ($http, $q) {
    
    this.getResources = function (url) {

        url = url || 'http://localhost:3000/api/v1/resources';

        var task = $q.defer();
    
        var config = {
            url: url,
            method: 'GET',
            headers: {
                'Authorization': 'Token token=329e4d040dfd4942bdd2bea73996d399',
                'Content-Type': 'application/json'
            }
        };

        var p = $http(config);
        p.success(function(data, status, headers, config){
            //console.log('Success: ' + JSON.stringify(data));
            //console.log(data);
            task.resolve(data);
        });

        p.error(function(data){
            //console.log(data);
            task.reject('Det blev fel');
        });

        return task.promise;

    };


});