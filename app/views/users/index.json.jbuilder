json.array!(@users) do |user|
  json.extract! user, :id, :role_id, :username, :fullname, :datebirth, :occupation, :otherinterest, :cookcategory_id, :favcookbook, :location, :picture, :isbanned
  json.url user_url(user, format: :json)
end
