import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';

import '../../../l10n/localization.dart';
import '../../../utils/resources/api/token_manager.dart';
import '../../style/app_color.dart';
import '../../style/dimensions.dart';
import '../../style/theme/themes.dart';

class ApiImageWidget extends StatelessWidget {
  final String? imageFilename;
  final String baseUrl;
  final double height;
  final double width;
  final double? borderRadius;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxFit? fit;
  final bool isProfilePicture;
  final bool hasImageViewer;
  final bool isAsset;

  const ApiImageWidget({
    super.key,
    required this.imageFilename,
    required this.baseUrl,
    this.isAsset = false,
    this.height = 80.0,
    this.width = 80.0,
    this.borderRadius = Dimensions.smallValue,
    this.iconSize,
    this.backgroundColor,
    this.foregroundColor,
    this.fit,
    this.isProfilePicture = false,
    this.hasImageViewer = false,
  });

  @override
  Widget build(BuildContext context) {
    return imageFilename != null
        ? isAsset
            ? _buildAssetImage(context)
            : _buildCachedNetworkImage(context)
        : _buildPlaceholderImage();
  }

  Widget _buildAssetImage(BuildContext context) {
    return SizedBox(
      key: Key(imageFilename!),
      height: height,
      width: width,
      child: _buildImage(context, AssetImage(imageFilename!)),
    );
  }

  Widget _buildCachedNetworkImage(BuildContext context) {
    final imageUrl = "$baseUrl/$imageFilename";

    return CachedNetworkImage(
      key: Key(imageUrl),
      height: height,
      width: width,
      cacheKey: imageUrl,
      imageUrl: imageUrl,
      httpHeaders: {
        'Authorization': 'Bearer ${TokenManager.storedToken}',
      },
      imageBuilder: (context, imageProvider) =>
          _buildImage(context, imageProvider),
      progressIndicatorBuilder: (context, url, progress) =>
          _buildProgressIndicator(),
      errorWidget: (context, url, error) => _buildPlaceholderImage(),
    );
  }

  Widget _buildImage(BuildContext context, ImageProvider imageProvider) {
    final imageWidget = Image(image: imageProvider, fit: fit);

    return isProfilePicture
        ? CircleAvatar(backgroundImage: imageProvider)
        : InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: hasImageViewer
                ? () => _showImageViewer(context, imageProvider)
                : null,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.primaryDarkColor,
                borderRadius: BorderRadius.circular(
                  borderRadius ?? Dimensions.smallValue,
                ),
              ),
              child: imageWidget,
            ),
          );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: SpinKitFadingCircle(
        color: AppColors.primaryColor,
        size: 50.0,
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return isProfilePicture
        ? SizedBox(
            height: height,
            width: width,
            child: CircleAvatar(
              backgroundColor: backgroundColor ?? Colors.grey,
              child: Icon(
                Icons.person,
                color: foregroundColor ?? AppColors.textColorInverted,
                size: iconSize,
              ),
            ),
          )
        : SizedBox(
            height: height,
            width: width,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius ?? 0),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  color: foregroundColor ?? AppColors.textColorInverted,
                  size: iconSize ?? 60,
                ),
              ),
            ),
          );
  }

  void _showImageViewer(BuildContext context, ImageProvider imageProvider) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(intl.imageViewer),
            backgroundColor: AppColors.primaryDarkColor.withOpacity(0.5),
            foregroundColor: AppColors.primaryLightColor,
            systemOverlayStyle: Themes.darkSystemUI,
          ),
          extendBodyBehindAppBar: true,
          body: PhotoView(imageProvider: imageProvider),
        ),
      ),
    );
  }
}
