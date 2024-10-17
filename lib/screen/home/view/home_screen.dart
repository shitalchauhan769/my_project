import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_project/util/admob_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdmobHelper helper = AdmobHelper();

  @override
  void initState() {
    helper.loadBanner();
    helper.loadInterstitial();
    helper.loadRewarded();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADemobAPP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: MediaQuery.sizeOf(context).width,
            child: AdWidget(ad: helper.bannerAd!),
          ),
          ElevatedButton(
            onPressed: () {
              if(helper.interstitialAdn!=null)
                {
                  helper.interstitialAdn!.show();
                }
              helper.interstitialAdn!.fullScreenContentCallback=FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {

                },
                onAdFailedToShowFullScreenContent: (ad, error) {

                },
              );
              helper.loadInterstitial();
            },
            child: const Text("Interstitial"),
          ),
          ElevatedButton(
            onPressed: () {
              if(helper.rewardedAd!=null)
                {
                  helper.rewardedAd!.show(onUserEarnedReward: (ad, reward) {

                  },);
                }
              helper.rewardedAd!.fullScreenContentCallback=FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {

                },
                onAdFailedToShowFullScreenContent: (ad, error) {

                },
              );
              helper.loadRewarded();
            },
            child: const Text("Rewarded"),
          ),
          ElevatedButton(onPressed: () {
            Get.toNamed("/native");

          }, child: const Text("Native"),),
        ],
      ),
    );
  }
}
