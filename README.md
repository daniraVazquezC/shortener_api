## Endpoints

#### POST /signup
```
{
	"user": {
		"email": "test@gmail.com",
		"password": "password"
	}
}
```
#### POST /login
```
{
	"user": {
		"email": "test@gmail.com",
		"password": "password"
	}
}
```
#### GET /links
#### POST /links
```
{
	"url": "http://example.com"
}
```
#### PATCH /links/:short_link_code
```
{
	"url": "http://example.com"
}
```
#### DELETE /links/:short_link_code
