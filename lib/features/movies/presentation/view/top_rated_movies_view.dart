import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/cache/cache.dart';
import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_fonts.dart';
import 'package:movies_app/core/resourses/manager_size.dart';
import 'package:movies_app/core/resourses/manager_strings.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:movies_app/features/movies/presentation/contoller/home_controller.dart';
import 'package:movies_app/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedMoviesView extends StatelessWidget {
  const TopRatedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: ManagerColors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(ManagerStrings.topRatedMovies),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          var movies = controller.topRatedMovieList;
          return movies.isEmpty
              ? Container()
              : ListView.builder(
                  itemCount: controller.popularMoviesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        CacheData().setId(movies[index].id);

                        Get.toNamed(Routes.detailesView);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: ManagerHeight.h8,
                            horizontal: ManagerWidth.w8),
                        child: Card(
                          color: ManagerColors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(ManagerRadius.r12)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ManagerHeight.h8,
                                horizontal: ManagerWidth.w8),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(ManagerRadius.r10)),
                                  child: CachedNetworkImage(
                                    width: ManagerWidth.w100,
                                    height: ManagerHeight.h115,
                                    fit: BoxFit.cover,
                                    imageUrl: ApiConstants.imageUrl(
                                        movies[index].backdropPath ??
                                            "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg"),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(width: ManagerWidth.w10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movies[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: getRegularTextStyle(
                                          color: ManagerColors.white,
                                          fontSize: ManagerFontSize.s18,
                                        ),
                                      ),
                                      SizedBox(height: ManagerHeight.h6),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: ManagerColors
                                                    .cancelledStatus,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        ManagerRadius.r10)),
                                            width: ManagerWidth.w40,
                                            height: ManagerHeight.h40,
                                            alignment: Alignment.center,
                                            child: Text(
                                              movies[index]
                                                  .releaseDate
                                                  .split('-')[0],
                                              style: getRegularTextStyle(
                                                  fontSize: ManagerFontSize.s14,
                                                  color: ManagerColors.white),
                                            ),
                                          ),
                                          SizedBox(width: ManagerWidth.w10),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: ManagerIconSize.s24,
                                          ),
                                          SizedBox(width: ManagerWidth.w2),
                                          Text(
                                            "${movies[index].voteAverage}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: ManagerHeight.h6),
                                      Text(
                                        movies[index].overview,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: getTextStyle(
                                          weight: ManagerFontWeight.w300,
                                          color: ManagerColors.white,
                                          fontSize: ManagerFontSize.s16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
