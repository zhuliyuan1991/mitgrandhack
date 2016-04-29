
export ORG_ID=
export ORG_ACCESS_TOKEN=
export CONTENT_TYPE="Content-Type: application/json"

# provision a user
export USER=
curl "https://api.validic.com/v1/organizations/$ORG_ID/users.json?access_token=$ORG_ACCESS_TOKEN" -v -X POST -H "$CONTENT_TYPE" -d "{ \"user\": { \"uid\": \"${USER_ID}\" }, \"access_token\": \"$ORG_ACCESS_TOKEN\" }"

# access_token from the above response
export USER_ACCESS_TOKEN=
# _id from the above response
export USER_ID=

# this is how we connect to other devices
export MARKETPLACE_URL="https://app.validic.com/$ORG_ID/$USER_ACCESS_TOKEN"

# open the marketplace
open $MARKETPLACE_URL

# how many records do we want back? max=200
export LIMIT=200

# query latest for org
export START_DATE=2016-01-01
export END_DATE=2016-04-30
curl "https://api.validic.com/v1/organizations/$ORG_ID/fitness/latest.json?access_token=$ORG_ACCESS_TOKEN&start_date=$START_DATE&end_date=$END_DATE&limit=$LIMIT&expanded=1" -v -H "$CONTENT_TYPE"

# query latest for user
export USER_ID=
export START_DATE=2016-01-01
export END_DATE=2016-04-30
curl "https://api.validic.com/v1/organizations/$ORG_ID/users/$V_USER_ID/fitness/latest.json?access_token=$ORG_ACCESS_TOKEN&start_date=$START_DATE&end_date=$END_DATE&limit=$LIMIT&expanded=1" -v -H "$CONTENT_TYPE"
