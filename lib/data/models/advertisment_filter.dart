class FilterModel {
  int? advId;
  int? serviceId;
  String? advType;

  FilterModel({
    this.advId,
    this.serviceId,
    this.advType,
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
