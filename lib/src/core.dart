class Response {
  int statusCode;
  String? errorMsg;
  String? itemId;

  Response(this.statusCode, this.errorMsg, this.itemId);

  factory Response.fromJson(int responseCode, Map<String, dynamic> data) {
    return Response(
      responseCode,
      data['error']?['message'],
      data['id'],
    );
  }
}
