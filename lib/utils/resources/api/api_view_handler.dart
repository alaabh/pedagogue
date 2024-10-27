import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../l10n/localization.dart';
import '../../../main.dart';
import '../../../shared/widget/custom_dialog.dart';
import '../../../shared/widget/custom_error_widget.dart';
import '../../../shared/widget/loading_widget.dart';
import 'api_response.dart';

typedef ApiWidgetBuilder<A> = Widget Function(A value);
typedef ApiWidgetBuilder2<A, B> = Widget Function(A value1, B value2);
typedef ApiWidgetBuilder3<A, B, C> = Widget Function(
  A value1,
  B value2,
  C value3,
);

class ApiViewHandler {
  static Future<void> withAlert({
    required BuildContext context,
    bool showIndicator = true,
    required Future<ApiResponse> apiCall,
    required Function() successFunction,
    Function? failureFunction,
  }) async {
    if (showIndicator && !context.loaderOverlay.visible) {
      context.loaderOverlay.show();
    }

    await apiCall.then((apiResponse) {
      if (apiResponse.status == ApiStatus.completed) {
        successFunction();
      } else {
        if (failureFunction != null) {
          failureFunction();
        } else {
          AlertMaker.showSimpleAlertDialog(
            context: context,
            title: intl.error,
            description: apiResponse.message,
            alertType: AlertType.danger,
          );
        }
      }
    }).whenComplete(() {
      if (showIndicator && context.loaderOverlay.visible) {
        context.loaderOverlay.hide();
      }
    });
  }

  static Future<void> futureWithAlert<T>({
    required BuildContext context,
    bool showIndicator = true,
    required Future<T> future,
    required Function(T result) successFunction,
    Function? failureFunction,
  }) async {
    if (showIndicator && !context.loaderOverlay.visible) {
      context.loaderOverlay.show();
    }

    bool hasError = false;
    dynamic result;

    try {
      result = await future;
    } catch (e) {
      if (failureFunction != null) {
        failureFunction();
      } else {
        AlertMaker.showSimpleAlertDialog(
          context: mainNavigatorKey.currentContext ?? context,
          title: intl.error,
          description: e.toString(),
          alertType: AlertType.danger,
        );
      }
    }

    if (!hasError) successFunction(result);

    if (showIndicator &&
        (mainNavigatorKey.currentContext?.loaderOverlay.visible ?? false)) {
      mainNavigatorKey.currentContext?.loaderOverlay.hide();
    }
  }

  static Future<void> futureListWithAlert({
    required BuildContext context,
    bool showIndicator = true,
    required List<Future> futureList,
    required Function() successFunction,
    Function? failureFunction,
  }) async {
    if (showIndicator && !context.loaderOverlay.visible) {
      context.loaderOverlay.show();
    }

    bool hasError = false;

    for (var future in futureList) {
      try {
        await future;
      } catch (e) {
        hasError = true;
        if (failureFunction != null) {
          failureFunction();
        } else {
          AlertMaker.showSimpleAlertDialog(
            context: mainNavigatorKey.currentContext ?? context,
            title: intl.error,
            description: e.toString(),
            alertType: AlertType.danger,
          );
        }
      }
    }

    if (!hasError) successFunction();

    if (showIndicator &&
        (mainNavigatorKey.currentContext?.loaderOverlay.visible ?? false)) {
      mainNavigatorKey.currentContext?.loaderOverlay.hide();
    }
  }

  static Widget modelBuilder<Model>({
    required BuildContext context,
    required Rx<ApiResponse<Model>> apiResponse,
    Widget Function()? loadingWidgetBuilder,
    required ApiWidgetBuilder<Model> builder,
    Function? refreshFunction,
  }) {
    switch (apiResponse.value.status) {
      case ApiStatus.completed:
        return apiResponse.value.item == null
            ? Center(child: Text(intl.noData))
            : builder(apiResponse.value.item as Model);
      case ApiStatus.loading:
        return loadingWidgetBuilder != null
            ? loadingWidgetBuilder()
            : const LoadingWidget();
      case ApiStatus.error:
        return CustomErrorWidget(
          errorText: apiResponse.value.message,
          tapFunction: refreshFunction,
        );
    }
  }

  static Widget modelListBuilder<T>(
    BuildContext context, {
    required Rx<ApiResponse<T>> apiResponse,
    Widget Function()? loadingWidgetBuilder,
    required ApiWidgetBuilder<List<T>> builder,
    Future<void> Function()? refreshFunction,
  }) {
    switch (apiResponse.value.status) {
      case ApiStatus.completed:
        return apiResponse.value.itemList.isEmpty
            ? Center(child: Text(intl.noData))
            : builder(apiResponse.value.itemList);
      case ApiStatus.loading:
        return loadingWidgetBuilder != null
            ? loadingWidgetBuilder()
            : const LoadingWidget();
      case ApiStatus.error:
        return CustomErrorWidget(
          errorText: apiResponse.value.message,
          tapFunction: refreshFunction,
        );
    }
  }

  static Widget modelListBuilder3<A, B, C>(
    BuildContext context, {
    required Rx<ApiResponse<A>> apiResponse1,
    required Rx<ApiResponse<B>> apiResponse2,
    required Rx<ApiResponse<C>> apiResponse3,
    Widget Function()? loadingWidgetBuilder,
    required ApiWidgetBuilder3<List<A>, List<B>, List<C>> builder,
    Future<void> Function()? refreshFunction,
  }) {
    ApiStatus apiStatus = _calculateOverallStatus(
      apiResponse1.value.status,
      apiResponse2.value.status,
      apiResponse3.value.status,
    );

    switch (apiStatus) {
      case ApiStatus.completed:
        return apiResponse1.value.itemList.isEmpty
            ? Center(child: Text(intl.noData))
            : builder(
                apiResponse1.value.itemList,
                apiResponse2.value.itemList,
                apiResponse3.value.itemList,
              );
      case ApiStatus.loading:
        return loadingWidgetBuilder != null
            ? loadingWidgetBuilder()
            : const LoadingWidget();
      case ApiStatus.error:
        return CustomErrorWidget(
          errorText: '${apiResponse1.value.message} - '
              '${apiResponse2.value.message} - '
              '${apiResponse3.value.message}',
          tapFunction: refreshFunction,
        );
    }
  }

  static ApiStatus _calculateOverallStatus(
    ApiStatus status1,
    ApiStatus status2,
    ApiStatus status3,
  ) {
    // Choose the highest status among the three
    if (status1 == ApiStatus.error ||
        status2 == ApiStatus.error ||
        status3 == ApiStatus.error) {
      return ApiStatus.error;
    } else if (status1 == ApiStatus.loading ||
        status2 == ApiStatus.loading ||
        status3 == ApiStatus.loading) {
      return ApiStatus.loading;
    } else {
      return ApiStatus.completed;
    }
  }
}
