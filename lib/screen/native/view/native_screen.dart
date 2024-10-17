import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../util/admob_helper.dart';

class NativeScreen extends StatefulWidget {
  const NativeScreen({super.key});

  @override
  State<NativeScreen> createState() => _NativeScreenState();
}

class _NativeScreenState extends State<NativeScreen> {
  AdmobHelper helper = AdmobHelper();

  @override
  void initState() {
    helper.loadNative();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NativeAds"),
      ),
      body: Column(
        children: [
          SizedBox(
            height:200,
            width: MediaQuery.sizeOf(context).width,
            child: AdWidget(
              ad: helper.nativeAd!,
            ),
          ),
        ],
      ),
    );
  }
}
