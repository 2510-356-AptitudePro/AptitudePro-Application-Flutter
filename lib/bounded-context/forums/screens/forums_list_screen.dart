import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../bounded-context/forums/entities/forum.dart';
import '../../../bounded-context/forums/providers/forum_provider.dart';
import '../../../presentation/widgets/empty_state.dart';
import '../../../presentation/widgets/error_state.dart';



class ForumsListScreen extends ConsumerStatefulWidget {
  const ForumsListScreen({super.key});

  @override
  ConsumerState<ForumsListScreen> createState() => _ForumsListScreenState();
}

class _ForumsListScreenState extends ConsumerState<ForumsListScreen> {
  ForumCategory? _selectedCategory;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final forumsAsync = ref.watch(forumListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Foros'),
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(AppSizes.md),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar en los foros...',
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

          // Filtros por categoría
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FilterChip(
                  selected: _selectedCategory == null,
                  label: const Text('Todos'),
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = null;
                    });
                  },
                ),
                const SizedBox(width: AppSizes.sm),
                ...ForumCategory.values.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSizes.sm),
                    child: FilterChip(
                      selected: _selectedCategory == category,
                      label: Text(category.displayName),
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = selected ? category : null;
                        });
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          const Divider(height: 1),

          // Lista de foros
          Expanded(
            child: forumsAsync.when(
              data: (forums) {
                // Filtrar foros
                final filteredForums = forums.where((forum) {
                  final matchesSearch = _searchQuery.isEmpty ||
                      forum.name.toLowerCase().contains(_searchQuery) ||
                      forum.description.toLowerCase().contains(_searchQuery);

                  final matchesCategory = _selectedCategory == null ||
                      forum.category == _selectedCategory;

                  return matchesSearch && matchesCategory;
                }).toList();

                if (filteredForums.isEmpty) {
                  return EmptyState(
                    icon: Icons.forum_outlined,
                    title: 'No se encontraron temas',
                    subtitle: 'Sé el primero en crear un tema de discusión',
                    action: ElevatedButton(
                      onPressed: () {
                        // TODO: Implementar crear tema
                      },
                      child: const Text('Crear Tema'),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(forumListProvider);
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSizes.md),
                    itemCount: filteredForums.length,
                    itemBuilder: (context, index) {
                      final forum = filteredForums[index];
                      return _ForumCard(
                        forum: forum,
                        onTap: () => context.go('/forums/${forum.id}'),
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
                  ref.invalidate(forumListProvider);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForumCard extends StatelessWidget {
  final Forum forum;
  final VoidCallback onTap;

  const _ForumCard({
    required this.forum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.sm,
                      vertical: AppSizes.xs,
                    ),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(forum.category).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                    ),
                    child: Text(
                      forum.category.displayName,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getCategoryColor(forum.category),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (forum.isPinned)
                    const Icon(
                      Icons.push_pin,
                      size: 16,
                      color: AppColors.secondary,
                    ),
                ],
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                forum.name,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                forum.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSizes.sm),
              Row(
                children: [

                  const SizedBox(width: AppSizes.xs),
                  Text(
                    forum.authorName ?? "Autor Desconocido",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: AppSizes.md),
                  Icon(
                    Icons.comment_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSizes.xs),
                  Text(
                    '${forum.postCount}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: AppSizes.md),
                  Icon(
                    Icons.visibility_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSizes.xs),
                  Text(
                    '${forum.viewCount}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(ForumCategory category) {
    switch (category) {
      case ForumCategory.general:
        return AppColors.primary;
      case ForumCategory.careers:
        return AppColors.secondary;
      case ForumCategory.tests:
        return AppColors.tertiary;
      case ForumCategory.experiences:
        return AppColors.info;
      case ForumCategory.help:
        return AppColors.warning;
    }
  }
}
