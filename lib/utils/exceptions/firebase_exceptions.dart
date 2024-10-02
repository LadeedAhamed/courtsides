class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'cancelled':
        return 'The operation was cancelled. Please try again.';
      case 'unknown':
        return 'An unknown error occurred. Please try again.';
      case 'invalid-argument':
        return 'An invalid argument was provided. Please check your input.';
      case 'deadline-exceeded':
        return 'The operation took too long to complete. Please try again.';
      case 'not-found':
        return 'The requested resource could not be found.';
      case 'already-exists':
        return 'The resource already exists.';
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'resource-exhausted':
        return 'Resource limit exceeded. Please try again later.';
      case 'failed-precondition':
        return 'The operation could not be performed due to a failed precondition.';
      case 'aborted':
        return 'The operation was aborted. Please try again.';
      case 'out-of-range':
        return 'The provided input is out of range.';
      case 'unimplemented':
        return 'This feature is not available.';
      case 'internal':
        return 'An internal error occurred. Please try again.';
      case 'unavailable':
        return 'The service is currently unavailable. Please try again later.';
      case 'data-loss':
        return 'Data loss occurred. Please try again.';
      case 'unauthenticated':
        return 'You are not authenticated. Please log in and try again.';
      case 'network-error':
        return 'A network error occurred. Please check your internet connection.';
      case 'storage-object-not-found':
        return 'The requested file could not be found in Firebase Storage.';
      case 'storage-unauthorized':
        return 'You do not have permission to access the file.';
      case 'storage-quota-exceeded':
        return 'Storage quota exceeded. Please upgrade your plan or delete unused files.';
      case 'storage-retry-limit-exceeded':
        return 'Retry limit exceeded. Please try again later.';
      case 'storage-invalid-checksum':
        return 'The file checksum does not match. Please re-upload the file.';
      case 'storage-cannot-slice-blob':
        return 'The file cannot be sliced for upload.';
      case 'storage-server-file-wrong-size':
        return 'The file size on the server does not match the expected size.';
      default:
        return 'A platform error occurred. Please try again.';
    }
  }
}
