// AG 02: Irina Levkovets + Olga Ratushniak

//MGDB3.1 Count how many conferences are held in the year 2019.

db.conferences.count({year: 2019})

//MGDB3.2 Find all delegates from Canada, and return only their name and _id fields.

db.delegates.find({country: "Canada"}, {_id: true, name: true})

//MGDB3.3 Find the countries of all delegates. Return a list of unique values(i.e., make sure that no duplicatesare in the result if multiple delegates are from the same country).

db.delegates.distinct("country")

//MGDB3.4 Find all conferences with a research-oriented track (i.e., where the track topic is “research”).

db.conferences.find({tracks: {$elemMatch: {"topic": "research"}}})

//MGDB3.5 Find all conferences that started in April 2019.

db.conferences.find({"duration.begin": {$gt: "2019/03/31", $lt: "2019/05/01"}})

//MGDB3.6 Find all conferences that have a track with a two or more chairs.

db.conferences.find({'tracks.chairs.1': {$exists: true}})

db.conferences.find({tracks: {chairs: {$exists: true}, $where: 'this.chairs.length > 1'}})

//MGDB3.7 Find all iterations of the ICSE conference. Hint: you can use regular expressions 4 for this task.

db.conferences.find({
    name: {
        $regex: /^ICSE/i
    }
})

// MGDB3.8 Change the name of the delegate Joanne M. Atlee to "Joanne Atlee".

db.delegates.update({
    name: "Joanne M. Atlee"
}, {
    $set: {
        name: "Joanne Atlee"
    }
})

//MGDB3.9 Remove the city information from all conferences in India.

db.conference.remove({
    "location.country": "India"
}, {
    $unset: {
        "location.city": ""
    }
})
//MGDB3.10 Find the names and editions (but not the _id) of all conferences where the general chair is fromIndia. Hint:you may need need to use the aggregation pipeline 5 to solve this query.

db.delegates.aggregate(
    [
        {$lookup: {
                from: "conferences",
                localField: "name",
                foreignField: "general_chair",
                as: "chair_conferences"
            }
        },
        {$match : {country: "India"}},
        {$project: {"chair_conferences":true, name:true,"country": true,"_id": false}}]
)