import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  const BaseView({
    Key key,
    this.builder,
    this.onModelComplete,
  }) : super(key: key);

  final Widget Function(BuildContext, T, Widget) builder;
  final Function(T) onModelComplete;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelComplete != null) {
      widget.onModelComplete(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
