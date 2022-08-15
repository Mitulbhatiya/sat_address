class Sat {
  final int? id;
  String? country;
  String? state;
  String? city;
  String? pincode;
  static const String TABLENAME = "sataddress";

  Sat({this.pincode,this.city,this.country,this.state,this.id});

  Map<String, dynamic> toMap() {
    return {'id': id, 'city': city, 'state': state,'pincode':pincode};
  }
}