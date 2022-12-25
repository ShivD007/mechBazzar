import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/string_constants.dart';
import '../core/constants/url_constants.dart';
import '../core/helper_ui.dart';
import '../core/models/category_post_res_model.dart';
import '../core/models/category_res_model.dart';
import '../core/models/failure_model.dart';
import '../networking/remote_api_repository.dart';

class CategoryPostController extends GetxController with HelperUI {
  final RemoteApiRepository remoteApi;
  CategoryPostController({required this.remoteApi});

  List<CategoryResModel> categories = [];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<List<CategoryPostResModel>> getCategoryPostList(String? id,
      {int? pageNo,
      int? page_limit = 20,
      String? search,
      bool? showLoading = true}) async {
    if (showLoading!) {
      showLoadingDialog();
    }

    Either<FailureModel, dynamic> response = await remoteApi.getApiRequest(
        CATEGORY_POST_URL(id, pageNo ?? 1, page_limit!, search), {}, "");

    List<CategoryPostResModel> list = [];
    if (showLoading) {
      hideLoadingDialog();
    }
    response.fold((failure) {
      showSnackbar(failure.errorMessage!);
    }, (apiResponse) async {
      final dynamic categoriesResModel = apiResponse is List
          ? apiResponse
              .map((data) => CategoryPostResModel.fromJson(data))
              .toList()
          : CategoryResModel.fromJson(apiResponse);
      if (apiResponse is Map) {
        showSnackbar(categoriesResModel.msg ?? SOMETHING_WENT_WRONG);
        return;
      }
      // onsuccess
      else {
        list.addAll(List<CategoryPostResModel>.from(categoriesResModel));
      }
    });

    return list;
  }

  @override
  void onClose() {}
}
