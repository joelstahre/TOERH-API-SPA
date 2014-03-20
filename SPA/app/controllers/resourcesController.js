app.controller('ResourcesController', function ($scope, resourcesService, alertsService) {
    alertsService.clearAlerts();
    
    $scope.query = {}
    $scope.queryBy = '$'

    


    $scope.resources;
    $scope.prevlink;
    $scope.nextlink;

    getResources();

    function getResources(url) {
        var resources = resourcesService.getResources(url);

        resources.success(function(res) {
            
            $scope.resources = res[0].resources;
            $scope.prevlink = res[0].links.prev_set_link;
            $scope.nextlink = res[0].links.next_set_link;
            console.log(res[0].resources);

        });

        resources.error(function(err) {
            console.log(err);
        });
    }


    $scope.getResources = function(url) {
        getResources(url);
    }

});