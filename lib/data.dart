class data {
  String? id;
  String? name;
  String? contact;
  String? email;
  String? image;

  data({this.id, this.name, this.contact, this.email, this.image});

  data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}