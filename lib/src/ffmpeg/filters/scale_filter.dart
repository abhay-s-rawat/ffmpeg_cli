import 'package:ffmpeg_cli/src/ffmpeg/ffmpeg_command.dart';
import 'package:ffmpeg_cli/src/ffmpeg/video_size.dart';

class ScaleFilter implements Filter {
  ScaleFilter({
    this.width,
    this.height,
    this.eval,
    this.interl,
    this.param0,
    this.param1,
  });

  final String? width;
  final String? height;
  final String? eval;
  final int? interl;
  // TODO: flags
  final String? param0;
  final String? param1;
  // TODO: in_color_matrix
  // TODO: out_color_matrix
  // TODO: in_range
  // TODO: out_range
  // TODO: force_original_aspect_ratio
  // TODO: force_divisible_by

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
