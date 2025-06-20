import 'package:aptitude_pro_app/bounded-context/forums/entities/forum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/formatters.dart';
import '../providers/forum_provider.dart';
import '../../../presentation/widgets/error_state.dart';
import 'package:go_router/go_router.dart';

class ForumDetailScreen extends ConsumerStatefulWidget {
  final String forumId;

  const ForumDetailScreen({
    super.key,
    required this.forumId,
  });

  @override
  ConsumerState<ForumDetailScreen> createState() => _ForumDetailScreenState();
}



class _ForumDetailScreenState extends ConsumerState<ForumDetailScreen> {
  final _replyController = TextEditingController();
  final _titleController = TextEditingController(); // Nuevo controller
  bool _isReplying = false;

  @override
  void dispose() {
    _replyController.dispose();
    _titleController.dispose(); // limpiar
    super.dispose();
  }

  Future<void> _sendReply() async {
    if (_replyController.text.trim().isEmpty || _titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa título y contenido')),
      );
      return;
    }

    setState(() {
      _isReplying = true;
    });

    try {
      await ref.read(forumServiceProvider).replyToForum(
        widget.forumId,
        _titleController.text.trim(),
        _replyController.text.trim(),
      );

      _replyController.clear();
      _titleController.clear();

      ref.invalidate(forumProvider(widget.forumId));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isReplying = false;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    final forumAsync = ref.watch(forumProvider(widget.forumId));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Tema del Foro'),
      ),
      body: forumAsync.when(
        data: (forum) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header del tema
                      Card(
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
                                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                                    ),
                                    child: Text(
                                      forum.category.displayName,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  if (forum.isPinned)
                                    const Icon(
                                      Icons.push_pin,
                                      size: 20,
                                      color: AppColors.secondary,
                                    ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.md),
                              Text(
                                forum.name,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: AppSizes.sm),
                              Row(
                                children: [

                                  const SizedBox(width: AppSizes.sm),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        forum.authorName ?? "Autor Desconocido",
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        Formatters.dateTime(forum.createdAt),
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.md),
                              Text(
                                forum.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: AppSizes.md),
                              Row(
                                children: [
                                  Icon(
                                    Icons.comment_outlined,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  const SizedBox(width: AppSizes.xs),
                                  Text(
                                    '${forum.viewCount} respuestas',
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
                                    '${forum.viewCount} vistas',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.md),

                      // Respuestas
                      if (forum.replies.isNotEmpty) ...[
                        Text(
                          'Respuestas (${forum.replies.length})',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSizes.sm),
                        ...forum.replies.map((reply) {
                          return Card(
                            margin: const EdgeInsets.only(bottom: AppSizes.sm),
                            child: Padding(
                              padding: const EdgeInsets.all(AppSizes.md),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [

                                      const SizedBox(width: AppSizes.sm),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                reply.authorName!,
                                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              /*if (reply..isPsychologist == true) ...[
                                                const SizedBox(width: AppSizes.xs),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: AppSizes.xs,
                                                    vertical: 2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.secondary,
                                                    borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
                                                  ),
                                                  child: const Text(
                                                    'Psicólogo',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],*/
                                            ],
                                          ),
                                          Text(
                                            Formatters.dateTime(reply.createdAt),
                                            style: Theme.of(context).textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: AppSizes.sm),
                                  Text(
                                    reply.content,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ],
                  ),
                ),
              ),

              // Campo de respuesta
              Container(
                padding: const EdgeInsets.all(AppSizes.md),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        hintText: 'Título de tu respuesta...',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSizes.md,
                          vertical: AppSizes.sm,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _replyController,
                            decoration: const InputDecoration(
                              hintText: 'Escribe tu respuesta...',
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: AppSizes.md,
                                vertical: AppSizes.sm,
                              ),
                            ),
                            maxLines: null,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _sendReply(),
                          ),
                        ),
                        const SizedBox(width: AppSizes.sm),
                        IconButton.filled(
                          onPressed: _isReplying ? null : _sendReply,
                          icon: _isReplying
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                              : const Icon(Icons.send),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => ErrorState(
          error: error.toString(),
          onRetry: () {
            ref.invalidate(forumProvider(widget.forumId));
          },
        ),
      ),
    );
  }
}