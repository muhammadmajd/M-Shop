
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/exceptions/exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables final
  final _db = FirebaseFirestore.instance ;
  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners () async {
    try{
      final result = await
      _db.collection ('Banners') .where('Active', isEqualTo: true) .get ();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)) .toList ();

    } on FirebaseException catch (e) {
      throw TFirebaseException (e.code) .message;
    } on FormatException catch (_) {
      throw const TFormatException () ;
    } on PlatformException catch (e) {
      throw TPlatformException (e.code) .message;
    } catch(e){
    throw 'Something went wrong while fetching Banners.';
    }
  }
  /// Upload Banners to the cloud Firebase
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try{
      // Upload all the Categories along with their Images
      final storage = Get .put (TFirebaseStorageService ());
      int i=0;
      // Loop through each category
      for (var banner in banners) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets (banner.imageUrl);

        // Upload Image and Get its URL
        final url = await storage. uploadImageData('Banners', file, i.toString());
        // Assign URL to Category. image attribute
        banner.imageUrl = url;
        // Store Banners in Firestore
        await _db.collection ("Banners").doc (i.toString()) .set (banner. toJson ());
        i++;

      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException (e.code) .message;
    } catch(e)
    {
      throw 'Something went wrong. Please try again';

    }
  }
}