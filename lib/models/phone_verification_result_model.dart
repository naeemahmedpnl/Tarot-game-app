class PhoneVerificationResult {
  final bool success;
  final String? verificationId;

  PhoneVerificationResult({
    required this.success,
    this.verificationId,
  });
}
