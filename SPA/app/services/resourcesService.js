
app.service('resourcesService', function () {
    this.getResources = function () {
        return resources;
    };

    var resources = [
        {
            resource: {
                id: 6,
                title: "Resurs 6",
                desciption: "en beskrivning",
                url: "http://www.joelstahre.com",
                created_at: "2014-02-17T18:26:30.198Z",
                updated_at: "2014-02-17T18:26:30.198Z",
                resource_type: {
                    id: 6,
                    resource_type: "Video"
                },
                licence: {
                    id: 6,
                    licence: "MIT",
                    desciption: "en beskrivning"
                },
                tags: [
                    {
                        id: 4,
                        tag: "Biology",
                        created_at: "2014-02-17T18:26:29.273Z",
                        updated_at: "2014-02-17T18:26:29.273Z"
                    }
                ],
                user: {
                    id: 3,
                    first_name: "Foo",
                    last_name: "Bar",
                    email: "foo@bar.com"
                }
            }
        },
        {
            resource: {
                id: 7,
                title: "Resurs 7",
                desciption: "en beskrivning till",
                url: "http://www.joelstahre.com",
                created_at: "2014-02-17T18:26:30.198Z",
                updated_at: "2014-02-17T18:26:30.198Z",
                resource_type: {
                    id: 6,
                    resource_type: "Video"
                },
                licence: {
                    id: 6,
                    licence: "MIT",
                    desciption: "en beskrivning"
                },
                tags: [
                    {
                        id: 4,
                        tag: "Biology",
                        created_at: "2014-02-17T18:26:29.273Z",
                        updated_at: "2014-02-17T18:26:29.273Z"
                    }
                ],
                user: {
                    id: 3,
                    first_name: "Foo",
                    last_name: "Bar",
                    email: "foo@bar.com"
                }
            }
        }
    ];

});