part of 'home_validation_cubit.dart';

class HomeValidationState extends Equatable {
  final int selectedIndex;
  final String? accessToken;

  const HomeValidationState({
    this.selectedIndex = 0,
    this.accessToken,
  });

  HomeValidationState copyWith({
    final int? selectedIndex,
    final String? accessToken,
  }) {
    return HomeValidationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        accessToken,
      ];
}

final class HomeValidationInitial extends HomeValidationState {}
