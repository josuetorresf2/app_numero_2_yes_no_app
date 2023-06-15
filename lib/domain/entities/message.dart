enum FromWho { mine, thems }

class Message {
  final String text;
  final String? imageUrl;

  final FromWho fromWho;

  /* 
  Here we can add the time the message was sent
  if the message was read, etc.
  */

  //constructor
  Message({required this.text, this.imageUrl, required this.fromWho});
}
