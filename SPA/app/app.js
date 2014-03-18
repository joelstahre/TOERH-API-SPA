
var app = angular.module('toerhApp', ['ngRoute']);

app.config(function ($routeProvider, $locationProvider ) {
    $locationProvider.html5Mode(true);
    $routeProvider
        .when('/',
            {
                templateUrl: 'app/partials/start.html',
                controller: 'AuthController'
            })
        .when('/resources',
            {
                controller: 'ResourcesController',
                templateUrl: 'app/partials/resources.html'
            })
        .when('/add',
            {
                controller: 'AddController',
                templateUrl: 'app/partials/add.html'
            })
        .when('/edit/:id',
            {
                controller: 'EditController',
                templateUrl: 'http://localhost:8080/app/partials/edit.html'
            })
        .when('/myResources',
            {
                controller: 'MyResourcesController',
                templateUrl: 'app/partials/myResources.html'
            })
        .otherwise({ redirectTo: '/' });
});
