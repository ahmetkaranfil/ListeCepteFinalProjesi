// lib/services/supabase_service.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // Profil verisi ekle/güncelle
  static Future<void> upsertProfile({
    required String userId,
    required String email,
    required String name,
    required String birthPlace,
    required String birthDate,
    required String city,
  }) async {
    await client.from('user_profiles').upsert({
      'id': userId,
      'email': email,
      'name': name,
      'birth_place': birthPlace,
      'birth_date': birthDate,
      'city': city,
    });
  }

  // Profil verisini çek
  static Future<Map<String, dynamic>?> fetchProfile(String userId) async {
    final response = await client
        .from('user_profiles')
        .select()
        .eq('id', userId)
        .single();
    return response;
  }

  // Kullanıcı skorlarını ekle
  static Future<void> insertScore(String userId, int score) async {
    await client.from('user_scores').insert({
      'user_id': userId,
      'score': score,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  // Kullanıcının skor geçmişini çek
  static Future<List<Map<String, dynamic>>> getUserScores(String userId) async {
    final response = await client
        .from('user_scores')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);
    return response;
  }
}
