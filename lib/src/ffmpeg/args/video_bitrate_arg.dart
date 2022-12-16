import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

/// Video bitrate in kbps , eg: 1000kbps
class VideoBitrateArgument implements CliArguments {
  final int bitrate;

  const VideoBitrateArgument(this.bitrate);

  @override
  String toCli() {
    return '-b:v ${bitrate}k';
  }
}
