(* ***************************************************************************
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
  **************************************************************************** *)

unit uscroll_panel;

interface

uses
  sysutils,
  raylib,
  ucommon;

const
  modual = 'raygui';
  title = 'scroll panel';

var
  panelRec: Rectangle = (x: 20; y: 40; width: 200; height: 150);
  panelContentRec: Rectangle = (x: 0; y: 0; width: 340; height: 340);
  panelScroll: Vector2 = (x: 99; y: - 20);
  showContentArea: Boolean = true;
  view: Rectangle;
  style: Integer;
  text: PAnsiChar;

procedure example_startup;
procedure example_shutdown;
procedure example_update;
procedure example_render;
procedure example_run;

implementation

procedure DrawStyleEditControls;
begin
  // ScrollPanel style controls
  GuiGroupBox(GetRectangle(550, 170, 220, 205), 'SCROLLBAR STYLE');

  style := GuiGetStyle(SCROLLBAR, BORDER_WIDTH);
  GuiLabel(GetRectangle(555, 195, 110, 10), 'BORDER_WIDTH');
  GuiSpinner(GetRectangle(670, 190, 90, 20), nil, @style, 0, 6, false);
  GuiSetStyle(SCROLLBAR, BORDER_WIDTH, style);

  style := GuiGetStyle(SCROLLBAR, ARROWS_SIZE);
  GuiLabel(GetRectangle(555, 220, 110, 10), 'ARROWS_SIZE');
  GuiSpinner(GetRectangle(670, 215, 90, 20), nil, @style, 4, 14, false);
  GuiSetStyle(SCROLLBAR, ARROWS_SIZE, style);

  style := GuiGetStyle(SCROLLBAR, SLIDER_PADDING);
  GuiLabel(GetRectangle(555, 245, 110, 10), 'SLIDER_PADDING');
  GuiSpinner(GetRectangle(670, 240, 90, 20), nil, @style, 0, 14, false);
  GuiSetStyle(SCROLLBAR, SLIDER_PADDING, style);

  style := Ord(GuiCheckBox(GetRectangle(565, 280, 20, 20), 'ARROWS_VISIBLE',
    Boolean(GuiGetStyle(SCROLLBAR, ARROWS_VISIBLE))));
  GuiSetStyle(SCROLLBAR, ARROWS_VISIBLE, style);

  style := GuiGetStyle(SCROLLBAR, SLIDER_PADDING);
  GuiLabel(GetRectangle(555, 325, 110, 10), 'SLIDER_PADDING');
  GuiSpinner(GetRectangle(670, 320, 90, 20), nil, @style, 0, 14, false);
  GuiSetStyle(SCROLLBAR, SLIDER_PADDING, style);

  style := GuiGetStyle(SCROLLBAR, SLIDER_WIDTH);
  GuiLabel(GetRectangle(555, 350, 110, 10), 'SLIDER_WIDTH');
  GuiSpinner(GetRectangle(670, 345, 90, 20), nil, @style, 2, 100, false);
  GuiSetStyle(SCROLLBAR, SLIDER_WIDTH, style);

  if GuiGetStyle(LISTVIEW, SCROLLBAR_SIDE) = SCROLLBAR_LEFT_SIDE then
    text := 'SCROLLBAR: LEFT'
  else
    text := 'SCROLLBAR: RIGHT';
  style := Ord(GuiToggle(GetRectangle(560, 110, 200, 35), text,
    Boolean(GuiGetStyle(LISTVIEW, SCROLLBAR_SIDE))));
  GuiSetStyle(LISTVIEW, SCROLLBAR_SIDE, style);

  // ScrollBar style controls
  GuiGroupBox(GetRectangle(550, 20, 220, 135), 'SCROLLPANEL STYLE');

  style := GuiGetStyle(LISTVIEW, SCROLLBAR_WIDTH);
  GuiLabel(GetRectangle(555, 35, 110, 10), 'SCROLLBAR_WIDTH');
  GuiSpinner(GetRectangle(670, 30, 90, 20), nil, @style, 6, 30, false);
  GuiSetStyle(LISTVIEW, SCROLLBAR_WIDTH, style);

  style := GuiGetStyle(DEFAULT, BORDER_WIDTH);
  GuiLabel(GetRectangle(555, 60, 110, 10), 'BORDER_WIDTH');
  GuiSpinner(GetRectangle(670, 55, 90, 20), nil, @style, 0, 20, false);
  GuiSetStyle(DEFAULT, BORDER_WIDTH, style);
end;

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
  ClearBackground(RAYWHITE);
  DrawText(TextFormat('[%f, %f]', panelScroll.x, panelScroll.y), 4, 4, 20, RED);
  view := GuiScrollPanel(panelRec, nil, panelContentRec, @panelScroll);
  BeginScissorMode(Round(view.x), Round(view.y), Round(view.width),
    Round(view.height));
  GuiGrid(GetRectangle(panelRec.x + panelScroll.x, panelRec.y + panelScroll.y,
    panelContentRec.width, panelContentRec.height), '', 16, 3);
  EndScissorMode;
  if (showContentArea) then
    DrawRectangle(Round(panelRec.x + panelScroll.x),
      Round(panelRec.y + panelScroll.y), Round(panelContentRec.width),
      Round(panelContentRec.height), Fade(RED, 0.1));
  DrawStyleEditControls;
  showContentArea := GuiCheckBox(GetRectangle(565, 80, 20, 20),
    'SHOW CONTENT AREA', showContentArea);
  panelContentRec.width := GuiSliderBar(GetRectangle(590, 385, 145, 15),
    'WIDTH', TextFormat('%i', Round(panelContentRec.width)),
    panelContentRec.width, 1, 600);
  panelContentRec.height := GuiSliderBar(GetRectangle(590, 410, 145, 15),
    'HEIGHT', TextFormat('%i', Round(panelContentRec.height)),
    panelContentRec.height, 1, 400);
  EndDrawing;
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
