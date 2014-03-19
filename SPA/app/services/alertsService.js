app.service('alertsService', function () {
    this.alerts = [];

    this.add = function (message) {
        this.alerts.push(message);
    };

    this.clearAlerts = function() {
        while (this.alerts.length > 0) {
            this.alerts.pop();
          }
    }
    
});