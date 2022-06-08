{ DEFINE DEMOVERSION }

{ DEFINE BETAVERSION }

{$DEFINE DIGIT}      // поддержка цифры
{$DEFINE LAN}        // поддержка сети
{$DEFINE SUPERMODE}  // скрытие абонентов
{$DEFINE WITHRIGHTS} // подержка прав, с 4-ой версии не выключать

{$DEFINE USE_ZEOS}   // Используем ZEOSLIB

{ .$DEFINE EMBEDDEDWB } // что использовать для карты IE или EmbeddedWB https://github.com/littleearth/Delphi-EmbeddedWB

{$IFNDEF VER180}
{$DEFINE UTF}
{$ENDIF}
{ DEFINE LOCALIZER } // Локализация программы
{ DEFINE ATIRRA }    // Если нужен модуль Атирра
{ DEFINE COMPOSITE } // Используем COMPOSITE, кроме МТИС никому не нужен был

{$DEFINE Scale4k}
{ -$DEFINE DELPHI_STYLE_SCALING }
