import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;

  final BoxFit fit;
  final double width;
  final double height;

  const CustomCachedImage(
      {required this.imageUrl,
      this.fit = BoxFit.cover,
      required this.width,
      required this.height,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        fit: BoxFit.cover,
        placeholder: (context, url) => Platform.isAndroid
            ? const CircularProgressIndicator()
            : const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/img_not_found.png'),
              fit: BoxFit.cover,
            ))),
      ),
    );
  }
}
