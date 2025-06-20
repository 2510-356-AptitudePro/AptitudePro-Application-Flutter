import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_sizes.dart';
import '../entities/test.dart';
import '../providers/test_provider.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../presentation/widgets/error_state.dart';
import '../widgets/test_card.dart';


class TestListScreen extends ConsumerStatefulWidget {
  const TestListScreen({super.key});

  @override
  ConsumerState<TestListScreen> createState() => _TestListScreenState();
}

class _TestListScreenState extends ConsumerState<TestListScreen> {
  TestType? _selectedType;

  @override
  Widget build(BuildContext context) {
    final testsAsync = _selectedType == null
        ? ref.watch(testListProvider)
        : ref.watch(testsByTypeProvider(_selectedType!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests Vocacionales'),
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
          // Lista de tests
          Expanded(
            child: testsAsync.when(
              data: (tests) {
                if (tests.isEmpty) {
                  return EmptyState(
                    icon: Icons.quiz_outlined,
                    title: 'No hay tests disponibles',
                    subtitle: _selectedType != null
                        ? 'No hay tests de tipo ${_selectedType!.displayName}'
                        : 'Pronto agregaremos nuevos tests',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(testListProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSizes.md),
                    itemCount: tests.length,
                    itemBuilder: (context, index) {
                      final test = tests[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSizes.sm),
                        child: TestCard(
                          test: test,
                          onTap: () => context.go('/tests/${test.id}'),
                        ),
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => ErrorState(
                error: error.toString(),
                onRetry: () {
                  ref.invalidate(testListProvider);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}