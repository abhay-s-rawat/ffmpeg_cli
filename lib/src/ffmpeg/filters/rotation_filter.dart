import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Add rotataion to the filter.
class RotationFilter implements Filter {
  final int degrees;

  const RotationFilter({
    required this.degrees,
  });

  @override
  String toCli() {
    return 'rotate=$degrees';
  }
}
