class Message{
  late String message;
  final bool isUser;

  Message({required this.message, required this.isUser,});

  Message.fromJson(Map<String, dynamic> json, this.isUser){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}