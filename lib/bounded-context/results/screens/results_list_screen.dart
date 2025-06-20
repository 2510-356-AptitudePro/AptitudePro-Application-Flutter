import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_sizes.dart';
import '../../tests/entities/test.dart';
import '../entities/test_result.dart';
import '../../tests/providers/test_provider.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../presentation/widgets/error_state.dart';
import '../widgets/result_summary_card.dart';

class ResultsListScreen extends ConsumerStatefulWidget {
  const ResultsListScreen({super.key});

  @override
  ConsumerState<ResultsListScreen> createState() => _ResultsListScreenState();
}

class _ResultsListScreenState extends ConsumerState<ResultsListScreen> {
  TestType? _selectedType;

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(myTestResultsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Resultados'),
      ),
      body: Column(
        children: [
          // Filtros
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterChip(
                  selected: _selectedType == null,
                  label: const Text('Todos'),
                  onSelected: (selected) {
                    setState(() {
                      _selectedType = null;
                    });
                  },
                ),
                const SizedBox(width: AppSizes.sm),
                ...TestType.values.map((type) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSizes.sm),
                    child: FilterChip(
                      selected: _selectedType == type,
                      label: Text(type.displayName),
                      onSelected: (selected) {
                        setState(() {
                          _selectedType = selected ? type : null;
                        });
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          const Divider(height: 1),
          // Lista de resultados
          Expanded(
            child: resultsAsync.when(
              data: (results) {
                // Filtrar por tipo si está seleccionado
                final filteredResults = _selectedType == null
                    ? results
                    : results.where((r) => r.test?.type == _selectedType).toList();

                if (filteredResults.isEmpty) {
                  return EmptyState(
                    icon: Icons.assessment_outlined,
                    title: 'No hay resultados',
                    subtitle: _selectedType != null
                        ? 'No has completado tests de tipo ${_selectedType!.displayName}'
                        : 'Completa algunos tests para ver tus resultados aquí',
                    action: ElevatedButton(
                      onPressed: () => context.go('/tests'),
                      child: const Text('Explorar Tests'),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(myTestResultsProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSizes.md),
                    itemCount: filteredResults.length,
                    itemBuilder: (context, index) {
                      final result = filteredResults[index];
                      return ResultSummaryCard(
                        result: result,
                        onTap: () => context.go('/results/${result.id}'),
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) {
                // ✅ MEJORA: Mejor manejo de errores con más información
                print('Error en ResultsListScreen: $error');
                print('Stack trace: $stack');

                return ErrorState(
                  error: error.toString(),
                  onRetry: () {
                    ref.invalidate(myTestResultsProvider);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}