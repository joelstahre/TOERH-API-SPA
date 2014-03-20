app.filter('dateConvert', function () {
    return function (string) {

        return String(string).substring(0, 10);
    };
});