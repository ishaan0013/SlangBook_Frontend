class PlanModel {
  PlanModel({
      this.id, 
      this.name, 
      this.totalMonths, 
      this.price, 
      this.createdAt, 
      this.updatedAt,});

  PlanModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    totalMonths = json['total_months'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  int? totalMonths;
  String? price;
  String? createdAt;
  String? updatedAt;
PlanModel copyWith({  int? id,
  String? name,
  int? totalMonths,
  String? price,
  String? createdAt,
  String? updatedAt,
}) => PlanModel(  id: id ?? this.id,
  name: name ?? this.name,
  totalMonths: totalMonths ?? this.totalMonths,
  price: price ?? this.price,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['total_months'] = totalMonths;
    map['price'] = price;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}