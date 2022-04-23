## Endpoints

#### POST https://floating-woodland-13838.herokuapp.com/signup
```
{
	"user": {
		"email": "test@gmail.com",
		"password": "password"
	}
}
```
#### POST https://floating-woodland-13838.herokuapp.com/login
```
{
	"user": {
		"email": "test@gmail.com",
		"password": "password"
	}
}
```
#### GET https://floating-woodland-13838.herokuapp.com/api/v1/links
#### POST https://floating-woodland-13838.herokuapp.com/api/v1/links
```
{
	"url": "http://example.com"
}
```
#### PATCH https://floating-woodland-13838.herokuapp.com/api/v1/links/:short_link_code
```
{
	"url": "http://example.com"
}
```
#### DELETE https://floating-woodland-13838.herokuapp.com/api/v1/links/:short_link_code
