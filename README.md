# yp-api
This is a wrapper around the US API for yellowpages.com. (not to be confused with the canadian version of the API which seems to be different)

forked from original by demersus[https://github.com/demersus/yp-api] 

#usage

create an init file named yellowpages.rb in config/init and enter your YpAPI key here.

````
YpApi.key = 'YOUR KEY HERE'
````

To find a business

````
YpApi::Listing.find(13519)
````
