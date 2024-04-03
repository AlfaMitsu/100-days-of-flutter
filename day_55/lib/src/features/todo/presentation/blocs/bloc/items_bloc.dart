import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/item_model.dart';
import '../../../domain/repositories/items_repo.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsLoadedEvent, ItemsState> {
  final ItemsRepo itemRepo;

  ItemsBloc(this.itemRepo) : super(ItemsLoadingState()) {
    on<ItemsLoadedEvent>(
      (event, emit) async {
        try {
          emit(ItemsLoadingState());
          var data = await itemRepo.getItems();
          emit(ItemsLoadedState(data));
        } catch (e) {
          emit(
            ItemsErrorState(
              e.toString(),
            ),
          );
        }
      },
    );
  }
}
