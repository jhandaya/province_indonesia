import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel
{
  String id;
  String name;
  String parentId;   // province parentId ='ID'

  DataModel({required this.id, required this.parentId, required this.name});


  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

