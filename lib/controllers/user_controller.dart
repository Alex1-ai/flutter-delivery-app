import 'package:get/get.dart';

import '../data/respository/user_repo.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  bool _isLoading = false;
  UserModel? _userModel;

  bool get isLoading => _isLoading;
  UserModel? get userModel => _userModel;
  // ??
  // UserModel(id: 0, name: "", email: "", phone: "", orderCount: 1);

  Future<ResponseModel> getUserInfo() async {
    // _isLoading = true;
    // update();
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    print("test " + response.body.toString());
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
      print('success');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      print("No response passed");
    }
    // _isLoading=false;
    update();
    return responseModel;
  }
}
