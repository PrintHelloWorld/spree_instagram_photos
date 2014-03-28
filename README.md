SpreeInstagramPhotos
====================
This extension currently allows you to display instagram photos with given tag, anywhere in your store.
As an example, you can use this extension to display product photos posted by users (with specified tag).

Installation
------------

Add spree_instagram_photos to your Gemfile:

```ruby
gem 'spree_instagram_photos', git: 'https://github.com/netguru/spree_instagram_photos.git', branch: '2-1-stable'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
rails g spree_instagram_photos:install
```

Now you'll need to get `client_id` and `access_token` from Instagram and paste them to `instagram_auth.rb` initializer (created by install rake)
And that's it :)

How it works
------------
This extension currently doesn't provide any ready to use views for photos,
but you can make your own.

Just like on this example:
```
<% instagram_photos_for_tag 'cats' do |cat| %>
  <%= image_tag cat.thumbnail %>
<% end %>
```
So basically there is helper method called `instagram_photos_for_tag` that returns array of photos
(each photo in 2 versions `thumbnail` and `full`), and of course, you can pass a block to this method and use it as shown above.

You can also limit the number of photos returned, just pass `limit` into params
`instagram_photos_for_tag('catas', {limit: 4})`

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_instagram_photos/factories'
```

Copyright (c) 2014 Netguru, released under the New BSD License
