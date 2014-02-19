#TOERH API Dokumentation



### Users
Users own resources

| Resources                                                 | Description                                                   |
| :---------------------------------------------------------|:--------------------------------------------------------------|
| [GET /api/v1/users][1]                                    | Get all users                                                 |
| [GET /api/v1/users/:id][2]                                | Get user by id                                                |
| [POST /api/v1/users][3]                                   | Create a new user                                             |
| [PUT /api/v1/users/:id][4]                                | Update a user by  id                                          |
| [DELETE /api/v1/users/:id][5]                             | Delete a user by id                                           |


### Resoureces
Resources belongs to users, it has a licens type, resource type, and can hav many tags

| Resources                                                 | Description                                                   |
| :---------------------------------------------------------|:--------------------------------------------------------------|
| GET /api/v1/resources                                     | Get all rescources                                            |
| GET /api/v1/users/:id/resources                           | Get all resources that belongs to a specific user             |
| GET /api/v1/resource_types/:resource_type_id/resources    | Get all resources that has the specific resourcetype          |
| GET /api/v1/licences/:licence_id/resources                | Get all resources that has the specific license               |
| GET /api/v1/tags/:tag_id/resources                        | Get all resources that has the specific tag                   |
| GET /api/v1/resources/:id                                 | Get resource by id                                            |
| POST /api/v1/resources                                    | Create a new resource                                         |
| PUT /api/v1/resources/:id                                 | Update a resource by id                                       |
| DELETE /api/v1/resources/:id                              | Delere a resource by id                                       |


### Licenses
Licenses

| Resources                                                 | Description                                                   |
| :---------------------------------------------------------|:--------------------------------------------------------------|
| GET /api/v1/licences                                      | Get all licenses                                              |
| GET /api/v1/licences/:id                                  | Get license by id                                             |


### ResourceTypes
ResourceTypes

| Resources                                                 | Description                                                   |
| :---------------------------------------------------------|:--------------------------------------------------------------|
| GET /api/v1/resource_types                                | Get all ResourceTypes                                         |
| GET /api/v1/resource_types/:id                            | Get ResourceType by id                                        |


### Tags
A tag can belong to many resources, and resources can have many tags

| Resources                                                 | Description                                                   |
| :---------------------------------------------------------|:--------------------------------------------------------------|
| GET /api/v1/tags                                          | Get all Tags                                                  |
| GET /api/v1/resources/:resource_id/tags                   | Get all tags that belongs to a specific resource              |
| GET /api/v1/tags/:id                                      | Get tag by id                                                 |

### Example responses for Tags

#### GET /api/v1/tags

``` 

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched all Tags",
            "count": 2
        },
        "tags": [
            {
                "tag": {
                    "id": 1,
                    "tag": "Biology",
                    "created_at": "2014-02-17T18:26:28.829Z",
                    "updated_at": "2014-02-17T18:26:28.829Z",
                    "links": {
                        "self_link": "http://example:3000/api/v1/tags/1"
                    }
                }
            },
            {
                "tag": {
                    "id": 2,
                    "tag": "science",
                    "created_at": "2014-02-17T18:26:28.971Z",
                    "updated_at": "2014-02-17T18:26:28.971Z",
                    "links": {
                        "self_link": "http://example/api/v1/tags/2"
                    }
                }
            }
        ]
    }
    
```

#### GET /api/v1/resources/:resource_id/tags

```

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched all Tags that belongs to a specific Resource",
            "count": 1
        },
        "tags": [
            {
                "tag": {
                    "id": 2,
                    "tag": "science",
                    "created_at": "2014-02-17T18:26:29.273Z",
                    "updated_at": "2014-02-17T18:26:29.273Z",
                    "links": {
                        "self_link": "http://example:3000/api/v1/tags/2"
                    }
                }
            }
        ]
    }

```