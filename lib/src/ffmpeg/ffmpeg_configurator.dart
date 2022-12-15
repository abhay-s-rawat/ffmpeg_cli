import 'dart:developer';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FFMpegConfigurator {
  String? ffmpegUrl;
  String? tempFolderPath;
  String? ffmpegInstallationPath;
  String? ffmpegBinDirectory;
  File? zipFile;

  FFMpegConfigurator({
    this.ffmpegUrl,
    this.tempFolderPath,
    this.ffmpegInstallationPath,
    this.ffmpegBinDirectory,
  });

  Future<void> setDefaultLocations() async {
    ffmpegUrl =
        "https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip";
    Directory tempDir = await getTemporaryDirectory();
    tempFolderPath = path.join(tempDir.path, "ffmpeg");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    ffmpegInstallationPath = path.join(appDocDir.path, "ffmpeg");
    ffmpegBinDirectory = path.join(
        ffmpegInstallationPath!, "ffmpeg-master-latest-win64-gpl", "bin");
  }

  Future<bool> isFFMpegPresent() async {
    if (ffmpegBinDirectory == null) return false;
    File ffmpeg = File(path.join(ffmpegBinDirectory!, "ffmpeg.exe"));
    File ffprobe = File(path.join(ffmpegBinDirectory!, "ffprobe.exe"));
    if ((await ffmpeg.exists()) && (await ffprobe.exists())) {
      return true;
    }
    return false;
  }

  Future<File?> downloadFFMpeg({
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
  }) async {
    if ((tempFolderPath == null) || (ffmpegUrl == null)) {
      return null;
    }
    String ffmpegZipPath = path.join(tempFolderPath!, "ffmpeg.zip");
    File tempZipFile = File(ffmpegZipPath);
    if (await tempZipFile.exists() == false) {
      try {
        Dio dio = Dio();
        Response response = await dio.download(
          ffmpegUrl!,
          ffmpegZipPath,
          onReceiveProgress: onReceiveProgress,
        );
        log(response.statusCode.toString());
        if (response.statusCode == HttpStatus.ok) {
          zipFile = tempZipFile;
          return tempZipFile;
        } else {
          return null;
        }
      } catch (e) {
        print(e.toString());
        return null;
      }
    } else {
      return tempZipFile;
    }
  }

  Future<String?> extractZipFile(File zip) async {
    if (ffmpegInstallationPath == null) return null;
    //final inputStream = InputFileStream(zip.path);
    //final archive = ZipDecoder().decodeBuffer(inputStream);
    //extractArchiveToDisk(archive, ffmpegInstallationPath!);
    await extractFileToDisk(zip.path, ffmpegInstallationPath!);
    return ffmpegInstallationPath;
  }

  Future<bool> autoSetupFFMpeg({
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
  }) async {
    await setDefaultLocations();
    if (!(await isFFMpegPresent())) {
      File? zip = await downloadFFMpeg(
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
      );
      if (zip != null) {
        String? installPath = await extractZipFile(zip);
        if (installPath != null) {
          return true;
        }
      }
    } else {
      return true;
    }
    return false;
  }
}
