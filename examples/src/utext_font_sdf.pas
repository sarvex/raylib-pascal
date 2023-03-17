(****************************************************************************
                            _   _  _
                           | | (_)| |
        ____  _____  _   _ | |  _ | |__
       / ___)(____ || | | || | | ||  _ \
      | |    / ___ || |_| || | | || |_) )
      |_|    \_____| \__  | \_)|_||____/
                    (____/

          raylib™ for Pascal (Win64)

      a simple and easy-to-use library to
      enjoy videogames programming.

Copyright © 2022-present tinyBigGAMES™ LLC
All Rights Reserved.

Website: https://tinybiggames.com
Email  : mailto:support@tinybiggames.com

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software in
   a product, an acknowledgment in the product documentation would be
   appreciated but is not required.

2. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

3. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in
   the documentation and/or other materials provided with the
   distribution.

4. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived
   from this software without specific prior written permission.

5. All video, audio, graphics and other content accessed through the
   software in this distro is the property of the applicable content owner
   and may be protected by applicable copyright law. This License gives
   Customer no rights to such content, and Company disclaims any liability
   for misuse of content.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*****************************************************************************)

unit utext_font_sdf;

interface

uses
  sysutils,
  raylib,
  ucommon;

const
  modual = 'text';
  title  = 'SDF fonts';
  fps    = 60;
  msg   = 'Signed Distance Fields';

var
  fileSize: integer = 0;
  fileData: PByte = nil;
  fontDefault: Font;
  atlas: Image;
  fontSDF: Font;
  ashader: Shader;
  fontPosition: Vector2;
  textSize: Vector2;
  fontSize: single;
  currentFont: integer;

procedure example_startup;
procedure example_shutdown;
procedure example_update;
procedure example_render;
procedure example_run;

implementation

procedure example_startup;
var
  LIcon: Image;
begin
  // init flags for high depi and mssa
  SetConfigFlags(FLAG_WINDOW_HIGHDPI or FLAG_MSAA_4X_HINT);

  // init windows
  InitWindow(screen_width, screen_height, GetTitle(modual, title));

  // init icon
  LoadDefaultIcon;

  // init fps
  SetTargetFPS(fps);

  fileSize := 0;
  fileData := LoadFileData('resources/anonymous_pro_bold.ttf', @fileSize);

  // Default font generation from TTF font
  fontDefault.baseSize := 16;
  fontDefault.glyphCount := 95;

  // Loading font data from memory data
  // Parameters > font size: 16, no glyphs array provided (0), glyphs count: 95 (autogenerate chars array)
  fontDefault.glyphs := LoadFontData(fileData, fileSize, 16, nil, 95, FONT_DEFAULT);
  // Parameters > glyphs count: 95, font size: 16, glyphs padding in image: 4 px, pack method: 0 (default)
  atlas := GenImageFontAtlas(fontDefault.glyphs, @fontDefault.recs, 95, 16, 4, 0);
  fontDefault.texture := LoadTextureFromImage(atlas);
  UnloadImage(atlas);

  // SDF font generation from TTF font
  fontSDF.baseSize := 16;
  fontSDF.glyphCount := 95;
  // Parameters > font size: 16, no glyphs array provided (0), glyphs count: 0 (defaults to 95)
  fontSDF.glyphs := LoadFontData(fileData, fileSize, 16, nil, 0, FONT_SDF);
  // Parameters > glyphs count: 95, font size: 16, glyphs padding in image: 0 px, pack method: 1 (Skyline algorythm)
  atlas := GenImageFontAtlas(fontSDF.glyphs, @fontSDF.recs, 95, 16, 0, 1);
  fontSDF.texture := LoadTextureFromImage(atlas);
  UnloadImage(atlas);

  UnloadFileData(fileData);      // Free memory from loaded file

  // Load SDF required shader (we use default vertex shader)
  ashader := LoadShader(nil, TextFormat('resources/shaders/glsl%i/sdf.fs', GLSL_VERSION));
  SetTextureFilter(fontSDF.texture, TEXTURE_FILTER_BILINEAR);    // Required for SDF font

  fontPosition := GetVector2(40, screen_height/2.0 - 50 );
  textSize := GetVector2(0.0, 0.0);
  fontSize := 16.0;
  currentFont := 0;            // 0 - fontDefault, 1 - fontSDF
end;

procedure example_shutdown;
begin
  // Default font unloading
  UnloadFont(fontDefault);

  // SDF font unloading
  UnloadFont(fontSDF);

  // Unload SDF shader
  UnloadShader(ashader);

  // close window
  CloseWindow;
end;

procedure example_update;
begin
  // update
  fontSize := fontSize + GetMouseWheelMove*8.0;

  if fontSize < 6 then fontSize := 6;

  if IsKeyDown(KEY_SPACE) then
    currentFont := 1
  else
    currentFont := 0;

  if currentFont = 0 then
    textSize := MeasureTextEx(fontDefault, msg, fontSize, 0)
  else
    textSize := MeasureTextEx(fontSDF, msg, fontSize, 0);

  fontPosition.x := GetScreenWidth/2 - textSize.x/2;
  fontPosition.y := GetScreenHeight/2 - textSize.y/2 + 80;
end;

procedure example_render;
begin
  // render
  BeginDrawing;
    ClearBackground(RAYWHITE);
    DrawFPS(3, 3);
    if currentFont = 1 then
      begin
        // NOTE: SDF fonts require a custom SDf shader to compute fragment color
        BeginShaderMode(ashader);    // Activate SDF font shader
            DrawTextEx(fontSDF, msg, fontPosition, fontSize, 0, ORANGE);
        EndShaderMode();            // Activate our default shader for next drawings

        DrawTexture(fontSDF.texture, 10, 10, BLACK);
      end
    else
      begin
        DrawTextEx(fontDefault, msg, fontPosition, fontSize, 0, BLACK);
        DrawTexture(fontDefault.texture, 10, 10, BLACK);
      end;

    if currentFont = 1 then
      DrawText('SDF!', 320, 20, 80, RED)
    else
      DrawText('default font', 315, 40, 30, GRAY);

    DrawText('FONT SIZE: 16.0', GetScreenWidth - 240, 20, 20, DARKGRAY);
    DrawText(TextFormat('RENDER SIZE: %02.02f', fontSize), GetScreenWidth - 240, 50, 20, DARKGRAY);
    DrawText('Use MOUSE WHEEL to SCALE TEXT!', GetScreenWidth - 240, 90, 10, DARKGRAY);

    DrawText('HOLD SPACE to USE SDF FONT VERSION!', 340, GetScreenHeight() - 30, 20, MAROON);
  EndDrawing;
end;

procedure example_run;
begin
  // init startup
  example_startup;

  // process game loop
  while (not WindowShouldClose) do
  begin
    example_update;
    example_render;
  end;

  // shut down
  example_shutdown;
end;

end.
