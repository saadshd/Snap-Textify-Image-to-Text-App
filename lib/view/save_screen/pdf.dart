 import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart' ;
import 'package:pdf/widgets.dart';



class SavePdf{
  Future<Uint8List> generatePdf(String text) async {
final pdf = Document();

pdf.addPage(
  Page(
    margin: const EdgeInsets.all(0),
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return Row(
        children: [
          Text(text),

        ],
      );
    },
  ),
);


return pdf.save();
  }

}