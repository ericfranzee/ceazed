

import 'package:temiwa/domain/model/model/order_model.dart';

import '../model/meta_model.dart';

class OrderPaginateResponse {
  OrderPaginateResponse({
    List<OrderShops>? data,
    Meta? meta,
  }) {
    _data = data;
    _meta = meta;
  }

  OrderPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OrderShops.fromJson(v));
      });
    }
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<OrderShops>? _data;
  Meta? _meta;

  OrderPaginateResponse copyWith({
    List<OrderShops>? data,
    Meta? meta,
  }) =>
      OrderPaginateResponse(
        data: data ?? _data,
        meta: meta ?? _meta,
      );

  List<OrderShops>? get data => _data;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}
