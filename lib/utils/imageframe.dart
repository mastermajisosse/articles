import 'package:afaq/utils/size_config.dart';
import 'package:flutter/material.dart';

class ImageFrame extends StatefulWidget {
  int i;
  ImageFrame({this.i});
  @override
  _ImageFrameState createState() => _ImageFrameState();
}

class _ImageFrameState extends State<ImageFrame> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return InkWell(
      onTap: () {},
      child: Container(
          width: SizeConfig.screenWidth / 3,
          height: SizeConfig.screenWidth / 3,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              // length < widget.i + 1 ?
              Center(
            child: Icon(Icons.add_a_photo),
          )
          // :
          // Image.file(
          //     provider.imagelistpro[widget.i],
          //     fit: BoxFit.fill,
          //   ),
          ),
    );
  }
}
