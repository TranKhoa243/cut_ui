import 'dart:async';
import '../../base/index.dart';
import 'index.dart';

class DetailEventBloc extends BaseBloc<BaseEvent, DetailEventState> {
  DetailEventBloc() : super(initState: DetailEventState()){
    on<GetDetailEventEvent>((e,m)=>fetchNotifications(m));
  }

  @override
  void onPageInitStateEvent(PageInitStateEvent event) {
    super.onPageInitStateEvent(event);
    dispatchEvent(GetDetailEventEvent());
  }

  @override
  void dispose() {
    super.close();
  }

  Future<void> fetchNotifications(Emitter<DetailEventState> emitter) async {
    emit(DetailEventLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(DetailEventLoadSuccess());
    } catch (e) {
      emit(DetailEventLoadError("Không thể tải thông báo"));
    }
  }
}

