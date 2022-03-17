class AllAbsences {
  String? id;
  String? userId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? timestamp;
  String? absenceDefinitionId;
  String? absenceDefinitionName;
  String? insertedOn;
  int? origin;
  String? originDisplayName;
  String? comment;
  bool? isAuthentic;
  String? iconId;
  bool? isCalculated;
  int? status;
  bool? approvalRequest;
  String? partialTimeFrom;
  String? partialTimeTo;
  int? partialTimeDuration;
  bool? isPartial;
  bool? overrideHolidayAbsence;
  bool? isModified;
  Null? modifiedByUser;
  Null? modifiedOn;

  AllAbsences(
      {this.id,
      this.userId,
      this.firstName,
      this.middleName,
      this.lastName,
      this.timestamp,
      this.absenceDefinitionId,
      this.absenceDefinitionName,
      this.insertedOn,
      this.origin,
      this.originDisplayName,
      this.comment,
      this.isAuthentic,
      this.iconId,
      this.isCalculated,
      this.status,
      this.approvalRequest,
      this.partialTimeFrom,
      this.partialTimeTo,
      this.partialTimeDuration,
      this.isPartial,
      this.overrideHolidayAbsence,
      this.isModified,
      this.modifiedByUser,
      this.modifiedOn});

  AllAbsences.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    timestamp = json['Timestamp'];
    absenceDefinitionId = json['AbsenceDefinitionId'];
    absenceDefinitionName = json['AbsenceDefinitionName'];
    insertedOn = json['InsertedOn'];
    origin = json['Origin'];
    originDisplayName = json['OriginDisplayName'];
    comment = json['Comment'];
    isAuthentic = json['IsAuthentic'];
    iconId = json['IconId'];
    isCalculated = json['IsCalculated'];
    status = json['Status'];
    approvalRequest = json['ApprovalRequest'];
    partialTimeFrom = json['PartialTimeFrom'];
    partialTimeTo = json['PartialTimeTo'];
    partialTimeDuration = json['PartialTimeDuration'];
    isPartial = json['IsPartial'];
    overrideHolidayAbsence = json['OverrideHolidayAbsence'];
    isModified = json['IsModified'];
    modifiedByUser = json['ModifiedByUser'];
    modifiedOn = json['ModifiedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['UserId'] = this.userId;
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['Timestamp'] = this.timestamp;
    data['AbsenceDefinitionId'] = this.absenceDefinitionId;
    data['AbsenceDefinitionName'] = this.absenceDefinitionName;
    data['InsertedOn'] = this.insertedOn;
    data['Origin'] = this.origin;
    data['OriginDisplayName'] = this.originDisplayName;
    data['Comment'] = this.comment;
    data['IsAuthentic'] = this.isAuthentic;
    data['IconId'] = this.iconId;
    data['IsCalculated'] = this.isCalculated;
    data['Status'] = this.status;
    data['ApprovalRequest'] = this.approvalRequest;
    data['PartialTimeFrom'] = this.partialTimeFrom;
    data['PartialTimeTo'] = this.partialTimeTo;
    data['PartialTimeDuration'] = this.partialTimeDuration;
    data['IsPartial'] = this.isPartial;
    data['OverrideHolidayAbsence'] = this.overrideHolidayAbsence;
    data['IsModified'] = this.isModified;
    data['ModifiedByUser'] = this.modifiedByUser;
    data['ModifiedOn'] = this.modifiedOn;
    return data;
  }
}
