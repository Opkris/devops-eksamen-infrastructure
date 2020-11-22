provider "opsgenie" {
  version = "0.5.2"
  api_url = "api.eu.opsgenie.com"
}
resource "opsgenie_user" "userOne" {
  username = "devopsgod@dumdum.com"
  full_name = "kristof"
  role = "User"
  locale = "no_NO"
  timezone = "Europe/Oslo"
}

resource "opsgenie_user" "userTwo" {
  username = "devops@forlife.com"
  full_name = "kristoffer"
  role = "User"
  locale = "no_NO"
  timezone = "Europe/Oslo"
}

resource "opsgenie_team" "teamOne" {
  name = "devops crushers"

  member {
    id = opsgenie_user.userOne.id
    role = "user"
  }

  member {
    id = opsgenie_user.userTwo.id
    role = "user"
  }
}