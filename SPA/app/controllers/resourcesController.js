app.controller('ResourcesController', function ($scope, resourcesService) {

    $scope.resources;
    $scope.prevlink;
    $scope.nextlink;

    init();

    function init() {
        resourcesService.getResources().then(success, error);
    }


    $scope.getResources = function(test) {
        resourcesService.getResources(test).then(success, error);
    }


    function success(res) {
        $scope.resources = res[0].resources;
        $scope.prevlink = res[0].links.prev_set_link;
        $scope.nextlink = res[0].links.next_set_link;

        console.log(res);
    }

    function error(msg) {
        console.log(msg);
    }

});