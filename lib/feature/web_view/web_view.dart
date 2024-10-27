import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/style/app_color.dart';

class WebView extends StatelessWidget {
  final String title;
  final String? htmlString;
  final String? url;
  final bool isDanger;

  const WebView({
    super.key,
    this.htmlString,
    this.url,
    required this.title,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    late final WebViewController controller;
    controller = WebViewController();

    if (htmlString != null) {
      controller.loadHtmlString(htmlString!);
    } else {
      controller.loadRequest(Uri.parse(url!));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        foregroundColor: isDanger ? Colors.white : AppColors.accentColor,
        backgroundColor: isDanger ? AppColors.dangerColor : Colors.white,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
