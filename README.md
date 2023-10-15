# MiniBlog
A simple MiniBlog that has pages, posts, comments and likes to posts. Also an admin panel for management (Gem an activeadmin).

You must create and add client ID and secret key

#### Google
`ENV['GOOGLE_CLIENT_ID']` and `ENV['GOOGLE_CLIENT_SECRET']`

#### Facebook
`ENV['FACEBOOK_APP_ID']` and `ENV['FACEBOOK_APP_SECRET']`

#### PostgreSql: production

database: `<%= ENV['PG_DATABASE'] %>`

username: `<%= ENV['PG_USER'] %> `

password: `<%= ENV['PG_PASSWORD'] %>`

host: `<%= ENV['PG_HOST'] %>`

port: `<%= ENV['PG_PORT'] %>`
