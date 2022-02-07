import 'package:flutter/cupertino.dart';
import 'package:mawaqit_android_tv/models/info.dart';

class OnBoardingViewModel with ChangeNotifier{
  bool _isOk=false;
  bool get isOk=>_isOk;
  set isOk(bool iO){
    _isOk=isOk;
    notifyListeners();
  }

  getIdBlock(){
    _isOk=true;
    isOk=_isOk;
    notifyListeners();
    return isOk;
  }

  getInformationById(String id)async{
    await InfoId().getApi(id);
    notifyListeners();
  }

}