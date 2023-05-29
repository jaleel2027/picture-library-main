import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picture_library/home/model/photos_response_model.dart';
import 'package:picture_library/utils/font_style_utilities.dart';

import '../../home/model/search_photos_model.dart';
import '../../utils/color_utilities.dart';

class PictureDetails extends StatefulWidget {
  final Results? result;
  final PhotosResponse? photo;
  const PictureDetails({super.key, this.result, this.photo});

  @override
  State<PictureDetails> createState() => _PictureDetailsState();
}

class _PictureDetailsState extends State<PictureDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Details'),
        backgroundColor: ColorUtilities.blueColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    imageUrl: widget.photo == null
                        ? widget.result!.urls!.raw!
                        : widget.photo!.urls!.raw!,
                    placeholder: (context, url) =>
                        const CupertinoActivityIndicator(
                            radius: 30, color: ColorUtilities.blueColor),
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: ColorUtilities.blueColor.withOpacity(0.6),
                          width: 2)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        widget.photo == null
                            ? 'Posted by: ${widget.result!.user!.firstName ?? ""}${widget.result!.user!.lastName ?? ""}'
                            : 'Posted by: ${widget.photo!.user!.firstName ?? ""}${widget.photo!.user!.lastName ?? ""}',
                        style: FontStyleUtilities.h18(
                            fontColor: ColorUtilities.blueColor,
                            fontWeight: FWT.bold),
                      ),
                      const Divider(
                          color: ColorUtilities.blueColor,
                          indent: 20,
                          endIndent: 20),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: CircleAvatar(
                              maxRadius: 40,
                              minRadius: 40,
                              backgroundColor: ColorUtilities.blueColor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                    placeholder: (context, url) =>
                                        const CupertinoActivityIndicator(
                                            radius: 10,
                                            color: ColorUtilities.blueColor),
                                    errorWidget: (context, url, error) =>
                                        const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(Icons.error),
                                        ),
                                    imageUrl: widget.photo == null
                                        ? widget
                                            .result!.user!.profileImage!.large!
                                        : widget
                                            .photo!.user!.profileImage!.large!),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.photo == null
                                        ? widget.result!.user!.username ?? ""
                                        : widget.photo!.user!.username ?? "",
                                    style: FontStyleUtilities.h16(
                                        fontColor: ColorUtilities.blueColor,
                                        fontWeight: FWT.bold),
                                  ),
                                  Text(
                                    widget.photo == null
                                        ? widget.result!.user!.portfolioUrl ??
                                            ""
                                        : widget.photo!.user!.portfolioUrl ??
                                            "",
                                    style: FontStyleUtilities.h14(
                                        fontColor: ColorUtilities.blueColor),
                                  ),
                                  Text(
                                    widget.photo == null
                                        ? 'Total Photos: ${widget.result!.user!.totalPhotos ?? 0}'
                                        : 'Total Photos: ${widget.photo!.user!.totalPhotos ?? 0}',
                                    style: FontStyleUtilities.h14(
                                        fontColor: ColorUtilities.blueColor),
                                  ),
                                  Text(
                                    widget.photo == null
                                        ? 'Total Likes: ${widget.result!.user!.totalLikes ?? 0}'
                                        : 'Total Likes: ${widget.photo!.user!.totalLikes ?? 0}',
                                    style: FontStyleUtilities.h14(
                                        fontColor: ColorUtilities.blueColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.photo == null
                          ? widget.result!.altDescription ?? ""
                          : widget.photo!.altDescription ?? "",
                      style: FontStyleUtilities.h14(
                          fontColor: ColorUtilities.blueColor,
                          fontWeight: FWT.bold),
                    ),
                    Text(
                      widget.photo == null
                          ? widget.result!.description ?? ""
                          : widget.photo!.description ?? "",
                      style: FontStyleUtilities.h14(
                          fontColor: ColorUtilities.blueColor,
                          fontWeight: FWT.bold),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
