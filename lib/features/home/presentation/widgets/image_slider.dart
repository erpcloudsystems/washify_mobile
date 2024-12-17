import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.images,
    this.isAutoSliding = true,
    this.viewPort = 0.8,
  });
  final List<String?> images;
  final bool isAutoSliding;
  final double viewPort;
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int current = 0;
  final sliderController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.images.isNotEmpty)
          InkWell(
            onTap: () {
              RoutesService.pushNamed(
                AppRoutes.shopScreen,
                context: context,
                queryParameters: {'id' : current.toString()}
              );
            },
            child: slider.CarouselSlider.builder(
              options: slider.CarouselOptions(
                autoPlay: widget.isAutoSliding,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
              itemCount: widget.images.length,
              itemBuilder: (ctx, index, _) => Image.asset(
                widget.images[index]!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              carouselController: sliderController,
            ),
          ),
        if (widget.images.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.images.asMap().entries.map((entry) {
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
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
