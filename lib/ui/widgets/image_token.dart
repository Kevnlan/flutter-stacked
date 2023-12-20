import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageWithToken extends StatefulWidget {
  final String imageUrl;

  const ImageWithToken({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageWithTokenState createState() => _ImageWithTokenState();
}

class _ImageWithTokenState extends State<ImageWithToken> {
  late http.Response _response;
  late String _imageBase64;

  @override
  void initState() {
    super.initState();
    _fetchImage();
  }

  Future<void> _fetchImage() async {
    _response = await http.get(
      Uri.parse(widget.imageUrl),
      // headers: {'Authorization': 'Nh11T0hYc2OL78dQKfUZIDOynmDce2DhDBo5KsDM2S8uiCE9K5SK7cLm'},
    );

    setState(() {
      _imageBase64 = base64Encode(_response.bodyBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _imageBase64.isNotEmpty
        ? Image.memory(
            base64Decode(_imageBase64),
          )
        : const CircularProgressIndicator();
  }
}