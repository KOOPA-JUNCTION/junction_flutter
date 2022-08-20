import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformFileImageViewer extends StatelessWidget {
  final XFile file;
  const PlatformFileImageViewer({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return FutureBuilder(
        future: file.readAsBytes(),
        builder: (_, imageData) {
          return Image.memory(imageData.data as Uint8List);
        },
      );
    }
    return Image.file(File(file.path));
  }
}
