import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  SpinKitCircle(
      size: 140.sw,
      duration: const Duration(seconds: 3),
      itemBuilder: (context, index) {
        final colors = [Colors.white, Colors.pink, Colors.yellow];
        final color = colors[index % colors.length];
        return DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        );
      }
    );
  }
}
