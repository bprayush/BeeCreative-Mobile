import 'package:BeeCreative/src/bloc/schedule_bloc/schedule_bloc_export.dart';
import 'package:BeeCreative/src/data/repository/schedule_respository.dart';
import 'package:bloc/bloc.dart';
import 'package:BeeCreative/src/data/models/user/user_error.dart';

class ScheduleBloc extends Bloc<ScheduleEvents, ScheduleState> {
  final ScheduleRepository _schedulesRepository;

  ScheduleBloc(this._schedulesRepository);

  void scheduleRequestInitiated(String token) {
    dispatch(GetScheduleFromNetwork((b) => b..token = token));
  }

  void reloadSchedule(String token) {
    dispatch(ReloadSchedulesFromNetwork((b) => b..token = token));
  }

  @override
  ScheduleState get initialState => ScheduleState.initial();

  @override
  Stream<ScheduleState> mapEventToState(
      ScheduleState currentState, ScheduleEvents event) async* {
    if (event is GetScheduleFromNetwork) {
      yield* mapScheduleRequestInitiated(event);
    } else if (event is ReloadSchedulesFromNetwork) {
      yield* mapScheduleReload(currentState, event);
    }
  }

  Stream<ScheduleState> mapScheduleReload(
      ScheduleState currentState, ReloadSchedulesFromNetwork event) async* {
    try {
      yield ScheduleState.reload(currentState.scheduleResponse);
      final reloadedSchedule =
          await _schedulesRepository.getSchedulesFromNetwork(event.token);
      yield ScheduleState.success(reloadedSchedule);
    } on NoSchedulesError catch (e) {
      yield ScheduleState.failure(e.message);
    } on Unauthenticated catch (e) {
      yield ScheduleState.failure(e.message);
    }
  }

  Stream<ScheduleState> mapScheduleRequestInitiated(
      GetScheduleFromNetwork event) async* {
    if (event.token.isEmpty) {
      yield ScheduleState.initial();
    } else {
      try {
        yield ScheduleState.loading();
        final schedules =
            await _schedulesRepository.getSchedulesFromNetwork(event.token);
        yield ScheduleState.success(schedules);
      } on NoSchedulesError catch (e) {
        yield ScheduleState.failure(e.message);
      } on Unauthenticated catch (e) {
        yield ScheduleState.failure(e.message);
      }
    }
  }
}