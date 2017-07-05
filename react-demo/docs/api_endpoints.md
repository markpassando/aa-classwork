# Api Endpoints

**N.B.** You can see these endpoints by running `bundle exec rake routes` in the same directory from which you run `rails server`.

## `posts`

   Prefix | Verb | URI Pattern | Controller#Action
   ---|---|---|---
root | GET | / | static_pages#root
api_posts | GET | /api/posts(.:format) | api/posts#index {:format=>:json}
 | POST | /api/posts(.:format) | api/posts#create {:format=>:json}
 api_post | GET | /api/posts/:id(.:format) | api/posts#show {:format=>:json}
 | PATCH | /api/posts/:id(.:format) | api/posts#update {:format=>:json}
 | PUT | /api/posts/:id(.:format) | api/posts#update {:format=>:json}
 | DELETE | /api/posts/:id(.:format) | api/posts#destroy {:format=>:json}