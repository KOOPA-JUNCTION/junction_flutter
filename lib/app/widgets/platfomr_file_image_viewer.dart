import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class PlatformFileImageViewer extends StatelessWidget {
  final XFile file;
  const PlatformFileImageViewer({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    if (GetPlatform.isMobile) return Image.file(File(file.path));
    return Container();
  }
}
