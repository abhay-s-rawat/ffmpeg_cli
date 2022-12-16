import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

class CopyVideoCodecArgument implements CliArguments {
  // Copy video codec
  const CopyVideoCodecArgument();

  @override
  String toCli() {
    return '-c:v copy';
  }
}
