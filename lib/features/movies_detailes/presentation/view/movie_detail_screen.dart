import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_fonts.dart';
import 'package:movies_app/core/resourses/manager_size.dart';
import 'package:movies_app/core/resourses/manager_strings.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:movies_app/features/movies_detailes/domain/model/movie_detailes_model.dart';
import 'package:movies_app/features/movies_detailes/presentation/contoller/movies_detailes_controller.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MoviesDetailesController>(builder: (controller) {
        return CustomScrollView(
          key: const Key('movieDetailScrollView'),
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: ManagerColors.white,
                ),
                onPressed: () {
                  Get.back();
                  Get.delete<MoviesDetailesController>();
                },
              ),
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.5, 1.0, 1.0],
                      ).createShader(
                        Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width,
                      imageUrl: ApiConstants.imageUrl(controller.backdropPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.title,
                          style: getBoldStyle(
                              fontSize: ManagerFontSize.s22,
                              color: ManagerColors.white)),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: ManagerHeight.h2,
                              horizontal: ManagerWidth.w8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(controller.releaseDate.split('-')[0],
                                style: getMediumStyle(
                                    fontSize: ManagerFontSize.s18,
                                    color: ManagerColors.white)),
                          ),
                          SizedBox(width: ManagerWidth.w20),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                              ),
                              SizedBox(width: ManagerWidth.w4),
                              Text(
                                (controller.voteAverage / 2).toStringAsFixed(1),
                                style: getMediumStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color: ManagerColors.white),
                              ),
                              SizedBox(width: ManagerWidth.w4),
                              Text(
                                '(${controller.voteAverage})',
                                style: getMediumStyle(
                                    fontSize: ManagerFontSize.s6,
                                    color: ManagerColors.white),
                              ),
                            ],
                          ),
                          SizedBox(width: ManagerWidth.w20),
                          Text(
                            _showDuration(controller.runtime),
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: ManagerFontSize.s20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ManagerHeight.h20),
                      Text(
                        controller.overview,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.white),
                      ),
                      SizedBox(height: ManagerHeight.h8),
                      Text(
                        '${ManagerStrings.genres}: ${_showGenres(controller.genres)}',
                        style: getMediumStyle(
                          color: Colors.white70,
                          fontSize: ManagerFontSize.s14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: ManagerHeight.h12, horizontal: ManagerWidth.w12),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    ManagerStrings.moreLikeThis,
                    style: getMediumStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.white),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: _showRecommendations(),
            ),
          ],
        );
      }),
    );
  }
}

String _showGenres(List<GenresModel> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

Widget _showRecommendations() {
  return GetBuilder<MoviesDetailesController>(builder: (controller) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.network(
                ApiConstants.imageUrl(
                    controller.recommndetionalMovies[index].backdropPath ??
                        "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg"),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: controller.recommndetionalMovies.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  });
}

String _showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}
