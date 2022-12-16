import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Add horizontal flip filter
class HFlipFilter implements Filter {
  @override
  String toCli() {
    return 'hflip';
  }
}
