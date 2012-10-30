# About yp-api
This is a wrapper around the US API for yellowpages.com. (not to be confused with the canadian version of the API which seems to be different)

#Usage

create an init file named yellowpages.rb in config/initializers and enter your YpAPI key here.

````
YpApi.key = 'YOUR KEY HERE'
````

To find a business

````
YpApi::Listing.find(13519)
````
To get reviews for a business

````
YpApi::Review.find(13519)
````
