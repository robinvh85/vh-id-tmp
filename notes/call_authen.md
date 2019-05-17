
# Create new app
app = Doorkeeper::Application.create!(
  name: 'vh-api',
  redirect_uri: 'https://localhost:3001/callback',
)

# Application need to add to an owner, save data in table oauth_access_grants
- resource_owner is the id of user

# Use browser to authorize to get code
GET http://localhost:3000/oauth/authorize?client_id=-NT8baBfXLfCT1oE0shhZp4C-WQCs7qPcrixnPKeA-k&client_secret=IlKrhcHDjXiw3CwmzgmryL9idK0390QVE-enp5vjWfc&response_type=code&redirect_uri=http://localhost:3001/callback

## Post to get token by authorization_code
POST http://localhost:3000/oauth/token HTTP/1.1
content-type: application/json

{
  "client_id": "-NT8baBfXLfCT1oE0shhZp4C-WQCs7qPcrixnPKeA-k",
  "client_secret": "IlKrhcHDjXiw3CwmzgmryL9idK0390QVE-enp5vjWfc",
  "redirect_uri": "http://localhost:3001/callback",
  "grant_type": "authorization_code",
  "code": "H44sRj4y1SdyYdQCS2NB09AUDRNXBrLlkRW7delZvow"
}