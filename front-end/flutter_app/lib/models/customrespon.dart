import 'package:json_annotation/json_annotation.dart';
import "user.dart";
part 'customrespon.g.dart';

@JsonSerializable()
class Customrespon {
    Customrespon();

    num status;
    String message;
    User data;
    
    factory Customrespon.fromJson(Map<String,dynamic> json) => _$CustomresponFromJson(json);
    Map<String, dynamic> toJson() => _$CustomresponToJson(this);
}
