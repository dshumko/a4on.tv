# Webp for Delphi and Lazarus

Can encode and decode without any DLLs or other binaries.

## Usage

Add WebpImageX to your uses, then:
```
Image1.Picture.LoadFromFile('test.webp');
```

## Saving
```
var web: TWebpImage;
    Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  Bmp.LoadFromFile('test.bmp');

  web := TWebpImage.Create;
  web.Assign(Bmp);
  Bmp.Free;

  web.SaveToFile('out.webp');
  web.free;
end;
```

## Compatibility

WebP decoding was tested and works:
- on Windows in Delphi/Lazarus 
- on Linux Mint in Lazarus.
