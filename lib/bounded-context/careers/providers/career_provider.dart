import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../entities/career.dart';
import '../services/career_service.dart';


// Career List Provider
final careerListProvider = FutureProvider.autoDispose<List<Career>>((ref) async {
  print('🔍 careerListProvider: Obteniendo carreras...');

  final service = ref.watch(careerServiceProvider);
  final response = await service.getCareers(); // ✅ Ahora devuelve PaginatedResponse

  print('✅ careerListProvider: ${response.data.length} carreras obtenidas');
  print('✅ careerListProvider: Total: ${response.total}, Página: ${response.page}');

  return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
});

// Single Career Provider
final careerProvider = FutureProvider.family.autoDispose<Career, String>(
      (ref, careerId) async {
    final service = ref.watch(careerServiceProvider);
    final model = await service.getCareerById(careerId);
    return model.toEntity();
  },
);

// Career Search Provider
final careerSearchProvider = FutureProvider.family.autoDispose<List<Career>, String>(
      (ref, query) async {
    if (query.isEmpty) return [];

    print('🔍 careerSearchProvider: Buscando carreras con query: $query');

    final service = ref.watch(careerServiceProvider);
    final response = await service.searchCareers(query); // ✅ Ahora devuelve PaginatedResponse

    print('✅ careerSearchProvider: ${response.data.length} carreras encontradas');

    return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
  },
);

// Careers by Field Provider
final careersByFieldProvider = FutureProvider.family.autoDispose<List<Career>, String>(
      (ref, field) async {
    print('🔍 careersByFieldProvider: Obteniendo carreras del campo: $field');

    final service = ref.watch(careerServiceProvider);
    final response = await service.getCareersByField(field); // ✅ Ahora devuelve PaginatedResponse

    print('✅ careersByFieldProvider: ${response.data.length} carreras obtenidas');

    return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
  },
);

// Career Recommendations Provider
final careerRecommendationsProvider = FutureProvider.family.autoDispose<List<Career>, List<String>>(
      (ref, skills) async {
    if (skills.isEmpty) return [];

    print('🔍 careerRecommendationsProvider: Obteniendo recomendaciones para skills: $skills');

    final service = ref.watch(careerServiceProvider);
    final skillsString = skills.join(',');
    final response = await service.getRecommendations(skillsString); // ✅ Ahora devuelve PaginatedResponse

    print('✅ careerRecommendationsProvider: ${response.data.length} recomendaciones obtenidas');

    return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
  },
);

// Universities by Career Provider
final universitiesByCareerProvider = FutureProvider.family.autoDispose<List<University>, String>(
      (ref, careerId) async {
    print('🔍 universitiesByCareerProvider: Obteniendo universidades para carrera: $careerId');

    final service = ref.watch(careerServiceProvider);
    final response = await service.getUniversitiesByCareer(careerId); // ✅ Ahora devuelve PaginatedResponse

    print('✅ universitiesByCareerProvider: ${response.data.length} universidades obtenidas');

    return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
  },
);

// All Universities Provider
final universitiesProvider = FutureProvider.autoDispose<List<University>>((ref) async {
  print('🔍 universitiesProvider: Obteniendo todas las universidades...');

  final service = ref.watch(careerServiceProvider);
  final response = await service.getAllUniversities(); // ✅ Ahora devuelve PaginatedResponse

  print('✅ universitiesProvider: ${response.data.length} universidades obtenidas');

  return response.data.map((model) => model.toEntity()).toList(); // ✅ Extraer .data
});
// Career Filter State
final careerFilterProvider = StateNotifierProvider<CareerFilterNotifier, CareerFilter>((ref) {
  return CareerFilterNotifier();
});

class CareerFilter {
  final String? field;
  final int? minDuration;
  final int? maxDuration;
  final String? degreeType;
  final String sortBy;

  CareerFilter({
    this.field,
    this.minDuration,
    this.maxDuration,
    this.degreeType,
    this.sortBy = 'name',
  });

  CareerFilter copyWith({
    String? field,
    int? minDuration,
    int? maxDuration,
    String? degreeType,
    String? sortBy,
  }) {
    return CareerFilter(
      field: field ?? this.field,
      minDuration: minDuration ?? this.minDuration,
      maxDuration: maxDuration ?? this.maxDuration,
      degreeType: degreeType ?? this.degreeType,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  bool get hasActiveFilters =>
      field != null ||
          minDuration != null ||
          maxDuration != null ||
          degreeType != null;
}

class CareerFilterNotifier extends StateNotifier<CareerFilter> {
  CareerFilterNotifier() : super(CareerFilter());

  void setField(String? field) {
    state = state.copyWith(field: field);
  }

  void setDurationRange(int? min, int? max) {
    state = state.copyWith(minDuration: min, maxDuration: max);
  }

  void setDegreeType(String? type) {
    state = state.copyWith(degreeType: type);
  }

  void setSortBy(String sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void clearFilters() {
    state = CareerFilter();
  }
}