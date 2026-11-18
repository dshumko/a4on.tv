{ DEFINE DEMOVERSION }

{$DEFINE DIGIT}      // поддержка цифры
{$DEFINE LAN}        // поддержка сети
{$DEFINE SUPERMODE}  // скрытие абонентов

{$DEFINE USE_ZEOS}   // Используем ZEOSLIB

// переключение между PIXIE и THtmlViewer
{ DEFINE USE_PIXIE}

// штучный учет, можно собрать без него
{$DEFINE IS_UNIT}

//{$UNDEF EurekaLog}

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$ENDIF}