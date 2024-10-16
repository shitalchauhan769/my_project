import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_project/util/admoe_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd? bannerAd;
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
            height: MediaQuery.sizeOf(context).height,
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
        ],
      ),
    );
  }
}
