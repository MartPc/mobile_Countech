class Data {
    final int userId;
    final int id;
    final String title;
    final String body;

    Data({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}


