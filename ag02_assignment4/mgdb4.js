// AG 02: Irina Levkovets + Olga Ratushniak

//MGDB4.1

db.issues.distinct("repository_url")

//MGDB4.2

db.issues.distinct("user.login", {"state": "open"})

//MGDB4.3

db.comments.count({"user.type": "Bot"})

//MGDB4.4

db.issues.aggregate([{
    $lookup:
        {
            from: "comments",
            localField: "url",
            foreignField: "issue_url",
            as: "url"
        }
}
])

