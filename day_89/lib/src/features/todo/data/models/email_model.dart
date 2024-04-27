class Email {
  const Email({
    required this.sender,
    required this.recipients,
    required this.image,
    required this.time,
    required this.body,
    required this.bodyImage,
  });

  final String sender;
  final String recipients;
  final String image;
  final String time;
  final String body;
  final String bodyImage;
}