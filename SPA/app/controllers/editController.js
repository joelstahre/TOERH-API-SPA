app.controller('EditController', function ($scope, resourcesService, typesService, licenceService, $routeParams, $window) {

    var id = $routeParams.id

    getResource(id);

    function getResource(id) {
        var resource = resourcesService.getResource(id);

        resource.success(function(res) {
            $scope.resource = res.resource;
           // console.log(res.resource);

        });

        resource.error(function(err) {
            console.log(err);
        });
    }



    getTypes();
    getLicences();

    //TODO: Fix dropdowns
    function getTypes() {
        var types = typesService.getTypes();

        types.success(function(res) {
            $scope.types = res[0].resource_types;
            $scope.type = $scope.types[0];
            
        });

        types.error(function(err) {
            console.log(err);
        });
    }

    function getLicences() {
        var licences = licenceService.getLicences();

        licences.success(function(res) {
            $scope.licences = res[0].licences;
            $scope.licence = $scope.licences[0];

        });

        licences.error(function(err) {
            console.log(err);
        });
    }



    $scope.save = function() {

        $scope.resource.user_id = $window.sessionStorage.id;

        $scope.resource.resource_type_id = $scope.type.resource_type.id;
        $scope.resource.licence_id = $scope.licence.licence.id;
        $scope.resource.tags = [1, 2];


        var rescource = resourcesService.updateResource($scope.resource);

        rescource.success(function(res) {
            console.log(res);
        });

        rescource.error(function(err) {
            console.log(err);
        });

    }


});

