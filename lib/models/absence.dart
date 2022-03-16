class Absence {
  String? userId;
  String? timestamp;
  String? absenceDefinitionId;
  int? origin;
  String? comment;
  String? partialTimeFrom;
  String? partialTimeTo;
  int? partialTimeDuration;
  bool? isPartial;
  bool? overrideHolidayAbsence;

  Absence(
      {this.userId,
      this.timestamp,
      this.absenceDefinitionId,
      this.origin,
      this.comment,
      this.partialTimeFrom,
      this.partialTimeTo,
      this.partialTimeDuration,
      this.isPartial,
      this.overrideHolidayAbsence});

  Absence.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    timestamp = json['Timestamp'];
    absenceDefinitionId = json['AbsenceDefinitionId'];
    origin = json['Origin'];
    comment = json['Comment'];
    partialTimeFrom = json['PartialTimeFrom'];
    partialTimeTo = json['PartialTimeTo'];
    partialTimeDuration = json['PartialTimeDuration'];
    isPartial = json['IsPartial'];
    overrideHolidayAbsence = json['OverrideHolidayAbsence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['UserId'] = userId;
    data['Timestamp'] = timestamp;
    data['AbsenceDefinitionId'] = absenceDefinitionId;
    data['Origin'] = origin;
    data['Comment'] = comment;
    data['PartialTimeFrom'] = partialTimeFrom;
    data['PartialTimeTo'] = partialTimeTo;
    data['PartialTimeDuration'] = partialTimeDuration;
    data['IsPartial'] = isPartial;
    data['OverrideHolidayAbsence'] = overrideHolidayAbsence;
    return data;
  }
}
