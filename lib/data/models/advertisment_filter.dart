class FilterModel {
  int? advId;
  int? serviceId;
  int? specialistId;
  bool? status;
  String? advType;

  FilterModel({
    this.advId,
    this.serviceId,
    this.advType,
    this.specialistId,
    this.status,
  });

  FilterModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    advType = json['adv_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['adv_type'] = advType;
    return data;
  }
}
