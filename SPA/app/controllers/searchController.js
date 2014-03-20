app.controller('SearchController', function ($scope, resourcesService, alertsService, $location, $routeParams) {
    alertsService.clearAlerts();
    
    var param = $routeParams.param;
    var url = 'http://localhost:3000/api/v1/resources?search=' + param;

    if(param) {
        $scope.searchParam = param;
        getResources(url);
    }

    $scope.resources;
    $scope.prevlink;
    $scope.nextlink;


    function getResources(url) {
        var resources = resourcesService.getResources(url);

        resources.success(function(res) {
            
            $scope.resources = res[0].resources;
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