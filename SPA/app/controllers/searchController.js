app.controller('SearchController', function ($scope, resourcesService, alertsService, $location, $routeParams) {
    alertsService.clearAlerts();
    
    var param = $routeParams.param;
    var url = 'http://secret-mesa-8573.herokuapp.com/api/v1/resources?search=' + param;

    if(param) {
        $scope.searchParam = param;
        getResources(url);
    }

    $scope.resources;
    $scope.prevlink;
    $scope.nextlink;

    $scope.resources = [];

    function getResources(url) {
        var resources = resourcesService.getResources(url);

        resources.success(function(res) {
            
            angular.forEach(res[0].resources, function(resource, i) {
                $scope.resources.push(resource.resource);
            });


            console.log($scope.resources);
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

    $scope.searchBox = function(param) {
        $location.url('/search/' + param);
    }

});