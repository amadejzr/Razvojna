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
  Null? pictureUri;
  Null? customId;
  Null? customField1;
  Null? customField2;
  Null? customField3;
  Null? customField4;
  Null? customField5;
  Null? customField6;
  Null? customField7;
  Null? customField8;
  Null? customField9;
  Null? customField10;
  bool? isTimeAttendanceUser;
  bool? isArchived;
  bool? hasUserAccount;
  Null? userAccountId;
  Null? calculationStartDate;
  Null? calculationStopDate;

  Users(
      {this.id,
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
      this.pictureUri,
      this.customId,
      this.customField1,
      this.customField2,
      this.customField3,
      this.customField4,
      this.customField5,
      this.customField6,
      this.customField7,
      this.customField8,
      this.customField9,
      this.customField10,
      this.isTimeAttendanceUser,
      this.isArchived,
      this.hasUserAccount,
      this.userAccountId,
      this.calculationStartDate,
      this.calculationStopDate});

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
    pictureUri = json['PictureUri'];
    customId = json['CustomId'];
    customField1 = json['CustomField1'];
    customField2 = json['CustomField2'];
    customField3 = json['CustomField3'];
    customField4 = json['CustomField4'];
    customField5 = json['CustomField5'];
    customField6 = json['CustomField6'];
    customField7 = json['CustomField7'];
    customField8 = json['CustomField8'];
    customField9 = json['CustomField9'];
    customField10 = json['CustomField10'];
    isTimeAttendanceUser = json['IsTimeAttendanceUser'];
    isArchived = json['IsArchived'];
    hasUserAccount = json['HasUserAccount'];
    userAccountId = json['UserAccountId'];
    calculationStartDate = json['CalculationStartDate'];
    calculationStopDate = json['CalculationStopDate'];
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
    data['PictureUri'] = this.pictureUri;
    data['CustomId'] = this.customId;
    data['CustomField1'] = this.customField1;
    data['CustomField2'] = this.customField2;
    data['CustomField3'] = this.customField3;
    data['CustomField4'] = this.customField4;
    data['CustomField5'] = this.customField5;
    data['CustomField6'] = this.customField6;
    data['CustomField7'] = this.customField7;
    data['CustomField8'] = this.customField8;
    data['CustomField9'] = this.customField9;
    data['CustomField10'] = this.customField10;
    data['IsTimeAttendanceUser'] = this.isTimeAttendanceUser;
    data['IsArchived'] = this.isArchived;
    data['HasUserAccount'] = this.hasUserAccount;
    data['UserAccountId'] = this.userAccountId;
    data['CalculationStartDate'] = this.calculationStartDate;
    data['CalculationStopDate'] = this.calculationStopDate;
    return data;
  }
}
