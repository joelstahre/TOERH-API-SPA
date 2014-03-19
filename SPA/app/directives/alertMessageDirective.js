app.directive('alertMessages', function (alertsService) {
    return {
        restrict: 'E',
        replace: true,
        template: '<div ng-repeat="msg in messages track by $index">' +
                    '<div class="alert {{msg.type}}">' +
                        '<span class="">{{msg.text}}</span>' +
                        '<button ng-click=closeAlert($index) type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>' + 
                    '</div>' +
                  '</div>',
        scope: true,
        link: function ($scope, element) {
    
            $scope.messages = alertsService.alerts;

            $scope.closeAlert = function(index) {
                $scope.messages.splice(index, 1);
              };
            
        }
    };

});