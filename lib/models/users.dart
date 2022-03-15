class Users {
  String? id;
  String? firstName;
  String? lastName;
  String? middleName;
  String? fullName;
  DateTime? birthDate;
  String? address;
  String? city;
  String? state;
  int? phone;
  int? mobile;
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
    data['Id'] = id;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['FullName'] = fullName;
    data['MiddleName'] = middleName;
    data['BirthDate'] = birthDate;
    data['Address'] = address;
    data['City'] = city;
    data['State'] = state;
    data['Phone'] = phone;
    data['Mobile'] = mobile;
    data['Email'] = email;
    data['Gender'] = gender;

    return data;
  }
}
