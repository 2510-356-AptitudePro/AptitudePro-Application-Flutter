import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_sizes.dart';
import '../entities/career.dart';
import '../providers/career_provider.dart';
import '../widgets/career_card.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../presentation/widgets/error_state.dart';


class CareersListScreen extends ConsumerStatefulWidget {
  const CareersListScreen({super.key});

  @override
  ConsumerState<CareersListScreen> createState() => _CareersListScreenState();
}

class _CareersListScreenState extends ConsumerState<CareersListScreen> {
  String _searchQuery = '';
  CareerField? _selectedField;

  @override
  Widget build(BuildContext context) {
    final careersAsync = ref.watch(careerListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar Carreras'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar carreras...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          // Filtros por campo
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterChip(
                  selected: _selectedField == null,
                  label: const Text('Todos'),
                  onSelected: (selected) {
                    setState(() {
                      _selectedField = null;
                    });
                  },
                ),
                const SizedBox(width: AppSizes.sm),
                ...CareerField.values.map((field) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSizes.sm),
                    child: FilterChip(
                      selected: _selectedField == field,
                      label: Text(field.displayName),
                      onSelected: (selected) {
                        setState(() {
                          _selectedField = selected ? field : null;
                        });
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          const Divider(height: 1),
          // Lista de carreras
          Expanded(
            child: careersAsync.when(
              data: (careers) {
                // Filtrar carreras
                final filteredCareers = careers.where((career) {
                  final matchesSearch = _searchQuery.isEmpty ||
                      career.title!.toLowerCase().contains(_searchQuery) ||
                      career.description.toLowerCase().contains(_searchQuery);

                  final matchesField = _selectedField == null ||
                      career.field == _selectedField;

                  return matchesSearch && matchesField;
                }).toList();

                if (filteredCareers.isEmpty) {
                  return EmptyState(
                    icon: Icons.school_outlined,
                    title: 'No se encontraron carreras',
                    subtitle: 'Intenta con otros filtros o términos de búsqueda',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(careerListProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSizes.md),
                    itemCount: filteredCareers.length,
                    itemBuilder: (context, index) {
                      final career = filteredCareers[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSizes.sm),
                        child: CareerCard(
                          career: career,
                          onTap: () => context.go('/careers/${career.id}'),
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
                  ref.invalidate(careerListProvider);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
