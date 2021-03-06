import 'package:get_storage/get_storage.dart';
import 'package:hola_admin/models/user.dart';

String kToken = "token";
String kUserData = "user_data";
String kTotalPages = "totalPages";
String kLimit = "limit";
String kCurrentPage = "currentpage";
String kId = "user_id";
String authToken;
User currentUser;

void setUserData(User user, String token) {
  GetStorage storage = GetStorage();
  storage.write(kToken, token);
  authToken = token;
  storage.write(kUserData, user.toJson());
  currentUser = user;
}

void loadUserData() {
  GetStorage storage = GetStorage();
  authToken = storage.read(kToken);
}

void setPageDetails(int totalPages, int limit, int currentPage) {
  GetStorage storage = GetStorage();
  storage.write(kTotalPages, totalPages);
  storage.write(kLimit, limit);
  storage.write(kCurrentPage, currentPage);
}
