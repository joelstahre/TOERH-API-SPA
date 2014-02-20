#TOERH API Documentation


**When making requests, make sure yo add your auth_token in the Authorization header**

**ex.**

**Authorization: Token token="xxxXXXxXxxxXxXxxXXXxx"**

**Default format i json, if you want xml, do .xml after the request url**

### Users
Users own resources

| Resources                                                 | Description                    |
| :---------------------------------------------------------|:-------------------------------|
| [GET /api/v1/users](#get-apiv1users)                      | Get all users                  | 
| [GET /api/v1/users/:id](#get-apiv1usersid)                | Get user by id                 |    
| [POST /api/v1/users](#post-apiv1users)                    | Create a new user              |
| [PUT /api/v1/users/:id](#put-apiv1usersid)                | Update a user by  id           |
| [DELETE /api/v1/users/:id](#delete-apiv1usersid)          | Delete a user by id            |


### Resoureces
Resources belongs to users, it has a licens type, resource type, and can have many tags

| Resources                                                                                                   | Description                                            |
| :-----------------------------------------------------------------------------------------------------------|:-------------------------------------------------------|
| [GET /api/v1/resources](#get-apiv1resources-)                                                               | Get all rescources                                     |
| [GET /api/v1/users/:id/resources](#get-apiv1usersidresources)                                               | Get all resources that belongs to a specific user      |
| [GET /api/v1/resource_types/:resource_type_id/resources](#get-apiv1resource_typesresource_type_idresources) | Get all resources that has the specific resourcetype   |
| [GET /api/v1/licences/:licence_id/resources](#get-apiv1licenceslicence_idresources)                         | Get all resources that has the specific license        |
| [GET /api/v1/tags/:tag_id/resources](#get-apiv1tagstag_idresources)                                         | Get all resources that has the specific tag            |
| [GET /api/v1/resources/:id](#get-apiv1resourcesid)                                                          | Get resource by id                                     |
| [POST /api/v1/resources](#post-apiv1resources)                                                              | Create a new resource                                  |
| [PUT /api/v1/resources/:id](#put-apiv1resourcesid)                                                          | Update a resource by id                                |
| [DELETE /api/v1/resources/:id](#delete-apiv1resourcesid)                                                    | Delete a resource by id                                |


### Licenses
Licenses

| Resources                                                 | Description           |
| :---------------------------------------------------------|:----------------------|
| [GET /api/v1/licences](#get-apiv1licences)                | Get all licenses      |
| [GET /api/v1/licences/:id](#get-apiv1licencesid-)         | Get license by id     |


### ResourceTypes
ResourceTypes

| Resources                                                                         | Description                |
| :---------------------------------------------------------------------------------|:---------------------------|
| [GET /api/v1/resource_types](#get-apiv1resource_types)                            | Get all ResourceTypes      |
| [GET /api/v1/resource_types/:id](#get-apiv1resource_typesid-)                     | Get ResourceType by id     |


### Tags
A tag can belong to many resources, and resources can have many tags

| Resources                                                                         | Description                                         |
| :---------------------------------------------------------------------------------|:----------------------------------------------------|
| [GET /api/v1/tags](#get-apiv1tags)                                                | Get all Tags                                        |
| [GET /api/v1/resources/:resource_id/tags](#get-apiv1resourcesresource_idtags)     | Get all tags that belongs to a specific resource    |
| [GET /api/v1/tags/:id](#get-apiv1tagsid)                                          | Get tag by id                                       |
| [POST /api/v1/tags](#post-apiv1tags)                                               | Create a ny Tag                                     |   

### Parameters
In some request you can pass parameters

| Parameters                   | Description                                          |
| :----------------------------|:-----------------------------------------------------|
| limit                        | How many results you get in one request (default 10) |
| offset                       | What should the offset be (default 0)                |
| search                       | search for a resource title or user last name        |


### Example responses for Users
------

#### [GET /api/v1/users]()

**PARAMETERS**

limit, offset, search (lastname)
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all Users",
                "count": 2,
                "limit": 2,
                "offset": 0
            },
            "users": [
                {
                    "user": {
                        "id": 11,
                        "first_name": "John",
                        "last_name": "Doe",
                        "email": "john@doe.com",
                        "created_at": "2014-02-18T04:20:49.844Z",
                        "updated_at": "2014-02-18T04:21:25.050Z"
                    }
                },
                {
                    "user": {
                        "id": 10,
                        "first_name": "Kalle",
                        "last_name": "Anka",
                        "email": "kalle@anka.com",
                        "created_at": "2014-02-18T01:42:54.082Z",
                        "updated_at": "2014-02-18T01:54:47.598Z"
                    }
                }
            ],
            "links": {
                "prev_set_link": "http://example/api/v1/users?limit=2&offset=0",
                "next_set_link": "http://example/api/v1/users?limit=2&offset=2"
            }
        }
    ]

``` 

#### [GET /api/v1/users/:id]()
``` 

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched User"
        },
        "user": {
            "id": 11,
            "first_name": "John",
            "last_name": "Doe",
            "email": "john@doe.com",
            "created_at": "2014-02-17T18:26:27.620Z",
            "updated_at": "2014-02-17T18:26:27.620Z"
        },
        "links": {
            "self_link": "http://example/api/v1/users/1",
            "user_resources_link": "http://example/api/v1/users/1/resources"
        }
    }


```

#### [POST /api/v1/users]()
Request
``` 

    {
      "first_name": "Jane",
      "last_name": "Doe",
      "email": "jane@doe.com"
    }

``` 

Response
``` 

    {
        "response": {
            "code": 201,
            "message": "User successfully created"
        },
        "user": {
            "id": 2,
            "first_name": "Jane",
            "last_name": "Doe",
            "email": "jane@doe.com",
            "created_at": "2014-02-20T13:43:24.950Z",
            "updated_at": "2014-02-20T13:43:24.950Z"
        },
        "links": {
            "self_link": "http://example/api/v1/users/16"
        }
    }
 

``` 

#### [PUT /api/v1/users/:id]()
Request
``` 

    {
      "first_name": "Kalle",
      "last_name": "Anka",
      "email": "kalle@anka.com"
    }

``` 

Response
``` 

    {
        "response": {
            "code": 200,
            "message": "User successfully updated"
        },
        "user": {
            "id": 16,
            "first_name": "Kalle",
            "last_name": "Anka",
            "email": "kalle@anka.com",
            "created_at": "2014-02-20T13:43:24.950Z",
            "updated_at": "2014-02-20T13:45:21.229Z"
        },
        "links": {
            "self_link": "http://example/api/v1/users/16",
            "user_resources_link": "http://example/api/v1/users/16/resources"
        }
    }

``` 

#### [DELETE /api/v1/users/:id]()

``` 

    {
        "response": {
            "code": 200,
            "message": "User successfully deleted"
        },
        "user": {
            "id": 16,
            "first_name": "Kalle",
            "last_name": "Anka",
            "email": "kalle@anka.com",
            "created_at": "2014-02-20T13:43:24.950Z",
            "updated_at": "2014-02-20T13:45:21.229Z"
        }
    }

``` 



### Example responses for Resoureces
------
**PARAMETERS**

limit, offset, search (title)

#### [GET /api/v1/resources ]()
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all resources",
                "count": 2,
                "limit": 2,
                "offset": 0
            },
            "resources": [
                {
                    "resource": {
                        "id": 6,
                        "title": "Resurs 6",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.198Z",
                        "updated_at": "2014-02-17T18:26:30.198Z",
                        "resource_type": {
                            "id": 6,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 6,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 4,
                                "tag": "Biology",
                                "created_at": "2014-02-17T18:26:29.273Z",
                                "updated_at": "2014-02-17T18:26:29.273Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                },
                {
                    "resource": {
                        "id": 5,
                        "title": "Resurs 5",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.054Z",
                        "updated_at": "2014-02-17T18:26:30.054Z",
                        "resource_type": {
                            "id": 5,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 5,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 3,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.115Z",
                                "updated_at": "2014-02-17T18:26:29.115Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                }
            ],
            "links": {
                "prev_set_link": "http://example/api/v1/resources?limit=2&offset=0",
                "next_set_link": "http://example/api/v1/resources?limit=2&offset=2"
            }
        }
    ]

``` 

#### [GET /api/v1/users/:id/resources]()
**PARAMETERS**

limit, offset
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all resources for user with id:1",
                "count": 2,
                "limit": 2,
                "offset": 0
            },
            "resources": [
                {
                    "resource": {
                        "id": 2,
                        "title": "Resurs 2",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:29.597Z",
                        "updated_at": "2014-02-17T18:26:29.597Z",
                        "resource_type": {
                            "id": 2,
                            "resource_type": "pdf"
                        },
                        "licence": {
                            "id": 2,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 3,
                                "tag": "tag 3",
                                "created_at": "2014-02-17T18:26:29.115Z",
                                "updated_at": "2014-02-17T18:26:29.115Z"
                            },
                            {
                                "id": 3,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.115Z",
                                "updated_at": "2014-02-17T18:26:29.115Z"
                            }
                        ],
                        "user": {
                            "id": 1,
                            "first_name": "John",
                            "last_name": "Doe",
                            "email": "john@doe.com"
                        }
                    }
                },
                {
                    "resource": {
                        "id": 1,
                        "title": "Resurs 1",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:29.450Z",
                        "updated_at": "2014-02-17T18:26:29.450Z",
                        "resource_type": {
                            "id": 1,
                            "resource_type": "Website"
                        },
                        "licence": {
                            "id": 1,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 1,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:28.829Z",
                                "updated_at": "2014-02-17T18:26:28.829Z"
                            }
                        ],
                        "user": {
                            "id": 1,
                            "first_name": "John",
                            "last_name": "Doe",
                            "email": "john@doe.com"
                        }
                    }
                }
            ],
            "links": {
                "prev_set_link": "http://example/api/v1/resources?user_id=1&limit=2&offset=0",
                "next_set_link": "http://example/api/v1/resources?user_id=1&limit=2&offset=2"
            }
        }
    ]

``` 

#### [GET /api/v1/resource_types/:resource_type_id/resources]()
**PARAMETERS**

limit, offset
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all resources with resource_type_id:1",
                "count": 2,
                "limit": 2,
                "offset": 0
            },
            "resources": [
                {
                    "resource": {
                        "id": 6,
                        "title": "Resurs 6",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.198Z",
                        "updated_at": "2014-02-17T18:26:30.198Z",
                        "resource_type": {
                            "id": 6,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 6,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 4,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.273Z",
                                "updated_at": "2014-02-17T18:26:29.273Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                },
                {
                    "resource": {
                        "id": 5,
                        "title": "Resurs 5",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.054Z",
                        "updated_at": "2014-02-17T18:26:30.054Z",
                        "resource_type": {
                            "id": 5,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 5,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 3,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.115Z",
                                "updated_at": "2014-02-17T18:26:29.115Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                }
            ],
            "links": {
                "prev_set_link": "http://example/api/v1/resources?resource_type_id=1&limit=2&offset=0",
                "next_set_link": "http://example/api/v1/resources?resource_type_id=1&limit=2&offset=2"
            }
        }
    ]

``` 

#### [GET /api/v1/licences/:licence_id/resources]()
**PARAMETERS**

limit, offset
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all resources with licence_id:1",
                "count": 2,
                "limit": 2,
                "offset": 0
            },
            "resources": [
                {
                    "resource": {
                        "id": 6,
                        "title": "Resurs 6",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.198Z",
                        "updated_at": "2014-02-17T18:26:30.198Z",
                        "resource_type": {
                            "id": 6,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 6,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 4,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.273Z",
                                "updated_at": "2014-02-17T18:26:29.273Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                },
                {
                    "resource": {
                        "id": 5,
                        "title": "Resurs 5",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.054Z",
                        "updated_at": "2014-02-17T18:26:30.054Z",
                        "resource_type": {
                            "id": 5,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 5,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 3,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.115Z",
                                "updated_at": "2014-02-17T18:26:29.115Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                }
            ],
            "links": {
                "prev_set_link": "http://example/api/v1/resources?licence_id=1&limit=2&offset=0",
                "next_set_link": "http://example/api/v1/resources?licence_id=1&limit=2&offset=2"
            }
        }
    ]

``` 

#### [GET /api/v1/tags/:tag_id/resources]()
**PARAMETERS**

limit, offset
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all resources with licence_id:1",
                "count": 2,
                "limit": 2,
                "offset": 0
            },
            "resources": [
                {
                    "resource": {
                        "id": 6,
                        "title": "Resurs 6",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.198Z",
                        "updated_at": "2014-02-17T18:26:30.198Z",
                        "resource_type": {
                            "id": 6,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 6,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 4,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.273Z",
                                "updated_at": "2014-02-17T18:26:29.273Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                },
                {
                    "resource": {
                        "id": 5,
                        "title": "Resurs 5",
                        "desciption": "en beskrivning",
                        "url": "http://www.joelstahre.com",
                        "created_at": "2014-02-17T18:26:30.054Z",
                        "updated_at": "2014-02-17T18:26:30.054Z",
                        "resource_type": {
                            "id": 5,
                            "resource_type": "Video"
                        },
                        "licence": {
                            "id": 5,
                            "licence": "MIT",
                            "desciption": "en beskrivning"
                        },
                        "tags": [
                            {
                                "id": 3,
                                "tag": "Science",
                                "created_at": "2014-02-17T18:26:29.115Z",
                                "updated_at": "2014-02-17T18:26:29.115Z"
                            }
                        ],
                        "user": {
                            "id": 3,
                            "first_name": "Foo",
                            "last_name": "Bar",
                            "email": "foo@bar.com"
                        }
                    }
                }
            ],
            "links": {
                "prev_set_link": "http://example/api/v1/resources?licence_id=1&limit=2&offset=0",
                "next_set_link": "http://example/api/v1/resources?licence_id=1&limit=2&offset=2"
            }
        }
    ]
   

``` 

#### [GET /api/v1/resources/:id]()
``` 

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched Resource"
        },
        "resource": {
            "id": 1,
            "title": "Resurs 1",
            "desciption": "en beskrivning",
            "url": "http://www.joelstahre.com",
            "created_at": "2014-02-17T18:26:29.450Z",
            "updated_at": "2014-02-17T18:26:29.450Z",
            "resource_type": {
                "id": 1,
                "resource_type": "Website"
            },
            "licence": {
                "id": 1,
                "licence": "MIT",
                "desciption": "en beskrivning"
            },
            "tags": [
                {
                    "id": 1,
                    "tag": "Science",
                    "created_at": "2014-02-17T18:26:28.829Z",
                    "updated_at": "2014-02-17T18:26:28.829Z"
                }
            ],
            "user": {
                "id": 1,
                "first_name": "John",
                "last_name": "Doe",
                "email": "john@doe.com"
            }
        },
        "links": {
            "self_link": "http://example/api/v1/resources/1",
            "user_link": "http://example/api/v1/users/1"
        }
    }

``` 

#### [POST /api/v1/resources]()
Request
``` 

    {
        "title": "Min nya resurs",
        "desciption": "En fin liten beskrivning",
        "url": "www.test.com",
        "user_id": 4,
        "resource_type_id": 3,
        "licence_id": 1,
        "tags":[1]
        
    }

``` 
Response
``` 

    {
        "response": {
            "code": 201,
            "message": "Resource successfully created"
        },
        "resource": {
            "id": 22,
            "title": "Min nya resurs",
            "desciption": "En fin liten beskrivning",
            "url": "www.test.com",
            "created_at": "2014-02-20T13:27:09.792Z",
            "updated_at": "2014-02-20T13:27:09.792Z",
            "resource_type": {
                "id": 22,
                "resource_type": "Website"
            },
            "licence": {
                "id": 22,
                "licence": "MIT",
                "desciption": "Lorem ipsum"
            },
            "tags": [
                {
                    "id": 1,
                    "tag": "Science,
                    "created_at": "2014-02-17T18:26:28.829Z",
                    "updated_at": "2014-02-17T18:26:28.829Z"
                }
            ],
            "user": {
                "id": 4,
                "first_name": "Dennis",
                "last_name": "The Cat",
                "email": "dennis@the.cat"
            }
        },
        "links": {
            "self_link": "http://example/api/v1/resources/22",
            "user_link": "http://example/api/v1/users/4"
        }
    }
    

```

#### [PUT /api/v1/resources/:id]()
Request
``` 

    {
        "title": "Uppdaterad resurs",
        "description": "ännu en beskrivning!",
        "url": "www.test.com",
        "user_id": 4,
        "resource_type_id": 1,
        "licence_id": 1,
        "tags":[1]
        
    }
   
```

Response
``` 

     {
        "response": {
            "code": 200,
            "message": "Resource successfully updated"
        },
        "resource": {
            "id": 22,
            "title": "Uppdaterad resurs",
            "desciption": "En fin liten beskrivning",
            "url": "www.test.com",
            "created_at": "2014-02-20T13:27:09.792Z",
            "updated_at": "2014-02-20T13:30:32.831Z",
            "resource_type": {
                "id": 22,
                "resource_type": "Video"
            },
            "licence": {
                "id": 22,
                "licence": "MIT",
                "desciption": "En fin liten beskrivning"
            },
            "tags": [
                {
                    "id": 1,
                    "tag": "Science",
                    "created_at": "2014-02-17T18:26:28.829Z",
                    "updated_at": "2014-02-17T18:26:28.829Z"
                }
            ],
            "user": {
                "id": 4,
                "first_name": "Dennis",
                "last_name": "The Cat",
                "email": "dennis@the.cat"
            }
        },
        "links": {
            "self_link": "http://example/api/v1/resources/22",
            "user_link": "http://example/api/v1/users/4"
        }
    }
    

``` 

#### [DELETE /api/v1/resources/:id]()

``` 

    {
        "response": {
            "code": 200,
            "message": "Resource successfully deleted"
        },
        "resource": {
            "id": 22,
            "title": "Uppdaterad resurs",
            "desciption": "En fin liten beskrivning",
            "url": "www.test.com",
            "created_at": "2014-02-20T13:27:09.792Z",
            "updated_at": "2014-02-20T13:30:32.831Z",
            "resource_type": {
                "id": 22,
                "resource_type": "Video"
            },
            "licence": {
                "id": 22,
                "licence": "MIT",
                "desciption": "En fin liten beskrivning"
            },
            "tags": [],
            "user": {
                "id": 4,
                "first_name": "Dennis",
                "last_name": "The Cat",
                "email": "dennis@the.cat"
            }
        },
        "links": {
            "user_link": "http://example/api/v1/users/4"
        }
    }

    

``` 

### Example responses for Licenses
------

#### [GET /api/v1/licences]()
``` 

    [
        {
            "response": {
                "code": 200,
                "message": "Successfully fetched all Licences",
                "count": 1
            },
            "licences": [
                {
                    "licence": {
                        "id": 1,
                        "licence": "MIT",
                        "created_at": "2014-02-17T18:26:28.685Z",
                        "updated_at": "2014-02-17T18:26:28.685Z",
                        "links": {
                            "self_link": "http://example/api/v1/licences/1"
                        }
                    }
                },
                {
                    "licence": {
                        "id": 2,
                        "licence": "CC",
                        "created_at": "2014-02-17T18:26:28.685Z",
                        "updated_at": "2014-02-17T18:26:28.685Z",
                        "links": {
                            "self_link": "http://example/api/v1/licences/1"
                        }
                    }
                }
            ]
        }
    ]
    

``` 

#### [GET /api/v1/licences/:id ]()
``` 

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched Licence"
        },
        "licence": {
            "id": 1,
            "licence": "MIT",
            "created_at": "2014-02-17T18:26:28.685Z",
            "updated_at": "2014-02-17T18:26:28.685Z",
            "links": {
                "self_link": "http://example/api/v1/licences/1"
            }
        }
    }
   
``` 


### Example responses for ResourceTypes
------

#### [GET /api/v1/resource_types]()
``` 

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched all Resources Types",
            "count": 3
        },
        "resource_types": [
            {
                "resource_type": {
                    "id": 1,
                    "resource_type": "Video",
                    "created_at": "2014-02-17T18:26:28.082Z",
                    "updated_at": "2014-02-17T18:26:28.082Z",
                    "links": {
                        "self_link": "http://example/api/v1/resource_types/1"
                    }
                }
            },
            {
                "resource_type": {
                    "id": 2,
                    "resource_type": "pdf",
                    "created_at": "2014-02-17T18:26:28.345Z",
                    "updated_at": "2014-02-17T18:26:28.345Z",
                    "links": {
                        "self_link": "http://example/api/v1/resource_types/2"
                    }
                }
            },
            {
                "resource_type": {
                    "id": 3,
                    "resource_type": "Website",
                    "created_at": "2014-02-17T18:26:28.525Z",
                    "updated_at": "2014-02-17T18:26:28.525Z",
                    "links": {
                        "self_link": "http://example/api/v1/resource_types/3"
                    }
                }
            }
        ]
    }

``` 

#### [GET /api/v1/resource_types/:id ]()
``` 

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched Resource Type"
        },
        "resource_type": {
            "id": 1,
            "resource_type": "Video",
            "created_at": "2014-02-17T18:26:28.082Z",
            "updated_at": "2014-02-17T18:26:28.082Z",
            "links": {
                "self_link": "http://example/api/v1/resource_types/1"
            }
        }
    }

``` 


### Example responses for Tags
------

#### [GET /api/v1/tags]()
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
                    "tag": "Science",
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

#### [GET /api/v1/resources/:resource_id/tags]()
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
                    "tag": "sScience",
                    "created_at": "2014-02-17T18:26:29.273Z",
                    "updated_at": "2014-02-17T18:26:29.273Z",
                    "links": {
                        "self_link": "http://example/api/v1/tags/2"
                    }
                }
            }
        ]
    }

```

#### [GET /api/v1/tags/:id]()
```

    {
        "response": {
            "code": 200,
            "message": "Successfully fetched Tag"
        },
        "tag": {
            "id": 1,
            "tag": "Biology",
            "created_at": "2014-02-17T18:26:28.829Z",
            "updated_at": "2014-02-17T18:26:28.829Z",
            "links": {
                "self_link": "http://example/api/v1/tags/1"
            }
    }

```

#### [POST /api/v1/tags]()
```

    {
        "response": {
            "code": 201,
            "message": "Tag successfully created"
        },
        "tag": {
            "id": 7,
            "tag": "Djur",
            "created_at": "2014-02-20T18:15:47.764Z",
            "updated_at": "2014-02-20T18:15:47.764Z",
            "links": {
                "self_link": "http://localhost:3000/api/v1/tags/7"
            }
        }
    }

```



