import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/formatters.dart';
import '../../../bounded-context/tests/providers/test_provider.dart';
import '../../../presentation/widgets/error_state.dart';


class TestTakingScreen extends ConsumerStatefulWidget {
  final String testId;

  const TestTakingScreen({
    super.key,
    required this.testId,
  });

  @override
  ConsumerState<TestTakingScreen> createState() => _TestTakingScreenState();
}

class _TestTakingScreenState extends ConsumerState<TestTakingScreen> {
  @override
  Widget build(BuildContext context) {
    final testAsync = ref.watch(testForTakingProvider(widget.testId));
    final takingState = ref.watch(testTakingProvider(widget.testId));
    final takingNotifier = ref.watch(testTakingProvider(widget.testId).notifier);

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('¿Abandonar el test?'),
            content: const Text(
              'Si sales ahora, perderás todo tu progreso. ¿Estás seguro?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Salir'),
              ),
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/tests'),
          ),
          title: testAsync.maybeWhen(
            data: (test) => Text(test.title),
            orElse: () => const Text('Test'),
          ),
          actions: [
            // Timer
            if (testAsync.valueOrNull?.duration != null && testAsync.valueOrNull!.duration > 0)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  child: _TimerWidget(
                    duration: testAsync.valueOrNull!.duration,
                    startTime: takingState.startTime,
                  ),
                ),
              ),
          ],
        ),
        body: testAsync.when(
          data: (test) {
            if (takingState.result != null) {
              // Test completado
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go('/results/${takingState.result!.id}');
              });
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final currentQuestion = test.questions[takingState.currentQuestionIndex];
            final selectedOptionId = takingState.answers[currentQuestion.id];

            // ✅ DEBUG: Verificar duplicados
            print('🔍 DEBUG - Pregunta: ${currentQuestion.id}');
            print('🔍 DEBUG - Opciones count: ${currentQuestion.options.length}');
            currentQuestion.options.asMap().forEach((index, option) {
              print('🔍 DEBUG - Opción $index: ${option.id} - ${option.content}');
            });

            // ✅ SOLUCIÓN CORREGIDA: Filtrar opciones duplicadas por CONTENIDO
            final uniqueOptions = <String, dynamic>{};
            for (final option in currentQuestion.options) {
              // Usar el contenido como clave para eliminar duplicados
              if (!uniqueOptions.containsKey(option.content)) {
                uniqueOptions[option.content] = option;
              }
            }
            final filteredOptions = uniqueOptions.values.toList();

            print('🔍 DEBUG - Opciones únicas: ${filteredOptions.length}');
            filteredOptions.forEach((option) {
              print('✅ DEBUG - Opción final: ${option.id} - ${option.content}');
            });

            return Column(
              children: [
                // Progress bar
                LinearProgressIndicator(
                  value: (takingState.currentQuestionIndex + 1) / test.questions.length,
                  backgroundColor: AppColors.outlineVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSizes.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question number
                        Text(
                          'Pregunta ${takingState.currentQuestionIndex + 1} de ${test.questions.length}',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: AppSizes.sm),

                        // Question
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentQuestion.content,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                if (currentQuestion.imageUrl != null) ...[
                                  const SizedBox(height: AppSizes.md),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                    child: Image.network(
                                      currentQuestion.imageUrl!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Container(
                                          height: 200,
                                          color: Colors.grey[300],
                                          child: const Center(
                                            child: Icon(Icons.error),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSizes.md),

                        // Options - ✅ CORREGIDO: Usar opciones filtradas
                        ...filteredOptions.map((option) {
                          final isSelected = selectedOptionId == option.id;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: AppSizes.sm),
                            child: RadioListTile<String>(
                              key: ValueKey(option.id), // ✅ AGREGADO: Key única
                              value: option.id,
                              groupValue: selectedOptionId,
                              onChanged: (value) {
                                if (value != null) {
                                  takingNotifier.answerQuestion(
                                    currentQuestion.id,
                                    value,
                                  );
                                }
                              },
                              title: Text(option.content),
                              tileColor: isSelected
                                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                                  : null,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                side: BorderSide(
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : AppColors.outlineVariant,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),

                // Navigation buttons
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
                  child: Row(
                    children: [
                      if (takingState.currentQuestionIndex > 0)
                        Expanded(
                          child: OutlinedButton(
                            onPressed: takingNotifier.previousQuestion,
                            child: const Text('Anterior'),
                          ),
                        ),
                      if (takingState.currentQuestionIndex > 0)
                        const SizedBox(width: AppSizes.sm),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: selectedOptionId == null
                              ? null
                              : () {
                            if (takingState.currentQuestionIndex < test.questions.length - 1) {
                              takingNotifier.nextQuestion();
                            } else {
                              // Último pregunta, enviar test
                              _showSubmitConfirmation(context, takingNotifier);
                            }
                          },
                          child: Text(
                            takingState.currentQuestionIndex < test.questions.length - 1
                                ? 'Siguiente'
                                : 'Finalizar',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => ErrorState(
            error: error.toString(),
            onRetry: () {
              ref.invalidate(testForTakingProvider(widget.testId));
            },
          ),
        ),
      ),
    );
  }

  void _showSubmitConfirmation(BuildContext context, TestTakingNotifier notifier) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Finalizar el test?'),
        content: const Text(
          'Una vez enviado, no podrás cambiar tus respuestas. ¿Estás seguro?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Revisar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              notifier.submitTest();
            },
            child: const Text('Finalizar'),
          ),
        ],
      ),
    );
  }
}

class _TimerWidget extends StatefulWidget {
  final int duration;
  final DateTime startTime;

  const _TimerWidget({
    required this.duration,
    required this.startTime,
  });

  @override
  State<_TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<_TimerWidget> {
  late Stream<int> _timerStream;

  @override
  void initState() {
    super.initState();
    _timerStream = Stream.periodic(
      const Duration(seconds: 1),
          (i) => widget.duration * 60 - DateTime.now().difference(widget.startTime).inSeconds,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _timerStream,
      builder: (context, snapshot) {
        final remainingSeconds = snapshot.data ?? (widget.duration * 60);
        final isWarning = remainingSeconds < 300; // 5 minutos

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.sm,
            vertical: AppSizes.xs,
          ),
          decoration: BoxDecoration(
            color: isWarning ? AppColors.error : AppColors.primary,
            borderRadius: BorderRadius.circular(AppSizes.radiusCircle),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer,
                size: 16,
                color: isWarning ? AppColors.onError : AppColors.onPrimary,
              ),
              const SizedBox(width: AppSizes.xs),
              Text(
                Formatters.duration(remainingSeconds),
                style: TextStyle(
                  color: isWarning ? AppColors.onError : AppColors.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}