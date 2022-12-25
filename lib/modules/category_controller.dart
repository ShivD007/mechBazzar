import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/constants/string_constants.dart';
import '../core/constants/url_constants.dart';
import '../core/helper_ui.dart';
import '../core/models/category_res_model.dart';
import '../core/models/failure_model.dart';
import '../networking/remote_api_repository.dart';

class CategoryController extends GetxController with HelperUI {
  final RemoteApiRepository remoteApi;

  CategoryController({required this.remoteApi});
  int page = 1;
  List<CategoryResModel> categories = [];
  int lastFetchedItemLength = 0;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future getCategoryList(
      {bool? showLoading = true,
      int? limit = 80,
      bool? isForceLoad = false}) async {
    List<CategoryResModel> list = [];
    if (isForceLoad!) {
      list.addAll(categories);
      categories.clear();
    }
    if (categories.isEmpty) {
      if (showLoading!) {
        showLoadingDialog();
      }
      Either<FailureModel, dynamic> response = await remoteApi.getApiRequest(
          CATEGORY_URL(perpage: limit, page: page), {}, "");
      if (showLoading) {
        hideLoadingDialog();
      }
      response.fold((failure) {
        showSnackbar(failure.errorMessage!);
        categories.addAll(list);
      }, (apiResponse) async {
        final dynamic categoriesResModel = apiResponse is List
            ? apiResponse
                .map((data) => CategoryResModel.fromJson(data))
                .toList()
            : CategoryResModel.fromJson(apiResponse);

        if (apiResponse is Map) {
          showSnackbar(categoriesResModel.msg ?? SOMETHING_WENT_WRONG);
          categories.addAll(list);
          return;
        }
        final _tempList = List<CategoryResModel>.from(categoriesResModel);
        // onsuccess
        if (_tempList.isNotEmpty) {
          lastFetchedItemLength = _tempList.length;
        }
        categories.addAll(_tempList);
        update();
        page++;
      });
    }
  }

  @override
  void onClose() {}
}
