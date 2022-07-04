import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../controller/dto/CMRespDto.dart';
import '../../util/jwt.dart';
import '../post/post.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공 => json --> Dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async{
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print('===========');
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson());
    print('===========');
    print('유저 레포지토리1 : ${response.body}');
    print('유저 레포지토리2 : ${response.headers}');
    print('===========');
    dynamic headers = response.headers;
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    //print(body);
    if(cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);

      String token = headers['authorization'];
       jwtToken = token;
       print('jwtToken : $jwtToken');

      return principal;
    }else{
      return User();
    }
    //print('사용자정보 : $body');

   /* if(headers["authorization"] == null ) {
      return '-1';
    }else {
      String token = headers['authorization'];
      return token;
    }*/
  }
}
