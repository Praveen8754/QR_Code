class QRData {
  final String qrCodeValue;
  final String timestamp;

  QRData({
    required this.qrCodeValue,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': qrCodeValue,
      'timestamp': timestamp,
    };
  }

  factory QRData.fromMap(Map<String, dynamic> map) {
    return QRData(
      qrCodeValue: map['value'],
      timestamp: map['timestamp'],
    );
  }
}