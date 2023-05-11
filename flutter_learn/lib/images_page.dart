import 'package:flutter/material.dart';
import 'package:flutter_learn/assets.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  Widget _buildBlendMode() {
    // return Image.asset(
    //   AssetsImages.blueJpeg,
    //   color: Colors.blue,
    //   colorBlendMode: BlendMode.dstOver,
    // );
    return const Image(image: AssetImage(AssetsImages.blueJpeg));
  }

  Widget _buildFit(fit) {
    return Column(
      children: [
        Text('$fit'),
        Container(
          color: Colors.amber,
          child: SizedBox(
            width: 200,
            height: 100,
            child: Image.asset(
              AssetsImages.blueJpeg,
              color: Colors.blue,
              colorBlendMode: BlendMode.dstOver,
              fit: fit,
            ),
          ),
        )
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Center(
  //         child:
  //             Column(children: [for (var it in BoxFit.values) _buildFit(it)]),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBlendMode(),
      ),
    );
  }
}
