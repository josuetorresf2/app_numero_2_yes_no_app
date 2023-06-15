enum FromWho { mine, thems }

class Message {
  final String text;
  final String? imageUrl;

  final FromWho fromWho;

  /* 
  Here we can add the time the message was send
  if the message was read, etc.
  */

  Message({required this.text, this.imageUrl, required this.fromWho});
}
