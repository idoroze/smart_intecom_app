String url = '';

class Contact {
  final String data;

  Contact(this.data);

  Contact.fromJson(Map<String, dynamic> json) : data = json['data'];
}
