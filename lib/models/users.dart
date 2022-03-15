class Users {
  String? id;
  String? firstName;
  String? lastName;
  Null? middleName;
  String? fullName;
  Null? birthDate;
  Null? address;
  Null? city;
  Null? state;
  Null? phone;
  Null? mobile;
  String? email;
  String? gender;

  Users({
    this.id,
    this.firstName,
    this.lastName,
    this.middleName,
    this.fullName,
    this.birthDate,
    this.address,
    this.city,
    this.state,
    this.phone,
    this.mobile,
    this.email,
    this.gender,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    middleName = json['MiddleName'];
    fullName = json['FullName'];
    birthDate = json['BirthDate'];
    address = json['Address'];
    city = json['City'];
    state = json['State'];
    phone = json['Phone'];
    mobile = json['Mobile'];
    email = json['Email'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['MiddleName'] = this.middleName;
    data['FullName'] = this.fullName;
    data['BirthDate'] = this.birthDate;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['State'] = this.state;
    data['Phone'] = this.phone;
    data['Mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Gender'] = this.gender;

    return data;
  }
}
