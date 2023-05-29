import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_library/dashboard/controller/dashboard_controller.dart';
import 'package:picture_library/details/view/picture_details_screen.dart';
import 'package:picture_library/utils/color_utilities.dart';
import 'package:picture_library/utils/font_style_utilities.dart';
import 'package:picture_library/widgets/custom_text_field.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DashboardController _dashboardCotroller =
      Get.find(tag: DashboardController().toString());
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  int page = 0;
  bool isLoading = false;
  bool isSearching = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _dashboardCotroller.getPhotos(page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() async {
      isLoading = true;
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        page++;
        bool isEmpty = isSearching
            ? await _dashboardCotroller.getSearchPhotos(
                page, searchController.text.trim())
            : await _dashboardCotroller.getPhotos(page);
        if (isEmpty) {
          page = 0;
          isSearching
              ? await _dashboardCotroller.getSearchPhotos(
                  page, searchController.text.trim())
              : await _dashboardCotroller.getPhotos(page);
        }
      }
      isLoading = false;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Library'),
        backgroundColor: ColorUtilities.blueColor,
      ),
      body: GetBuilder(
          init: _dashboardCotroller,
          builder: (context) {
            if (_dashboardCotroller.photos == null ||
                (isSearching && _dashboardCotroller.searchPhotos == null)) {
              return SingleChildScrollView(
                child: SkeletonLoader(
                  builder: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: ColorUtilities.whiteColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: 10,
                                color: ColorUtilities.whiteColor,
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 12,
                                color: ColorUtilities.whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  items: 10,
                  period: const Duration(seconds: 2),
                  highlightColor: ColorUtilities.blueColor,
                  direction: SkeletonDirection.ltr,
                ),
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomTextField(
                        onChanged: (value) async {
                          isSearching = true;
                          page = 0;
                          setState(() {});
                          await _dashboardCotroller.getSearchPhotos(
                              page, value.trim());
                        },
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                          color: ColorUtilities.blueColor,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            isSearching = false;
                            searchController.clear();
                            setState(() {});
                          },
                          child: const Icon(
                            Icons.close,
                            size: 30,
                            color: ColorUtilities.blueColor,
                          ),
                        ),
                        controller: searchController,
                        hintText: "Search",
                        labelText: 'Search',
                        radius: 30),
                  ),
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: isSearching
                            ? _dashboardCotroller.searchPhotos!.results!.length
                            : _dashboardCotroller.photos!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              isSearching
                                  ? Get.to(PictureDetails(
                                      photo: null,
                                      result: _dashboardCotroller
                                          .searchPhotos!.results![index],
                                    ))
                                  : Get.to(PictureDetails(
                                      result: null,
                                      photo: _dashboardCotroller.photos![index],
                                    ));
                            },
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        imageUrl: isSearching
                                            ? _dashboardCotroller.searchPhotos!
                                                .results![index].urls!.raw!
                                            : _dashboardCotroller
                                                .photos![index].urls!.raw!,
                                        placeholder: (context, url) =>
                                            const CupertinoActivityIndicator(
                                                radius: 20,
                                                color:
                                                    ColorUtilities.blueColor),
                                        errorWidget: (context, url, error) =>
                                            const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, top: 20, bottom: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            isSearching
                                                ? "Posted By ${_dashboardCotroller.searchPhotos!.results![index].user?.firstName ?? ""} ${_dashboardCotroller.searchPhotos!.results![index].user?.lastName ?? ""}"
                                                : "Posted By ${_dashboardCotroller.photos![index].user?.firstName ?? ""} ${_dashboardCotroller.photos![index].user?.lastName ?? ""}",
                                            style: FontStyleUtilities.h16(
                                                fontColor:
                                                    ColorUtilities.blueColor,
                                                fontWeight: FWT.bold),
                                          ),
                                          const SizedBox(height: 10),
                                          isSearching
                                              ? const SizedBox()
                                              : Text(
                                                  _dashboardCotroller
                                                          .photos![index]
                                                          .sponsorship
                                                          ?.tagline ??
                                                      "Make tagline",
                                                  style: FontStyleUtilities.h14(
                                                      fontColor: ColorUtilities
                                                          .blueColor,
                                                      fontWeight: FWT.medium),
                                                ),
                                          const SizedBox(height: 5),
                                          Text(
                                            isSearching
                                                ? "${_dashboardCotroller.searchPhotos!.results![index].altDescription}"
                                                : "${_dashboardCotroller.photos![index].altDescription}",
                                            style: FontStyleUtilities.h14(
                                              fontColor:
                                                  ColorUtilities.blueColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(bottom: 100),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox()
                ],
              );
            }
          }),
    );
  }
}
