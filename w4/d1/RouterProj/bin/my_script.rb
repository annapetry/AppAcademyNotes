require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users'
# ).to_s
#
# url1 = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/5.json',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s
  
  puts RestClient.post(url, 
      {
        user: { name: "Gizmo", email: "gizmo@gizmo.com"}
      }
    )
end

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s
  
  puts RestClient.patch(url, 
      { 
        user: { email: "gizmo@gmail.com"}
      }
    )
end

def destroy
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1'
  ).to_s
  
  puts RestClient.delete(url)
end

def show
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s
  
  puts RestClient.get(url)
end

#puts RestClient.get(url)
#puts RestClient.get(url)

#create_user
# update_user
# destroy
# show
