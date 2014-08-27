require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users'
  ).to_s
  
  puts RestClient.post(url, 
      {
        user: { username: "AnnaUser"}
      }
    )
end


def create_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts'
  ).to_s
  
  RestClient.post(url, 
    { contact: { name: "Andrew", email: "andrew@mcnutt.com", user_id: 1} }
  )
end

def update_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1'
  ).to_s
  
  RestClient.patch(url, 
    { contact: { name: "Andrew", email: "andrew@anna.gov", user_id: 1, favorited: true} }
  )
end

def delete_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/3'
  ).to_s
  
  RestClient.delete(url)
end

def index_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1/contacts/'
  ).to_s
  
  RestClient.get(url)
end

def show_contact
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/3'
  ).to_s
  
  RestClient.get(url)
end

def fav_contacts
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1/contacts/favs'
  ).to_s
  
  RestClient.get(url)
end

# puts create_user
# puts create_contact
# puts show_contact 
# # puts delete_contact
# update_contact
# puts index_contact
puts fav_contacts
