import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class ItemLoad extends ItemEvent {
  const ItemLoad();

  @override
  List<Object> get props => [];
}
