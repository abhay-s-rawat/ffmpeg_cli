import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';

class ScaleFilter implements Filter {
  /// User can now set [width] [height] to nevative values.
  ///
  /// To crop video but maintain aspect ratio use -1, eg: [height] = 300 and [width] = -1
  ///
  /// To crop video but maintain aspect ratio but the video should be divisible by 2 then use -2, eg: [height] = 300 and [width] = -2 generally used in x264 videos
  ///
  /// For x265 videos dimensions must be divisible by 8. use -8. eg: [height] = 300 and [width] = -8 generally used in x265 videos
  ///
  ScaleFilter({
    this.width,
    this.height,
    this.eval,
    this.interl,
    this.param0,
    this.param1,
  });

  final int? width;
  final int? height;
  final String? eval;
  final int? interl;
  // TODO: flags
  final String? param0;
  final String? param1;
  // TODO: in_color_matrix
  // TODO: out_color_matrix
  // TODO: in_range
  // TODO: out_range

  @override
  String toCli() {
    final properties = [
      if (width != null) 'width=$width',
      if (height != null) 'height=$height',
      if (eval != null) 'eval=$eval',
      if (interl != null) 'interl=$interl',
      if (param0 != null) 'param0=$param0',
      if (param1 != null) 'param1=$param1',
    ];
    if (properties.isNotEmpty) {
      return 'scale=${properties.join(':')}';
    } else {
      return '';
    }
  }
}
