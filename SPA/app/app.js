
var app = angular.module('toerhApp', ['ngRoute']);

app.config(function ($routeProvider, $locationProvider, $httpProvider) {
    $locationProvider.html5Mode(true);
    $routeProvider.when('/',
            {
                templateUrl: 'app/partials/start.html',
                controller: 'AuthController'
            });

        $routeProvider.when('/resources',
            {
                controller: 'ResourcesController',
                templateUrl: 'app/partials/resources.html'
            });
        $routeProvider.when('/add',
            {
                controller: 'AddController',
                templateUrl: 'app/partials/add.html'
            });
        $routeProvider.when('/edit/:id',
            {
                controller: 'EditController',
                templateUrl: 'app/partials/edit.html'
            });
        $routeProvider.when('/myResources',
            {
                controller: 'MyResourcesController',
                templateUrl: 'app/partials/myResources.html'
            });
        $routeProvider.when('/search/:param',
            {
                controller: 'SearchController',
                templateUrl: 'app/partials/search.html'
            });
        $routeProvider.otherwise({ redirectTo: '/' });

        $httpProvider.defaults.headers.common['Authorization'] = "Token token=513a141f03172e4359ce36a46aae8445";
});
