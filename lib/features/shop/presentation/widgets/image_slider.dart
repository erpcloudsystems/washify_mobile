import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/error_widget.dart';
import 'package:washify_mobile/features/shop/logic/cubit/shop_cubit.dart';

import '../../../../core/utils/cached_image.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    this.isAutoSliding = true,
    this.viewPort = 0.8,
  });
  final bool isAutoSliding;
  final double viewPort;
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  void initState() {
    super.initState();
    context.read<ShopCubit>().getShopItems();
  }

  int current = 0;
  final sliderController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state is ShopLoadingState) {
          return Skeletonizer(
            enabled: true,
            child: Image.asset(
              ImagePaths.errorImagePath,
              width: double.infinity,
              height: 200,
            ),
          );
        } else if (state is ShopErrorState) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        final shopItems = context.watch<ShopCubit>().shopItems;
        return Column(
          children: [
            if (shopItems.isNotEmpty)
              InkWell(
                onTap: () {
                  RoutesService.pushNamed(
                    AppRoutes.shopScreen,
                    context: context,
                    extra: shopItems[current],
                  );
                },
                child: slider.CarouselSlider.builder(
                  options: slider.CarouselOptions(
                    autoPlay: widget.isAutoSliding,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    viewportFraction: widget.viewPort,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                  ),
                  itemCount: shopItems.length,
                  itemBuilder: (ctx, index, _) => CachedImage(
                    imageUrl: shopItems[index].image,
                    width: double.infinity,
                  ),
                  carouselController: sliderController,
                ),
              ),
            if (shopItems.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: shopItems.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => sliderController.animateToPage(entry.key),
                    child: Container(
                      width: 8.w,
                      height: 12.h,
                      margin: EdgeInsets.symmetric(
                        vertical: 8.0.h,
                        horizontal: 4.0.w,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
          ],
        );
      },
    );
  }
}
