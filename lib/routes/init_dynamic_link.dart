import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_drug_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_klinik_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_skincare_page.dart';
import 'package:heystetik_mobileapps/pages/solution/view_detail_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/komentar_stream_page.dart';

FirebaseDynamicLinksPlatform dynamicLinks =
    FirebaseDynamicLinksPlatform.instance;

Future<void> initDynamicLinks() async {
  dynamicLinks.onLink.listen((dynamicLinkData) {
    final path = dynamicLinkData.link.path;
    print('DYNAMIC LINK $path');
    if (path.startsWith('/stream/')) {
      final postId = path.split('/').last;
      print("INI STREAM $postId");
      Get.to(() => KomentarStreamPage(postId: int.parse(postId)));
    } else if (path.startsWith('/skincare/')) {
      final productId = path.split('/').last;
      print("INI SKINCARE $productId");
      Get.to(() => DetailSkinCarePage(productId: int.parse(productId)));
    } else if (path.startsWith('/drug/')) {
      final drugId = path.split('/').last;
      print("INI DRUG $drugId");
      Get.to(() => DetailDrugPage(drugId: int.parse(drugId)));
    } else if (path.startsWith('/clinic/')) {
      final clinicId = path.split('/').last;
      print("INI CLINIC $clinicId");
      Get.to(() => DetailKlinikPage(clinicId: int.parse(clinicId)));
    } else if (path.startsWith('/treatment/')) {
      final treatmentId = path.split('/').last;
      print("INI TREATMENT $treatmentId");
      Get.to(() => DetailTreatmentPage(treatmentId: int.parse(treatmentId)));
    } else {
      print("INI NEWS");
      Get.offAllNamed(dynamicLinkData.link.path);
    }
  }).onError((error) {
    print('ON LINK ERROR $error');
  });
}
