class AbsDef {
  String? id;
  String? name;
  int? integrationId;
  int? code;
  int? type;
  bool? isAvailableForAdminsOnly;
  String? categoryDefinitionId;
  String? categoryDefinitionName;
  int? fraction;

  AbsDef(
      {this.id,
      this.name,
      this.integrationId,
      this.code,
      this.type,
      this.isAvailableForAdminsOnly,
      this.categoryDefinitionId,
      this.categoryDefinitionName,
      this.fraction});

  AbsDef.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    integrationId = json['IntegrationId'];
    code = json['Code'];
    type = json['Type'];
    isAvailableForAdminsOnly = json['IsAvailableForAdminsOnly'];
    categoryDefinitionId = json['CategoryDefinitionId'];
    categoryDefinitionName = json['CategoryDefinitionName'];
    fraction = json['Fraction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['IntegrationId'] = this.integrationId;
    data['Code'] = this.code;
    data['Type'] = this.type;
    data['IsAvailableForAdminsOnly'] = this.isAvailableForAdminsOnly;
    data['CategoryDefinitionId'] = this.categoryDefinitionId;
    data['CategoryDefinitionName'] = this.categoryDefinitionName;
    data['Fraction'] = this.fraction;
    return data;
  }
}
