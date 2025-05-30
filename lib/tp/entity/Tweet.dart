class Tweet {
  int? id;
  String? profile;
  int? createdDate;
  String? author;
  String? message;

  Tweet(this.id, this.profile, this.createdDate, this.author, this.message);

  Tweet.fromJson(Map<String, dynamic> json) : this(json['id'], json['profile'], json['created_date'], json['author'], json['message']);
}