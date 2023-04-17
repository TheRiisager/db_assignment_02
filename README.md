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
A configurable radius for the recommendations can be set, by traversing the graph until the cumulative distance exceeds a maximum.

## SQL comparison
To accomplish a similar proximity recommendations query in a relational database, one would need to query a larger amount of data, since one would need to check every listing, at least within a broad geographical location, in order to figure out if it's close. Some SQL databases come with geospatial functionality, but it would still be a larger operation than simply following the relationships in a graph database.<br>
The process of insertion would, however, be more complex in a graph database. Since, in a relational database, a new row would simply be inserted, whereas the graph database would need to create the relationships between nodes whenever a new node is inserted.
This means that the graph solution lends itself well to cases like this, where the read performance is prioritized over write performance. For example in this scenario, there will most likely be vastly more people wanting to browse listings on airbnb than there are hosts who create listings.


For a task like this, one might create a low priority background process, that builds the distance relationships between nodes, since this data is not time sensitive.
