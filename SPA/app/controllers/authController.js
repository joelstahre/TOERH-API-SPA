app.controller('AuthController', function ($scope, $location, $window, alertsService) {
    alertsService.clearAlerts();
    
    init();

    function init() {

        if (($location.search()).auth_token) {
            login();
        }
    }

    function login() {
        var auth_token = ($location.search()).auth_token;
        var token_expires = ($location.search()).token_expires;
        var username = ($location.search()).username;
        var id = ($location.search()).id;
        
        console.log('Auth-token: ' + auth_token + ' token_expires: ' + token_expires + ' username: ' + username + ' id: ' + id);

        $window.sessionStorage.token = auth_token;
        $window.sessionStorage.token_expires = token_expires;
        $window.sessionStorage.username = username;
        $window.sessionStorage.id = id;

        $location.url('/');
    }

    $scope.isLoggedIn = function() {
        return ($window.sessionStorage.hasOwnProperty('token')) ? true : false;  
    };

    $scope.signout = function() {
        delete $window.sessionStorage.token;
        delete $window.sessionStorage.username;
        $location.url('/');  
    };

});