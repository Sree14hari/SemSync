import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_merger/pdf_merger.dart'; // Optional: Use if native merging support exists

const baseUrl = "http://202.88.225.92";

Future<String?> getPdfLink(String detailUrl) async {
  try {
    final response = await http.get(Uri.parse(detailUrl));
    final document = parse(response.body);
    final link = document.querySelector('a[href*="bitstream"]');
    return link != null ? baseUrl + link.attributes['href']! : null;
  } catch (e) {
    print("Error fetching PDF link: $e");
    return null;
  }
}

Future<List<Map<String, String>>> searchPyqs(String subjectCode) async {
  final searchUrl = "$baseUrl/xmlui/simple-search?query=$subjectCode";
  final response = await http.get(Uri.parse(searchUrl));
  final document = parse(response.body);
  final items = document.querySelectorAll('div.artifact-title a');

  print("Found ${items.length} results for $subjectCode");

  List<Map<String, String>> results = [];

  for (var item in items) {
    final title = item.text.trim();
    final detailUrl = baseUrl + item.attributes['href']!;
    final pdfUrl = await getPdfLink(detailUrl);
    if (pdfUrl != null) {
      results.add({"title": title, "pdf_url": pdfUrl});
    }
  }

  return results;
}

Future<String?> downloadAndMergePdfs(
  List<Map<String, String>> results,
  String subjectCode,
) async {
  List<String> pdfPaths = [];
  final directory = await getTemporaryDirectory();

  for (int i = 0; i < results.length; i++) {
    final url = results[i]['pdf_url']!;
    try {
      final response = await http.get(Uri.parse(url));
      final file = File('${directory.path}/temp_$i.pdf');
      await file.writeAsBytes(response.bodyBytes);
      pdfPaths.add(file.path);
    } catch (_) {}
  }

  if (pdfPaths.isEmpty) return null;

  final outputPath = '${directory.path}/merged_$subjectCode.pdf';

  try {
    await PdfMerger.mergeMultiplePDF(
      paths: pdfPaths,
      outputDirPath: outputPath,
    );
    for (final path in pdfPaths) {
      File(path).deleteSync();
    }
    return outputPath;
  } catch (e) {
    return null;
  }
}
