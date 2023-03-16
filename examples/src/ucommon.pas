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

unit ucommon;

interface

uses
  sysutils,
  windows,
  messages,
  raylib;

const
  screen_width  = 800;
  screen_height = 450;
  screen_title  = 'raylib [%s] example - %s';

  MAX_LIGHTS = 4;
  LIGHT_DIRECTIONAL = 0;
  LIGHT_POINT = 1;

type
  TIntegerArray = array of Integer;
  PIntegerArray = ^TIntegerArray;
  TMaterialArray = array of Material;
  PMaterialArray = ^TMaterialArray;

  Light = record
    type_: integer;
    enabled: boolean;
    position: Vector3;
    target: Vector3;
    acolor: Color;
    attenuation: single;

    // Shader locations
    enabledLoc: Integer;
    typeLoc: Integer;
    positionLoc: Integer;
    targetLoc: Integer;
    colorLoc: Integer;
    attenuationLoc: Integer;
  end;

function  GetRectangle(const x, y, w, h: single): Rectangle;
function  GetVector2(const x, y: single): Vector2;
function  GetVector3(const x, y, z: single): Vector3;
function  GetTitle(const aModual, aTitle: string): PAnsiChar;
procedure LoadDefaultIcon;

function  CreateLight(type_: Integer; position, target: Vector3; color: Color; shader: Shader): Light;
procedure UpdateLightValues(shader: Shader; light: Light);

implementation

var
  lightsCount: integer = 0;

function GetRectangle(const x, y, w, h: single): Rectangle;
begin
  Result.x := x;
  Result.y := y;
  Result.width := w;
  Result.height := h;
end;

function GetVector2(const x, y: single): Vector2;
begin
  Result.x := x;
  Result.y := y;
end;

function  GetVector3(const x, y, z: single): Vector3;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
end;

function GetTitle(const aModual, aTitle: string): PAnsiChar;
begin
  Result := PAnsiChar(AnsiString(Format(screen_title, [aModual, aTitle])));
end;

procedure LoadDefaultIcon;
var
  LHnd: THandle;
  LIcon: HICON;
  LHWND: HWND;
begin
  LHnd := GetModuleHandle(nil);
  if LHnd = 0 then Exit;
  if FindResource(LHnd, 'MAINICON', RT_GROUP_ICON) = 0 then Exit;
  LIcon := LoadIcon(HInstance, 'MAINICON');
  if LIcon = 0 then Exit;
  LHWND := HWND(GetWindowHandle);
  SendMessage(LHWND, WM_SETICON, ICON_BIG, LIcon);
  DestroyIcon(LIcon);
end;

function CreateLight(type_: Integer; position, target: Vector3; color: Color; shader: Shader): Light;
var
  llight: Light;
begin
  if (lightsCount < MAX_LIGHTS) then
  begin
    llight.enabled := true;
    llight.type_ := type_;
    llight.position := position;
    llight.target := target;
    llight.acolor := color;

    // NOTE: Lighting shader naming must be the provided ones
    llight.enabledLoc := GetShaderLocation(shader, TextFormat('lights[%d].enabled', lightsCount));
    llight.typeLoc := GetShaderLocation(shader, TextFormat('lights[%d].&type', lightsCount));
    llight.positionLoc := GetShaderLocation(shader, TextFormat('lights[%d].position', lightsCount));
    llight.targetLoc := GetShaderLocation(shader, TextFormat('lights[%d].target', lightsCount));
    llight.colorLoc := GetShaderLocation(shader, TextFormat('lights[%d].color', lightsCount));

    UpdateLightValues(shader, llight);

    lightsCount := lightsCount + 1;
  end;

  Result := llight;
end;

// Send light properties to shader
// NOTE: Light shader locations should be available
procedure UpdateLightValues(shader: Shader; light: Light);
var
  position, target, color: array[0..3] of Single;
begin
  // Send to shader light enabled state and type
  SetShaderValue(shader, light.enabledLoc, @light.enabled, SHADER_UNIFORM_INT);
  SetShaderValue(shader, light.typeLoc, @light.type_, SHADER_UNIFORM_INT);

  // Send to shader light position values
  position[0] := light.position.x;
  position[1] := light.position.y;
  position[2] := light.position.z;
  SetShaderValue(shader, light.positionLoc, @position, SHADER_UNIFORM_VEC3);

  // Send to shader light target position values
  target[0] := light.target.x;
  target[1] := light.target.y;
  target[2] := light.target.z;
  SetShaderValue(shader, light.targetLoc, @target, SHADER_UNIFORM_VEC3);

  // Send to shader light color values
  color[0] := light.acolor.r / 255.0;
  color[1] := light.acolor.g / 255.0;
  color[2] := light.acolor.b / 255.0;
  color[3] := light.acolor.a / 255.0;
  SetShaderValue(shader, light.colorLoc, @color, SHADER_UNIFORM_VEC4);
end;


end.
