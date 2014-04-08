app.controller('AddController', function ($scope, resourcesService, typesService, licenceService, $window, alertsService) {
    alertsService.clearAlerts();

    getTypes();
    getLicences();

    function getTypes() {
        var types = typesService.getTypes();

        types.success(function(res) {
            $scope.types = res[0].resource_types;
            $scope.type = $scope.types[0];
        });

        types.error(function(err) {
            console.log(err);
        });
    };

    function getLicences() {
        var licences = licenceService.getLicences();

        licences.success(function(res) {
            $scope.licences = res[0].licences;
            $scope.licence = $scope.licences[0];
        });

        licences.error(function(err) {
            console.log(err);
        });
    };


    $scope.save = function() {

        $scope.resource.user_id = $window.sessionStorage.id;

        $scope.resource.resource_type_id = $scope.type.resource_type.id;
        $scope.resource.licence_id = $scope.licence.licence.id;
        $scope.resource.tags = $scope.resource.tags.split(',');

        var rescource = resourcesService.addResource($scope.resource);

        rescource.success(function(res) {
            console.log('Successfully created rescource');
            $scope.resource = '';
            alertsService.add({
                text: 'Successfully created rescource',
                type: 'alert-success'
            });

        });

        rescource.error(function(err) {
            console.log(err);
        });
    };

});