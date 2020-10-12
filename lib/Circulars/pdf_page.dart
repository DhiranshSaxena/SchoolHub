import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';


class PdfPages extends StatefulWidget {

  final String url;
  PdfPages({this.url});

  @override
  _PdfPagesState createState() => _PdfPagesState();
}

class _PdfPagesState extends State<PdfPages> {

  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(widget.url);
    setState(() => _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator()):
    PDFViewer(document: document)
    ;
  }
}