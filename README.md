# README

BLOOGER 
Is a simple blog application built with Ruby on Rails. It's users can sign up, log in, create post, edit and delete the.
Everyone can see the posts even if they are not users of the application.

FEATURES:

1. User authentication
2. Loggen in users are able to:
     Create posts
     Edit the posts
     Delete posts (Only their own posts)
3. Posts contain:
     Title
     Content
     Author
4. All posts are visible to everyone

REQUIREMENTS:
1. Ruby 3.2.3
2. Rails 7x
3. SQLite
4. TailwindCSS

SETUP INSTRUCTIONS:
1. Clone repository:
git clone https://github.com/kgulwa/BLOGGER.git
cd BLOGGER

2. Install dependencies:
bundle install

3. Setup the database:
bin/rails db:create db:migrate

4. Start server:
bin/dev

5. Open your browser and go to:
https://localhost:3000

USAGE:

1. Sign up as a new user.
2. Create your very ever post.
3. Browse all posts on your homepage.
4. Edit and delete if need be.
5. Logout
           
FUTURE IMPROVEMENTS:

1. Add comments to post
2. Mention other BLOGGER users in posts
3. Tag other users
