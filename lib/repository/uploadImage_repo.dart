import 'package:afaq/models/article_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImage {
  final FirebaseStorage storage =
      FirebaseStorage(storageBucket: "gs://afaq-53b6c.appspot.com");

  StorageUploadTask uploadTask;

  final CollectionReference charityDataCollection =
      Firestore.instance.collection('articles');

  String filePath = "image/${DateTime.now()}.png";

  tofireBase(ArticleModel articleModel, image) async {
    print(1);
    uploadTask = storage.ref().child(filePath).putFile(image);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
    String downloadUrl = await storageSnapshot.ref.getDownloadURL();
    print(2);

    if (uploadTask.isComplete) {
      articleModel.image = downloadUrl;
      print(3);

      return await charityDataCollection
          .document()
          .setData(
            articleModel.toJson(),
          )
          .whenComplete(() {
        print("complete");
      });
    }
  }
}
