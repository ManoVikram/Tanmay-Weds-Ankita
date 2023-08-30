import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/animated_carousel_scroll_indicator.dart';
import '../../constants.dart';

class ViewMediaScreen extends StatefulWidget {
  const ViewMediaScreen({
    super.key,
    required this.media,
    required this.index,
  });

  final List<String> media;
  final int index;

  static const String route = "/viewMediaScreen";

  @override
  State<ViewMediaScreen> createState() => _ViewMediaScreenState();
}

class _ViewMediaScreenState extends State<ViewMediaScreen> {
  late PageController _carouselController;

  @override
  void initState() {
    super.initState();

    _carouselController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    _carouselController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        leadingWidth: 48.0,
        primary: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _carouselController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.media.length,
              itemBuilder: (context, index) => GestureDetector(
                onDoubleTap: () {},
                child: CachedNetworkImage(
                  imageUrl: widget.media[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AnimatedBuilder(
            animation: _carouselController,
            builder: (context, child) {
              int carouselImageIndex =
                  _carouselController.page?.round() ?? widget.index;

              return AnimatedCarouselScrollIndicator(
                length: widget.media.length,
                carouselImageIndex: carouselImageIndex,
              );
            },
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
