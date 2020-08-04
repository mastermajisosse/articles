import 'dart:io';

import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageFrame extends StatefulWidget {
  File image;
  ImageFrame(this.image);
  @override
  _ImageFrameState createState() => _ImageFrameState();
}

class _ImageFrameState extends State<ImageFrame> {
  var picker = ImagePicker();

  Future getImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      widget.image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return InkWell(
      onTap: getImage,
      child: Container(
        width: SizeConfig.screenWidth / 3,
        height: SizeConfig.screenWidth / 3,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.image == null
            ? Center(
                child: Icon(Icons.add_a_photo),
              )
            : Image.file(
                widget.image,
                fit: BoxFit.fill,
              ),
      ),
    );
  }
}
