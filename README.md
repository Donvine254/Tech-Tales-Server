# **Tech-Tales Server Side API**

This project is a simple school blog for software developers students and senior developers who would like to share their solutions to various coding problems or practice blogging as a way of learning. The blog is a collaborative approach where everyone can be an author and thus can create, read, edit or delete blogs, create, read, edit or delete comments and exchange ideas with others.

# **Front-end Tech-Tales Interface**

You can use this api in with the front-end tech-tales available here [see repo](https://github.com/Donvine254/Tech-Tales-Client)

View the deployed frontendsite here [techtales.vercel.app](https://techtales.vercel.app/)

# **Technologies Used in the API**

* ***Ruby***
* ***Rails***
* ***Active Record***
* ***Postgresql***

# **How To Use**

### Install and run:
```ruby
bundle install

# create migrations with activerecord
rails db:migrate

# if you would like to use seed data
rails db:seed

# start server
rails s
#or 
rails server
#This will run your server on port
[http://localhost:3000]( http://127.0.0.1:3000).
```

# Relationships within Database
## User
* has_many :comments
* has_many :blogs
## Blog
* belongs_to : user
* has_many :comments

## Comments
* belongs_to :user
* belongs_to :blog

# Example Calls You Can Make With API
* **CREATE user, blog and comments**
* **GET/RETRIEVE all blogs and comments**
* **GET/RETRIEVE individual blogs**
* **DELETE a blog or a comment**
* **UPDATE a blog or a comment**
### Fetch Example

The frontend app should make fetch requests to api!

 Here's an example:

```js
fetch("http://localhost:3000/blogs")
  .then((r) => r.json())
  .then((data) => console.log(data));
```
### Patch Example
To patch a blog or comment you need to provide the id to the specific blog or comment
```javascript
fetch(`https://localhost:3000/blogs/${blog.id}`, {
  method: 'PATCH',
  headers: {
    'Content-Type': 'application/json',
    'accept': 'application/json', 
  },
  body: JSON.stringify({
    title: 'NEXT-JS',
    body: 'body of the blog goes here'
  }),
})
  .then((r) => r.json()) 
  .then((data) => console.log(data));
```
### Post Example
To post a new blog or a comment, you need to pass the body in json format
```js
fetch('https://localhost:3000/blogs', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'accept': 'application/json',
  },
  body: JSON.stringify({
    title: 'blog title goes here',
    body: 'body of the blog goes here'
  }),
})
  .then((r) => r.json())
  .then((data) => console.log(data));

```
### Delete Example
To delete a blog post or a comment, you need to provide the id
```js
fetch(`https://localhost:3000/blogs/${id}`, {
  method: 'DELETE'
})
  .then((r) => r.json())
  .then((data) => console.log(data));
```
# License
**This project is provided for educational purposes only and is therefore considered free use. The owner grants permission to use, copy, modify and build upon this project without any express or implied warranty or liabilities.**
## Happy Coding
