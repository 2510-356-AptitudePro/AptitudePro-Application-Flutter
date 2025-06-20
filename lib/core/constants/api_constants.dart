class ApiConstants {
  static const String baseUrl = 'http://192.168.5.127:3000';
  static const String apiVersion = '/api/v1';

  // Auth endpoints
  static const String signIn = '$apiVersion/auth/login';
  static const String signUp = '$apiVersion/auth/register';
  static const String refreshToken = '$apiVersion/auth/refresh';

  // Users endpoints
  static const String users = '$apiVersion/users';
  static const String profile = '$apiVersion/users/profile';
  static const String psychologists = '$apiVersion/users/psychologists';
  static const String teachers = '$apiVersion/users/teachers';
  static const String changePassword = '$apiVersion/users/password/change';

  // Tests endpoints
  static const String tests = '$apiVersion/tests';
  static const String myTests = '$apiVersion/tests/my-tests';
  static const String testResults = '$apiVersion/test-results';
  static const String submitTest = '$apiVersion/test-results/submit';
  static const String myResults = '$apiVersion/test-results/my-results';

  // Careers endpoints
  static const String careers = '$apiVersion/careers';
  static const String universities = '$apiVersion/universities';

  // ✅ CORREGIDO: Consultations endpoints
  static const String consultations = '$apiVersion/consultations';
  // ✅ ELIMINAR: myconsultations ya no es necesario, se usa consultations
  // static const String myconsultations = '$apiVersion/consultations';

  // ✅ CORREGIDO: Availability endpoints (si los usas)
  static const String availability = '$apiVersion/consultations/availability';

  // Forums endpoints
  static const String forums = '$apiVersion/forums';
  static const String forumPosts = '$apiVersion/forum-posts';
  static const String forumComments = '$apiVersion/forum-comments';

// ✅ AGREGADO: Rutas específicas de consultas para claridad
// Estas son las rutas completas que puedes usar:
// GET    /api/v1/consultations/my-consultations     (Estudiantes)
// GET    /api/v1/consultations/my-appointments      (Psicólogos)
// POST   /api/v1/consultations/request              (Agendar consulta)
// GET    /api/v1/consultations/{id}                 (Consulta específica)
// PATCH  /api/v1/consultations/{id}/cancel          (Cancelar)
// PATCH  /api/v1/consultations/{id}                 (Actualizar)
// GET    /api/v1/consultations/available-slots/{psychologistId} (Slots disponibles)
}