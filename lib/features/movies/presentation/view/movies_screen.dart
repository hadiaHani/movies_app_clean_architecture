import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/core/resourses/manager_color.dart';
import 'package:movies_app/core/resourses/manager_fonts.dart';
import 'package:movies_app/core/resourses/manager_size.dart';
import 'package:movies_app/core/resourses/manager_strings.dart';
import 'package:movies_app/core/resourses/manager_styles.dart';
import 'package:movies_app/features/movies/presentation/contoller/home_controller.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/now_playing_component.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/popular_component.dart';
import 'package:movies_app/features/movies/presentation/view/widgets/top_rated_component.dart';
import 'package:movies_app/routes/routes.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: GetBuilder<HomeController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NowPlayingComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ManagerStrings.popular,
                        style: getMediumStyle(
                          fontSize: ManagerFontSize.s20,
                          color: ManagerColors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getPopularMovies();
                          Get.toNamed(Routes.popularMovies);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ManagerHeight.h8,
                              horizontal: ManagerWidth.w8),
                          child: Row(
                            children: [
                              Text(
                                ManagerStrings.seeMore,
                                style: getMediumStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.white,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const PopularComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ManagerStrings.topRated,
                          style: getMediumStyle(
                            fontSize: ManagerFontSize.s20,
                            color: ManagerColors.white,
                          )),
                      InkWell(
                        onTap: () {
                          controller.getTopRatedMovies();
                          Get.toNamed(Routes.topRatedMovies);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ManagerHeight.h8,
                              horizontal: ManagerWidth.w8),
                          child: Row(
                            children: [
                              Text(
                                ManagerStrings.seeMore,
                                style: getMediumStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.white,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const TopRatedComponent(),
                SizedBox(height: ManagerHeight.h10),
              ],
            );
          }),
        );
      }),
    );
  }
}
