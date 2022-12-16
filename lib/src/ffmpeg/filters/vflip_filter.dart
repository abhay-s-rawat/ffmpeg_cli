import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Add vertical flip filter
class VFlipFilter implements Filter {
  @override
  String toCli() {
    return 'vflip';
  }
}
