
#Access the API to get information on your instructors repositories 
#(hint: this is the url you want "https://api.github.com/users/jtleek/repos").
#Use this data to find the time that the datasharing repo was created. 
#What time was it created? This tutorial may be useful 
#(https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 

library(httr)

# 1.Find OAuth settings for github:
##authorize: https://github.com/login/oauth/authorize
##access:    https://github.com/login/oauth/access_token

oauth_endpoints("github")

# 2. Register an application with the github API 
# https://github.com/settings/applications. 


myapp <- oauth_app("github", "56b637a5baffac62cad9")
               
# 3. Get OAuth credentials
github_token <-oauth2.0_token(oauth_endpoints("github"), myapp) 

# 4. use API (get verb)

req <- GET("https://api.github.com/users/jtleek/repos")
stop_for_status(req) # Check the request succeeded
a<-content(req)     # Parse the JSON output
a[5]                # Display 5th element data sharing repo


