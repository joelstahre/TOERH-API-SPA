
var app = angular.module('toerhApp', ['ngRoute']);

app.config(function ($routeProvider) {
    $routeProvider
        .when('/',
            {
                templateUrl: 'app/partials/start.html'
            })
        .when('/resources',
            {
                controller: 'ResourcesController',
                templateUrl: 'app/partials/resources.html'
            })
        .otherwise({ redirectTo: '/' });
});