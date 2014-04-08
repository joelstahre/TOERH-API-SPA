app.controller('MyResourcesController', function ($scope, resourcesService, $window, $location, alertsService) {
    alertsService.clearAlerts();

    var id = $window.sessionStorage.id;
    var url = 'http://secret-mesa-8573.herokuapp.com/api/v1/users/' + id + '/resources';

    $scope.resources;
    $scope.prevlink;
    $scope.nextlink;

    getResources(url);

    function getResources(url) {
        $scope.resources = [];

        var resources = resourcesService.getResources(url);

        resources.success(function(res) {

            angular.forEach(res[0].resources, function(resource, i) {
                $scope.resources.push(resource.resource);
            });

            $scope.prevlink = res[0].links.prev_set_link;
            $scope.nextlink = res[0].links.next_set_link;
        });

        resources.error(function(err) {
            console.log(err);
        });
    }


    $scope.getResources = function(url) {
        getResources(url);
    }

    $scope.deleteResource = function(resource) {
        
        var resource = resourcesService.deleteResource(resource);

        resource.success(function(res) {

            //Update View
            getResources(url);

            alertsService.add({
                text: 'Successfully deleted rescource',
                type: 'alert-success'
            });

        });

        resource.error(function(err) {
            console.log(err);
        });
    }

    $scope.editResource = function(resource) {
        $location.url('/edit/' + resource.id);
    }

});