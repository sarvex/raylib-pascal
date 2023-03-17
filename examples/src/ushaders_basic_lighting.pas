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

unit ushaders_basic_lighting;

interface

uses
  sysutils,
  raylib,
  ucommon;

const
  modual = 'shaders';
  title  = 'basic lighting';

var
  camera: Camera3D;
  amodel: Model;
  acube: Model;
  ashader: Shader;
  ambientLoc: Integer;
  floats: array[0..3] of single;
  lights: array[0..MAX_LIGHTS-1] of Light;

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

  // define the camera to look into our 3d world
  camera.position := GetVector3(2.0, 4.0, 6.0);
  camera.target := GetVector3(0.0, 0.5, 0.0);
  camera.up := GetVector3(0.0, 1.0, 0.0);
  camera.fovy := 45.0;
  camera.projection := CAMERA_PERSPECTIVE;

  // load plane model from a generated mesh
  amodel := LoadModelFromMesh(GenMeshPlane(10.0, 10.0, 3, 3));
  acube := LoadModelFromMesh(GenMeshCube(2.0, 4.0, 2.0));

  // load basic lighting shader
  ashader := LoadShader(TextFormat('resources/shaders/glsl%i/lighting.vs', GLSL_VERSION),
                       TextFormat('resources/shaders/glsl%i/lighting.fs', GLSL_VERSION));
  // get some required shader locations
  PIntegerArray(@ashader.locs)^[SHADER_LOC_VECTOR_VIEW] := GetShaderLocation(ashader, 'viewPos');

  // NOTE: "matModel" location name is automatically assigned on shader loading,
  // no need to get the location again if using that uniform name
  //shader.locs[SHADER_LOC_MATRIX_MODEL] = GetShaderLocation(shader, "matModel");

  // ambient light level (some basic lighting)
  ambientLoc := GetShaderLocation(ashader, 'ambient');
  floats[0] := 0.1; floats[1] := 0.1; floats[2] := 0.1; floats[3] := 1.0;
  SetShaderValue(ashader, ambientLoc, @floats, SHADER_UNIFORM_VEC4);

  // assign out lighting shader to model
  PMaterialArray(@amodel.materials)^[0].shader := ashader;
  PMaterialArray(@acube.materials)^[0].shader := ashader;

  // create lights
  lights[0] := CreateLight(LIGHT_POINT, GetVector3( -2, 1, -2 ), Vector3Zero, YELLOW, ashader);
  lights[1] := CreateLight(LIGHT_POINT, GetVector3( 2, 1, 2 ), Vector3Zero, RED, ashader);
  lights[2] := CreateLight(LIGHT_POINT, GetVector3( -2, 1, 2 ), Vector3Zero, GREEN, ashader);
  lights[3] := CreateLight(LIGHT_POINT, GetVector3( 2, 1, -2 ), Vector3Zero, BLUE, ashader);

  SetTargetFPS(60);

end;

procedure example_shutdown;
begin
  // unload models and shader
  UnloadModel(amodel);
  UnloadModel(acube);
  UnloadShader(ashader);

  // close window
  CloseWindow;
end;

procedure example_update;
var
  cameraPos: array[0..2] of single;
  i: integer;
begin
  // update camera
  UpdateCamera(@camera, CAMERA_ORBITAL);

  // update the shader with the camera view vector (points towards { 0.0f, 0.0f, 0.0f })
  cameraPos[0] := camera.position.x;
  cameraPos[1] := camera.position.y;
  cameraPos[2] := camera.position.z;
  SetShaderValue(ashader, PIntegerArray(@ashader.locs)^[SHADER_LOC_VECTOR_VIEW], @cameraPos, SHADER_UNIFORM_VEC3);

  // check key inputs to enable/disable lights
  if IsKeyPressed(KEY_Y) then lights[0].enabled :=  not lights[0].enabled;
  if IsKeyPressed(KEY_R) then lights[1].enabled := not lights[1].enabled;
  if IsKeyPressed(KEY_G) then lights[2].enabled := not lights[2].enabled;
  if IsKeyPressed(KEY_B) then lights[3].enabled := not lights[3].enabled;

  // update light values (actually, only enable/disable them)
  for i := 0 to MAX_LIGHTS-1 do UpdateLightValues(ashader, lights[i]);
end;

procedure example_render;
var
  i: Integer;
begin
  // render
  BeginDrawing();
    ClearBackground(RAYWHITE);
    BeginMode3D(camera);
      DrawModel(amodel, Vector3Zero(), 1.0, WHITE);
      DrawModel(acube, Vector3Zero(), 1.0, WHITE);
      // Draw spheres to show where the lights are
      for i := 0 to MAX_LIGHTS-1 do
      begin
        if (lights[i].enabled) then DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].acolor)
        else DrawSphereWires(lights[i].position, 0.2, 8, 8, ColorAlpha(lights[i].acolor, 0.3));
      end;
      DrawGrid(10, 1.0);
    EndMode3D();
    DrawFPS(10, 10);
    DrawText('Use keys [Y][R][G][B] to toggle lights', 10, 40, 20, DARKGRAY);
  EndDrawing();
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
