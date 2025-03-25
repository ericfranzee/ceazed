import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:temiwa/domain/di/dependency_manager.dart';
import 'package:temiwa/domain/interface/form.dart';
import 'package:temiwa/domain/model/response/form_options_response.dart';
import 'package:temiwa/infrastructure/service/services.dart';
import 'package:temiwa/infrastructure/local_storage/local_storage.dart';

class FormOptionsRepository implements FormOptionsInterface {
  @override
  Future<Either<FormOptionsResponse, dynamic>> getAllForms(
      {required List<int>? serviceMasterIds}) async {
    final data = {
      'perPage': 100,
      'lang': LocalStorage.getLanguage()?.locale,
      for (int i = 0; i < (serviceMasterIds?.length ?? 0); i++)
        "service_master_ids[$i]": serviceMasterIds?[i],
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/form-options',
        queryParameters: data,
      );
      return left(FormOptionsResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get all form failure: $e');
      return right(AppHelpers.errorHandler(e));
    }
  }

  @override
  Future<Either<FormOptionsData, dynamic>> getSingleForm(int? id) async {
    final data = {
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/form-options/$id',
          queryParameters: data);
      return left(FormOptionsData.fromJson(response.data["data"]));
    } catch (e) {
      debugPrint('==> get form failure: $e');
      return right(AppHelpers.errorHandler(e));
    }
  }
}
