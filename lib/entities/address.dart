abstract class AddressModel {
  String name;
  String contact;
  String city;
  String country;
  String houseNo;
  String label;
}

class Address implements AddressModel {
  String name;
  String contact;
  String city;
  String country;
  String houseNo;
  String label;

  Address({this.label = 'Home', this.country = "India"});

  Address.fromJson(json)
      : this.name = json['name'],
        this.city = json['city'],
        this.contact = json['contact'],
        this.houseNo = json['houseNo'],
        this.label = json['label'],
        this.country = json['country'];

  Map<String, dynamic> toJson() => {
        'name': this.name,
        'city': this.city,
        'contact': this.contact,
        'houseNo': this.houseNo,
        'label': this.label,
        'country': this.country,
      };

  String toString() => '$name, $city, $houseNo, $country: $label, $contact ';
}
