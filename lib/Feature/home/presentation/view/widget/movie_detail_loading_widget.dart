import 'package:flutter/material.dart';
import 'package:movie/Feature/home/presentation/view/widget/custom_loading_carousel_slider.dart';

class MovieDetailLoadingWidget extends StatelessWidget {
  const MovieDetailLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomLoadingCarouselSlider(
        heightLoading: MediaQuery.sizeOf(context).height * .3,
        widthLoading: MediaQuery.sizeOf(context).width,
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomLoadingCarouselSlider(
          heightLoading: 15,
          widthLoading: MediaQuery.sizeOf(context).width * .5,
        ),
      ),
      const SizedBox(height: 8.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
            children: List.generate(
          3,
          (index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomLoadingCarouselSlider(
                heightLoading: 15,
                widthLoading: 30,
              ),
            );
          },
        )),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomLoadingCarouselSlider(
          heightLoading: MediaQuery.sizeOf(context).height * .2,
          widthLoading: MediaQuery.sizeOf(context).width,
        ),
      ),
      const SizedBox(height: 20.0),
    ]);
  }
}
// class SliverGridRecommendation extends StatelessWidget {
//   const SliverGridRecommendation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverGrid(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           final recommendation = recommendationDummy[index];
//           return FadeInUp(
//             from: 20,
//             duration: const Duration(milliseconds: 500),
//             child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//               child: CachedNetworkImage(
//                 imageUrl: ApiConstants.imageUrl(recommendation.backdropPath),
//                 placeholder: (context, url) => const CustomLoadingCarouselSlider(
//                   heightLoading: 170, widthLoading: 120),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                 height: 180.0,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//         childCount: recommendationDummy.length,
//       ),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         mainAxisSpacing: 8.0,
//         crossAxisSpacing: 8.0,
//         childAspectRatio: 0.7,
//         crossAxisCount: 3,
//       ),
//     );
//     ;
//   }
// }
