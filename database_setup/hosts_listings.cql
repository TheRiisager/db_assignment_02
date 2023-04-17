LOAD CSV WITH HEADERS FROM 'file:///listings3.csv'
AS line FIELDTERMINATOR '|'
CREATE (h:Host {id: line.host_id, name: line.host_name, location: line.host_location, about: line.host_about})

:auto
LOAD CSV WITH HEADERS FROM 'file:///listings3.csv'
AS line FIELDTERMINATOR '|'
CALL {
    WITH line
    MATCH (h:Host) WHERE h.id = line.host_id
    CREATE (l:Listing {id: line.id, url: line.listing_url, name: line.name, description: line.description, longitude: toFloat(line.longitude), latitude: toFloat(line.latitude)})
    CREATE (h)-[:hosts]->(l)
} IN TRANSACTIONS OF 500 ROWS