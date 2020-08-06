import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'YOUR_DEVICE_ID';

class Ads {
  static BannerAd bannerAd;

  static final Ads _ads = Ads._internal();
  factory Ads() {
    return _ads;
  }

  Ads._internal();

  static void initialize() {
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
  }

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: false,
    // nonPersonalizedAds: true,
  );

  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: "ca-app-pub-9331906778457556/8193022895",
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  static void showBannerAd() {
    // if (bannerAd == null) bannerAd = createBannerAd();
    bannerAd
      ..load()
      ..show(anchorOffset: 0.0, anchorType: AnchorType.bottom);
  }

  static void hideBannerAd() {
    // await bannerAd.dispose();
    bannerAd.dispose();
    print("object");
    bannerAd = null;
  }
}
