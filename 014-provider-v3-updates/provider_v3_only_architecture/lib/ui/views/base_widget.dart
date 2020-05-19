import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/core/viewmodels/base_model.dart';

class BaseWidget<T extends BaseModel> extends StatefulWidget {
  const BaseWidget({
    Key key,
    @required this.builder,
    this.child,
    @required this.model,
    this.onModelReady,
  }) : super(key: key);

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Widget child;
  final T model;
  final void Function(T model) onModelReady;

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseModel> extends State<BaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        child: widget.child,
        builder: widget.builder,
      ),
    );
  }
}
