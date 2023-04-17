I ended up not being able to get the data into a Database in a proper way, spending way too much time trying to make this dataset work. Therefore i will be describing what i would have done with it, had i been able to import it successfully:

## The data
The data is sourced from [Airbnb](http://insideairbnb.com/get-the-data/). It details the listings on their service, along with information about Hosts, reviews, and location data.

## The model
The model for the database consists of the following entities:
* Host - people who list accomodations on Airbnb
* Listing - a listing for an accomodation
* Review - a review of a listing

![database model](/graphics/model.png)

As shown, besides the obvious relations between the host, listing, and review, listings have a weighted relationship for distance, which stores how far away from each other they are.

## Database operations
A use for the distance relationship could be proximity based recommendations for users, when browsing Airbnb listings. If a user is looking at one listing in an area, it might be useful to show other listings that are close by. <br>
You would do this by following each relationship between listings that are below a set distance. 
A configurable radius for the recommendations can be set, by traversing the graph and adding the distances until it exceeds a maximum.
