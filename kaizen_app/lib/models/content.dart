class Content {
  String id;
  String name;
  String description;
  String type;
  String bloburl;
  String subject;
  String contentType;

  Content({
    this.id,
    this.name,
    this.description,
    this.type,
    this.bloburl,
    this.subject,
    this.contentType,
  });

  factory Content.fromJson(Map<String, dynamic> responseData) {
    return Content(
      id: responseData['id'],
      name: responseData['name'],
      description: responseData['description'],
      type: responseData['type'],
      bloburl: responseData['bloburl'],
      subject: responseData['subject'],
      contentType: responseData['contentType'],
    );
  }
}
