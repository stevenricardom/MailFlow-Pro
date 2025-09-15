




// GUIÓN PARA PRUEBAS DE USABILIDAD - MailFlow Pro

/*
====================================================================
GUIÓN DE PRUEBAS DE USABILIDAD - MailFlow Pro
====================================================================

OBJETIVO:
Evaluar la facilidad de uso y eficiencia de la interfaz de gestión 
de filtros de correo electrónico en MailFlow Pro.

PERFIL DEL USUARIO:
- Profesional que maneja entre 50-200 emails diarios
- Experiencia básica-intermedia con aplicaciones móviles
- Necesita automatizar la organización de su bandeja de entrada

====================================================================
TAREAS DE USABILIDAD:
====================================================================

TAREA 1: NAVEGACIÓN INICIAL
Objetivo: Familiarizarse con la interfaz principal
Instrucciones: "Explora la pantalla principal y describe qué información puedes ver sobre los filtros existentes"

Métricas a evaluar:
- Tiempo para identificar elementos principales (< 30 segundos)
- Comprensión de estados de filtros (activo/inactivo)
- Identificación de opciones disponibles

TAREA 2: CREAR FILTRO PARA PROMOCIONES
Objetivo: Crear un nuevo filtro usando palabras clave
Instrucciones: "Crea un filtro llamado 'Ofertas Especiales' que identifique correos con las palabras 'descuento', 'promoción' y 'oferta especial'. El filtro debe estar activo pero sin respuesta automática"

Pasos esperados:
1. Presionar "Añadir Filtro"
2. Completar nombre: "Ofertas Especiales"
3. Seleccionar tipo "Palabra clave"
4. Ingresar criterios: "descuento, promoción, oferta especial"
5. Configurar como activo
6. Revisar y confirmar

Métricas:
- Tiempo total de completación (< 3 minutos)
- Número de errores o retrocesos
- Facilidad para encontrar opciones

TAREA 3: EDITAR FILTRO EXISTENTE
Objetivo: Modificar un filtro existente
Instrucciones: "Modifica el filtro 'Newsletter' para que también filtre correos con la palabra 'boletín informativo' y actívalo"

Pasos esperados:
1. Localizar filtro "Newsletter"
2. Presionar botón de editar
3. Modificar criterios agregando "boletín informativo"
4. Cambiar estado a activo
5. Revisar y guardar cambios

Métricas:
- Facilidad para localizar el filtro (< 15 segundos)
- Comprensión de la interfaz de edición
- Éxito en la modificación

TAREA 4: CONFIGURAR RESPUESTA AUTOMÁTICA
Objetivo: Activar respuesta automática en un filtro
Instrucciones: "Configura el filtro 'Trabajo importante' para que envíe respuestas automáticas"

Pasos esperados:
1. Editar filtro "Trabajo importante"
2. Activar opción "Respuesta automática"
3. Confirmar cambios

Métricas:
- Comprensión de la función
- Facilidad para encontrar la opción

TAREA 5: ELIMINAR FILTRO
Objetivo: Eliminar un filtro no deseado
Instrucciones: "Elimina el filtro 'Promociones' porque ya no lo necesitas"

Pasos esperados:
1. Localizar filtro "Promociones"
2. Presionar botón eliminar
3. Confirmar eliminación en el modal

Métricas:
- Confianza en el proceso de eliminación
- Comprensión del modal de confirmación

====================================================================
PREGUNTAS POST-TAREA:
====================================================================

Después de cada tarea, preguntar:
1. "En una escala del 1 al 5, ¿qué tan fácil fue completar esta tarea?"
2. "¿Hay algo que cambiarías para que fuera más fácil?"
3. "¿Te sentiste seguro/a durante el proceso?"

PREGUNTAS FINALES:
1. "¿Qué fue lo que más te gustó de la aplicación?"
2. "¿Qué fue lo más confuso o difícil?"
3. "¿Usarías esta aplicación en tu trabajo diario?"
4. "¿Qué funcionalidad adicional te gustaría ver?"
5. "En general, ¿cómo calificarías la experiencia (1-10)?"

====================================================================
OBSERVACIONES A REGISTRAR:
====================================================================

COMPORTAMIENTO DEL USUARIO:
- Dudas o confusiones evidentes
- Tiempo excesivo en alguna acción
- Intentos fallidos o retrocesos
- Expresiones de frustración o satisfacción
- Uso de funciones no solicitadas

PROBLEMAS DE USABILIDAD:
- Elementos no encontrados fácilmente
- Textos o iconos mal interpretados
- Flujos de navegación confusos
- Respuestas inesperadas del sistema

COMENTARIOS POSITIVOS:
- Funciones intuitivas
- Diseño visual atractivo
- Flujos lógicos y eficientes
- Feedback claro del sistema

====================================================================
CRITERIOS DE ÉXITO:
====================================================================

TAREA EXITOSA SI:
✓ Se completa en tiempo razonable
✓ Sin errores críticos
✓ Usuario muestra confianza
✓ Resultado final correcto

TAREA FALLIDA SI:
✗ Usuario abandona la tarea
✗ Múltiples intentos fallidos
✗ Frustración evidente
✗ Resultado incorrecto

====================================================================
MEJORAS SUGERIDAS BASADAS EN OBSERVACIONES:
====================================================================

PROBLEMAS COMUNES IDENTIFICADOS:
1. Usuarios confunden "palabra clave" con "asunto"
   → Mejorar etiquetas y descripciones

2. Modal de confirmación poco claro
   → Añadir más contexto sobre consecuencias

3. Criterios de filtro poco visibles
   → Mejorar contraste y tipografía

4. Estado del filtro no es obvio
   → Usar colores más distintivos

RECOMENDACIONES DE DISEÑO:
- Añadir tooltips explicativos
- Mejorar jerarquía visual
- Simplificar formularios largos
- Añadir paso a paso en creación de filtros

*/

// screens/edit_filter_screen.dart - Similar a CreateFilterScreen pero con datos precargados
// [El código sería muy similar al CreateFilterScreen, pero con los campos prellenados]