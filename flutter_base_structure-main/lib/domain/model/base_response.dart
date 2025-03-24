import 'package:flutter_base_structure/domain/enum/index.dart';

class BaseResponse<T> {
  T? data;
  T? order;
  T? wallet;
  late bool success;
  String? msg;
  String? code;
  List<T>? dataList;

  BaseResponse(
      {this.data, required this.success, this.code, this.msg, this.dataList, this.order, this.wallet});

  BaseResponse.fromJson(
      {required Map<String, dynamic> json, Function? fromJsonModel}) {
    var dataT = json['data'];
    var orderT = json['order'];
    var walletT = json['wallet'];
    success = json['success'];
    msg = json['message'];
    code = json['code'];
    dataList = null;
    if (dataT != null && fromJsonModel != null) {
      data = fromJsonModel(dataT);
    } else {
      data = dataT;
    }

    if (orderT != null && fromJsonModel != null) {
      order = fromJsonModel(orderT);
    } else {
      order = orderT;
    }
    if (walletT != null && fromJsonModel != null){
      wallet = fromJsonModel(walletT);
    } else {
      wallet = walletT;
    }
  }

  BaseResponse.fromJsonList(
      {required Map<String, dynamic> json, Function? fromJsonModel}) {
    var dataT = json['data'];
    success = json['ok'] ?? json['success'];
    msg = json['message'];
    code = json['code'];

    if (dataT != null && fromJsonModel != null) {
      dataList = <T>[];
      dataT.forEach((v) {
        dataList!.add(fromJsonModel(v));
      });
    }
  }

  Map<String, dynamic> toJson() =>
      {'data': data, 'success': success, 'message': msg, 'code': code};

  // bool isVerified() {
  //   return code == PhoneNumberStatus.userVerified.status;
  // }
}
