﻿{ DEFINE DEMOVERSION}
{ DEFINE WITHRIGHTS}
{ DEFINE EHLIB4}


{ IFDEF DEMOVERSION}
  { UNDEF WITHRIGHTS}
{ ENDIF}

{$IFDEF VER180}
 {$DEFINE EHLIB4}
{$ENDIF}