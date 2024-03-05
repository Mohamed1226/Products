import 'dart:convert';
import 'dart:developer';

import 'package:ready_structure/core/networking/models/api/message/message_model.dart';
import 'package:ready_structure/core/networking/models/bases/base_model.dart';

typedef T ResponseConverter<T>(
  Map<String, dynamic> json,
);
typedef T GeneralResponseConverter<T>(Map<String, dynamic> json);

/// General response coming from API
///
/// - 'D' is data model [BaseApiDataModel]
class ApiResponseModel<D extends BaseModel> {
  ApiResponseModel({
    this.data,
  });

  static MessageModel parseMessage(Map<String, dynamic> json) {
    return json["message"] == null
        ? MessageModel(success: false, messages: "unknown_error")
        : MessageModel.fromJson(json["message"]);
  }

  final D? data;

  factory ApiResponseModel.fromJson(
      dynamic json, ResponseConverter<D> converter) {

    return ApiResponseModel(
      data:  (json is List
              ? converter(
                  {
                    'items': json,
                  },
                )
              : (json["data"] is Map<String, dynamic>
                  ? converter(json["data"])
                  : converter({'val': json["data"]}))),
    );
  }

  factory ApiResponseModel.fromRawJson(response,
      {required ResponseConverter<D> converter}) {
    var decodedJson;

    if (response?.data is String) {
      // log('response.data length ${response.data.length}');
      decodedJson = json.decode(response.data);
    } else
      decodedJson = response.data;
    return ApiResponseModel.fromJson(decodedJson, converter);
  }
}
