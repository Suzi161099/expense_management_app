import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ReceiptScannerScreen extends StatefulWidget {
  @override
  _ReceiptScannerScreenState createState() => _ReceiptScannerScreenState();
}

class _ReceiptScannerScreenState extends State<ReceiptScannerScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _cameraController = CameraController(cameras![0], ResolutionPreset.high);
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _toggleFlash() {
    if (_cameraController != null) {
      _isFlashOn = !_isFlashOn;
      _cameraController!.setFlashMode(
        _isFlashOn ? FlashMode.torch : FlashMode.off,
      );
      setState(() {});
    }
  }

  void _takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      await _cameraController!.takePicture();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _cameraController != null && _cameraController!.value.isInitialized
              ? CameraPreview(_cameraController!)
              : Center(child: CircularProgressIndicator()),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(_isFlashOn ? Icons.flash_on : Icons.flash_off,
                  color: Colors.white, size: 30),
              onPressed: _toggleFlash,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                onTap: _takePicture,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
