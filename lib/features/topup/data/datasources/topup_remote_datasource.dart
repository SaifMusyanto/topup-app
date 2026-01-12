import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:topup_app/features/topup/data/models/topup_request_model.dart';

class TopupRemoteDatasource {
  final http.Client client;

  TopupRemoteDatasource(this.client);

  Future<String> createTopup(TopupRequestModel request) async {
    final response = await client.post(
      Uri.parse('http://api.example.com/topups'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(request.toJson()),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['error'] ?? 'Failed to create topup');
    }
    return data['invoice_url'];
  }
}
