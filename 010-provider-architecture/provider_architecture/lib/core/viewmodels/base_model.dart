import 'package:flutter/widgets.dart';
import 'package:provider_architecture/core/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
