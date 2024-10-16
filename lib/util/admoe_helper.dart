import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  BannerAd? bannerAd;
  InterstitialAd? interstitialAdn;
  RewardedAd? rewardedAd;

  Future<void> loadBanner() async {
    await BannerAd(
            size: AdSize.banner,
            adUnitId: Platform.isAndroid
                ? 'ca-app-pub-3940256099942544/6300978111'
                : 'ca-app-pub-3940256099942544/2934735716',
            request: const AdRequest(),
            listener: const BannerAdListener())
        .load();
  }

  void loadInterstitial() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAdn = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void loadNative() {}

  void loadRewarded() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd=ad;
          },
          onAdFailedToLoad: (error) {},
        ));
  }
}
