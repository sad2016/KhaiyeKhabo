json.array!(@contacts) do |contact|
  json.extract! contact, :id, :fullname, :email, :subject, :comment
  json.url contact_url(contact, format: :json)
end
