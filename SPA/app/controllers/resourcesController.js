app.controller('ResourcesController', function ($scope, resourcesService) {

    init();

    function init() {
        $scope.resources = resourcesService.getResources();
    }
});