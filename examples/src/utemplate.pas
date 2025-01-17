(****************************************************************************
                            _   _  _
                           | | (_)| |
        ____  _____  _   _ | |  _ | |__
       / ___)(____ || | | || | | ||  _ \
      | |    / ___ || |_| || | | || |_) )
      |_|    \_____| \__  | \_)|_||____/
                    (____/

          raylib� for Pascal (Win64)

      a simple and easy-to-use library to
      enjoy videogames programming.

Copyright � 2022-present tinyBigGAMES� LLC
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

unit utemplate;

interface

uses
  sysutils,
  raylib,
  ucommon;

const
  modual = 'core';
  title  = 'base window';
  fps    = 60;

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
end;

procedure example_shutdown;
begin
  // close window
  CloseWindow;
end;

procedure example_update;
begin
  // update
end;

procedure example_render;
begin
  // render
  BeginDrawing;
    ClearBackground(DARKSLATEBROWN);
    DrawFPS(3, 3);
    DrawText('Hello, World! Welcome to raylib.', 190, 200, 20, DARKGREEN);
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
