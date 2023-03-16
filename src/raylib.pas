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

Includes the following open-sources libraries:
* raylib  - https://github.com/raysan5/raylib
* raygui  - https://github.com/raysan5/raygui
* physac  - https://github.com/raysan5/physac
* pl_mpeg - https://github.com/phoboslab/pl_mpeg

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

unit raylib;

{$IFDEF FPC}
  {$MODE DELPHIUNICODE}
{$ENDIF}

{$Z4}
{$A8}

{$IFNDEF WIN64}
  {$MESSAGE Error 'Unsupported platform'}
{$ENDIF}

interface

const
  BUILD_LIBTYPE_SHARED = 1;
  RAYLIB_VERSION_MAJOR = 4;
  RAYLIB_VERSION_MINOR = 5;
  RAYLIB_VERSION_PATCH = 0;
  RAYLIB_VERSION = '4.5';
  PI = 3.14159265358979323846;
  DEG2RAD = (PI/180.0);
  RAD2DEG = (180.0/PI);
  EPSILON = 0.000001;
  RLGL_VERSION = '4.5';
  RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 8192;
  RL_DEFAULT_BATCH_BUFFERS = 1;
  RL_DEFAULT_BATCH_DRAWCALLS = 256;
  RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS = 4;
  RL_MAX_MATRIX_STACK_SIZE = 32;
  RL_MAX_SHADER_LOCATIONS = 32;
  RL_CULL_DISTANCE_NEAR = 0.01;
  RL_CULL_DISTANCE_FAR = 1000.0;
  RL_TEXTURE_WRAP_S = $2802;
  RL_TEXTURE_WRAP_T = $2803;
  RL_TEXTURE_MAG_FILTER = $2800;
  RL_TEXTURE_MIN_FILTER = $2801;
  RL_TEXTURE_FILTER_NEAREST = $2600;
  RL_TEXTURE_FILTER_LINEAR = $2601;
  RL_TEXTURE_FILTER_MIP_NEAREST = $2700;
  RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = $2702;
  RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = $2701;
  RL_TEXTURE_FILTER_MIP_LINEAR = $2703;
  RL_TEXTURE_FILTER_ANISOTROPIC = $3000;
  RL_TEXTURE_MIPMAP_BIAS_RATIO = $4000;
  RL_TEXTURE_WRAP_REPEAT = $2901;
  RL_TEXTURE_WRAP_CLAMP = $812F;
  RL_TEXTURE_WRAP_MIRROR_REPEAT = $8370;
  RL_TEXTURE_WRAP_MIRROR_CLAMP = $8742;
  RL_MODELVIEW = $1700;
  RL_PROJECTION = $1701;
  RL_TEXTURE = $1702;
  RL_LINES = $0001;
  RL_TRIANGLES = $0004;
  RL_QUADS = $0007;
  RL_UNSIGNED_BYTE = $1401;
  RL_FLOAT = $1406;
  RL_STREAM_DRAW = $88E0;
  RL_STREAM_READ = $88E1;
  RL_STREAM_COPY = $88E2;
  RL_STATIC_DRAW = $88E4;
  RL_STATIC_READ = $88E5;
  RL_STATIC_COPY = $88E6;
  RL_DYNAMIC_DRAW = $88E8;
  RL_DYNAMIC_READ = $88E9;
  RL_DYNAMIC_COPY = $88EA;
  RL_FRAGMENT_SHADER = $8B30;
  RL_VERTEX_SHADER = $8B31;
  RL_COMPUTE_SHADER = $91B9;
  RL_ZERO = 0;
  RL_ONE = 1;
  RL_SRC_COLOR = $0300;
  RL_ONE_MINUS_SRC_COLOR = $0301;
  RL_SRC_ALPHA = $0302;
  RL_ONE_MINUS_SRC_ALPHA = $0303;
  RL_DST_ALPHA = $0304;
  RL_ONE_MINUS_DST_ALPHA = $0305;
  RL_DST_COLOR = $0306;
  RL_ONE_MINUS_DST_COLOR = $0307;
  RL_SRC_ALPHA_SATURATE = $0308;
  RL_CONSTANT_COLOR = $8001;
  RL_ONE_MINUS_CONSTANT_COLOR = $8002;
  RL_CONSTANT_ALPHA = $8003;
  RL_ONE_MINUS_CONSTANT_ALPHA = $8004;
  RL_FUNC_ADD = $8006;
  RL_MIN = $8007;
  RL_MAX = $8008;
  RL_FUNC_SUBTRACT = $800A;
  RL_FUNC_REVERSE_SUBTRACT = $800B;
  RL_BLEND_EQUATION = $8009;
  RL_BLEND_EQUATION_RGB = $8009;
  RL_BLEND_EQUATION_ALPHA = $883D;
  RL_BLEND_DST_RGB = $80C8;
  RL_BLEND_SRC_RGB = $80C9;
  RL_BLEND_DST_ALPHA = $80CA;
  RL_BLEND_SRC_ALPHA = $80CB;
  RL_BLEND_COLOR = $8005;
  RAYGUI_VERSION = '3.2';
  SCROLLBAR_LEFT_SIDE = 0;
  SCROLLBAR_RIGHT_SIDE = 1;
  PHYSAC_MAX_BODIES = 64;
  PHYSAC_MAX_MANIFOLDS = 4096;
  PHYSAC_MAX_VERTICES = 24;
  PHYSAC_DEFAULT_CIRCLE_VERTICES = 24;
  PHYSAC_COLLISION_ITERATIONS = 100;
  PHYSAC_PENETRATION_ALLOWANCE = 0.05;
  PHYSAC_PENETRATION_CORRECTION = 0.4;
  PHYSAC_PI = 3.14159265358979323846;
  PHYSAC_DEG2RAD = (PHYSAC_PI/180.0);
  PLM_PACKET_INVALID_TS = -1;
  PLM_AUDIO_SAMPLES_PER_FRAME = 1152;
  PLM_BUFFER_DEFAULT_SIZE = (128*1024);

type
  ConfigFlags = Integer;
  PConfigFlags = ^ConfigFlags;

const
  FLAG_VSYNC_HINT = 64;
  FLAG_FULLSCREEN_MODE = 2;
  FLAG_WINDOW_RESIZABLE = 4;
  FLAG_WINDOW_UNDECORATED = 8;
  FLAG_WINDOW_HIDDEN = 128;
  FLAG_WINDOW_MINIMIZED = 512;
  FLAG_WINDOW_MAXIMIZED = 1024;
  FLAG_WINDOW_UNFOCUSED = 2048;
  FLAG_WINDOW_TOPMOST = 4096;
  FLAG_WINDOW_ALWAYS_RUN = 256;
  FLAG_WINDOW_TRANSPARENT = 16;
  FLAG_WINDOW_HIGHDPI = 8192;
  FLAG_WINDOW_MOUSE_PASSTHROUGH = 16384;
  FLAG_MSAA_4X_HINT = 32;
  FLAG_INTERLACED_HINT = 65536;

type
  TraceLogLevel = Integer;
  PTraceLogLevel = ^TraceLogLevel;

const
  LOG_ALL = 0;
  LOG_TRACE = 1;
  LOG_DEBUG = 2;
  LOG_INFO = 3;
  LOG_WARNING = 4;
  LOG_ERROR = 5;
  LOG_FATAL = 6;
  LOG_NONE = 7;

type
  KeyboardKey = Integer;
  PKeyboardKey = ^KeyboardKey;

const
  KEY_NULL = 0;
  KEY_APOSTROPHE = 39;
  KEY_COMMA = 44;
  KEY_MINUS = 45;
  KEY_PERIOD = 46;
  KEY_SLASH = 47;
  KEY_ZERO = 48;
  KEY_ONE = 49;
  KEY_TWO = 50;
  KEY_THREE = 51;
  KEY_FOUR = 52;
  KEY_FIVE = 53;
  KEY_SIX = 54;
  KEY_SEVEN = 55;
  KEY_EIGHT = 56;
  KEY_NINE = 57;
  KEY_SEMICOLON = 59;
  KEY_EQUAL = 61;
  KEY_A = 65;
  KEY_B = 66;
  KEY_C = 67;
  KEY_D = 68;
  KEY_E = 69;
  KEY_F = 70;
  KEY_G = 71;
  KEY_H = 72;
  KEY_I = 73;
  KEY_J = 74;
  KEY_K = 75;
  KEY_L = 76;
  KEY_M = 77;
  KEY_N = 78;
  KEY_O = 79;
  KEY_P = 80;
  KEY_Q = 81;
  KEY_R = 82;
  KEY_S = 83;
  KEY_T = 84;
  KEY_U = 85;
  KEY_V = 86;
  KEY_W = 87;
  KEY_X = 88;
  KEY_Y = 89;
  KEY_Z = 90;
  KEY_LEFT_BRACKET = 91;
  KEY_BACKSLASH = 92;
  KEY_RIGHT_BRACKET = 93;
  KEY_GRAVE = 96;
  KEY_SPACE = 32;
  KEY_ESCAPE = 256;
  KEY_ENTER = 257;
  KEY_TAB = 258;
  KEY_BACKSPACE = 259;
  KEY_INSERT = 260;
  KEY_DELETE = 261;
  KEY_RIGHT = 262;
  KEY_LEFT = 263;
  KEY_DOWN = 264;
  KEY_UP = 265;
  KEY_PAGE_UP = 266;
  KEY_PAGE_DOWN = 267;
  KEY_HOME = 268;
  KEY_END = 269;
  KEY_CAPS_LOCK = 280;
  KEY_SCROLL_LOCK = 281;
  KEY_NUM_LOCK = 282;
  KEY_PRINT_SCREEN = 283;
  KEY_PAUSE = 284;
  KEY_F1 = 290;
  KEY_F2 = 291;
  KEY_F3 = 292;
  KEY_F4 = 293;
  KEY_F5 = 294;
  KEY_F6 = 295;
  KEY_F7 = 296;
  KEY_F8 = 297;
  KEY_F9 = 298;
  KEY_F10 = 299;
  KEY_F11 = 300;
  KEY_F12 = 301;
  KEY_LEFT_SHIFT = 340;
  KEY_LEFT_CONTROL = 341;
  KEY_LEFT_ALT = 342;
  KEY_LEFT_SUPER = 343;
  KEY_RIGHT_SHIFT = 344;
  KEY_RIGHT_CONTROL = 345;
  KEY_RIGHT_ALT = 346;
  KEY_RIGHT_SUPER = 347;
  KEY_KB_MENU = 348;
  KEY_KP_0 = 320;
  KEY_KP_1 = 321;
  KEY_KP_2 = 322;
  KEY_KP_3 = 323;
  KEY_KP_4 = 324;
  KEY_KP_5 = 325;
  KEY_KP_6 = 326;
  KEY_KP_7 = 327;
  KEY_KP_8 = 328;
  KEY_KP_9 = 329;
  KEY_KP_DECIMAL = 330;
  KEY_KP_DIVIDE = 331;
  KEY_KP_MULTIPLY = 332;
  KEY_KP_SUBTRACT = 333;
  KEY_KP_ADD = 334;
  KEY_KP_ENTER = 335;
  KEY_KP_EQUAL = 336;
  KEY_BACK = 4;
  KEY_MENU = 82;
  KEY_VOLUME_UP = 24;
  KEY_VOLUME_DOWN = 25;

type
  MouseButton = Integer;
  PMouseButton = ^MouseButton;

const
  MOUSE_BUTTON_LEFT = 0;
  MOUSE_BUTTON_RIGHT = 1;
  MOUSE_BUTTON_MIDDLE = 2;
  MOUSE_BUTTON_SIDE = 3;
  MOUSE_BUTTON_EXTRA = 4;
  MOUSE_BUTTON_FORWARD = 5;
  MOUSE_BUTTON_BACK = 6;

type
  MouseCursor = Integer;
  PMouseCursor = ^MouseCursor;

const
  MOUSE_CURSOR_DEFAULT = 0;
  MOUSE_CURSOR_ARROW = 1;
  MOUSE_CURSOR_IBEAM = 2;
  MOUSE_CURSOR_CROSSHAIR = 3;
  MOUSE_CURSOR_POINTING_HAND = 4;
  MOUSE_CURSOR_RESIZE_EW = 5;
  MOUSE_CURSOR_RESIZE_NS = 6;
  MOUSE_CURSOR_RESIZE_NWSE = 7;
  MOUSE_CURSOR_RESIZE_NESW = 8;
  MOUSE_CURSOR_RESIZE_ALL = 9;
  MOUSE_CURSOR_NOT_ALLOWED = 10;

type
  GamepadButton = Integer;
  PGamepadButton = ^GamepadButton;

const
  GAMEPAD_BUTTON_UNKNOWN = 0;
  GAMEPAD_BUTTON_LEFT_FACE_UP = 1;
  GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2;
  GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3;
  GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4;
  GAMEPAD_BUTTON_RIGHT_FACE_UP = 5;
  GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6;
  GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7;
  GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8;
  GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9;
  GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10;
  GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11;
  GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12;
  GAMEPAD_BUTTON_MIDDLE_LEFT = 13;
  GAMEPAD_BUTTON_MIDDLE = 14;
  GAMEPAD_BUTTON_MIDDLE_RIGHT = 15;
  GAMEPAD_BUTTON_LEFT_THUMB = 16;
  GAMEPAD_BUTTON_RIGHT_THUMB = 17;

type
  GamepadAxis = Integer;
  PGamepadAxis = ^GamepadAxis;

const
  GAMEPAD_AXIS_LEFT_X = 0;
  GAMEPAD_AXIS_LEFT_Y = 1;
  GAMEPAD_AXIS_RIGHT_X = 2;
  GAMEPAD_AXIS_RIGHT_Y = 3;
  GAMEPAD_AXIS_LEFT_TRIGGER = 4;
  GAMEPAD_AXIS_RIGHT_TRIGGER = 5;

type
  MaterialMapIndex = Integer;
  PMaterialMapIndex = ^MaterialMapIndex;

const
  MATERIAL_MAP_ALBEDO = 0;
  MATERIAL_MAP_METALNESS = 1;
  MATERIAL_MAP_NORMAL = 2;
  MATERIAL_MAP_ROUGHNESS = 3;
  MATERIAL_MAP_OCCLUSION = 4;
  MATERIAL_MAP_EMISSION = 5;
  MATERIAL_MAP_HEIGHT = 6;
  MATERIAL_MAP_CUBEMAP = 7;
  MATERIAL_MAP_IRRADIANCE = 8;
  MATERIAL_MAP_PREFILTER = 9;
  MATERIAL_MAP_BRDF = 10;

type
  ShaderLocationIndex = Integer;
  PShaderLocationIndex = ^ShaderLocationIndex;

const
  SHADER_LOC_VERTEX_POSITION = 0;
  SHADER_LOC_VERTEX_TEXCOORD01 = 1;
  SHADER_LOC_VERTEX_TEXCOORD02 = 2;
  SHADER_LOC_VERTEX_NORMAL = 3;
  SHADER_LOC_VERTEX_TANGENT = 4;
  SHADER_LOC_VERTEX_COLOR = 5;
  SHADER_LOC_MATRIX_MVP = 6;
  SHADER_LOC_MATRIX_VIEW = 7;
  SHADER_LOC_MATRIX_PROJECTION = 8;
  SHADER_LOC_MATRIX_MODEL = 9;
  SHADER_LOC_MATRIX_NORMAL = 10;
  SHADER_LOC_VECTOR_VIEW = 11;
  SHADER_LOC_COLOR_DIFFUSE = 12;
  SHADER_LOC_COLOR_SPECULAR = 13;
  SHADER_LOC_COLOR_AMBIENT = 14;
  SHADER_LOC_MAP_ALBEDO = 15;
  SHADER_LOC_MAP_METALNESS = 16;
  SHADER_LOC_MAP_NORMAL = 17;
  SHADER_LOC_MAP_ROUGHNESS = 18;
  SHADER_LOC_MAP_OCCLUSION = 19;
  SHADER_LOC_MAP_EMISSION = 20;
  SHADER_LOC_MAP_HEIGHT = 21;
  SHADER_LOC_MAP_CUBEMAP = 22;
  SHADER_LOC_MAP_IRRADIANCE = 23;
  SHADER_LOC_MAP_PREFILTER = 24;
  SHADER_LOC_MAP_BRDF = 25;
  SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;
  SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
  MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;
  MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
  MOUSE_MIDDLE_BUTTON = MOUSE_BUTTON_MIDDLE;
  MOUSE_RIGHT_BUTTON = MOUSE_BUTTON_RIGHT;
  MOUSE_LEFT_BUTTON = MOUSE_BUTTON_LEFT;

type
  ShaderUniformDataType = Integer;
  PShaderUniformDataType = ^ShaderUniformDataType;

const
  SHADER_UNIFORM_FLOAT = 0;
  SHADER_UNIFORM_VEC2 = 1;
  SHADER_UNIFORM_VEC3 = 2;
  SHADER_UNIFORM_VEC4 = 3;
  SHADER_UNIFORM_INT = 4;
  SHADER_UNIFORM_IVEC2 = 5;
  SHADER_UNIFORM_IVEC3 = 6;
  SHADER_UNIFORM_IVEC4 = 7;
  SHADER_UNIFORM_SAMPLER2D = 8;

type
  ShaderAttributeDataType = Integer;
  PShaderAttributeDataType = ^ShaderAttributeDataType;

const
  SHADER_ATTRIB_FLOAT = 0;
  SHADER_ATTRIB_VEC2 = 1;
  SHADER_ATTRIB_VEC3 = 2;
  SHADER_ATTRIB_VEC4 = 3;

type
  PixelFormat = Integer;
  PPixelFormat = ^PixelFormat;

const
  PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1;
  PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2;
  PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3;
  PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4;
  PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5;
  PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6;
  PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7;
  PIXELFORMAT_UNCOMPRESSED_R32 = 8;
  PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9;
  PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10;
  PIXELFORMAT_COMPRESSED_DXT1_RGB = 11;
  PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12;
  PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13;
  PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14;
  PIXELFORMAT_COMPRESSED_ETC1_RGB = 15;
  PIXELFORMAT_COMPRESSED_ETC2_RGB = 16;
  PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17;
  PIXELFORMAT_COMPRESSED_PVRT_RGB = 18;
  PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19;
  PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20;
  PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21;

type
  TextureFilter = Integer;
  PTextureFilter = ^TextureFilter;

const
  TEXTURE_FILTER_POINT = 0;
  TEXTURE_FILTER_BILINEAR = 1;
  TEXTURE_FILTER_TRILINEAR = 2;
  TEXTURE_FILTER_ANISOTROPIC_4X = 3;
  TEXTURE_FILTER_ANISOTROPIC_8X = 4;
  TEXTURE_FILTER_ANISOTROPIC_16X = 5;

type
  TextureWrap = Integer;
  PTextureWrap = ^TextureWrap;

const
  TEXTURE_WRAP_REPEAT = 0;
  TEXTURE_WRAP_CLAMP = 1;
  TEXTURE_WRAP_MIRROR_REPEAT = 2;
  TEXTURE_WRAP_MIRROR_CLAMP = 3;

type
  CubemapLayout = Integer;
  PCubemapLayout = ^CubemapLayout;

const
  CUBEMAP_LAYOUT_AUTO_DETECT = 0;
  CUBEMAP_LAYOUT_LINE_VERTICAL = 1;
  CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2;
  CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3;
  CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4;
  CUBEMAP_LAYOUT_PANORAMA = 5;

type
  FontType = Integer;
  PFontType = ^FontType;

const
  FONT_DEFAULT = 0;
  FONT_BITMAP = 1;
  FONT_SDF = 2;

type
  BlendMode = Integer;
  PBlendMode = ^BlendMode;

const
  BLEND_ALPHA = 0;
  BLEND_ADDITIVE = 1;
  BLEND_MULTIPLIED = 2;
  BLEND_ADD_COLORS = 3;
  BLEND_SUBTRACT_COLORS = 4;
  BLEND_ALPHA_PREMULTIPLY = 5;
  BLEND_CUSTOM = 6;
  BLEND_CUSTOM_SEPARATE = 7;

type
  Gesture = Integer;
  PGesture = ^Gesture;

const
  GESTURE_NONE = 0;
  GESTURE_TAP = 1;
  GESTURE_DOUBLETAP = 2;
  GESTURE_HOLD = 4;
  GESTURE_DRAG = 8;
  GESTURE_SWIPE_RIGHT = 16;
  GESTURE_SWIPE_LEFT = 32;
  GESTURE_SWIPE_UP = 64;
  GESTURE_SWIPE_DOWN = 128;
  GESTURE_PINCH_IN = 256;
  GESTURE_PINCH_OUT = 512;

type
  CameraMode = Integer;
  PCameraMode = ^CameraMode;

const
  CAMERA_CUSTOM = 0;
  CAMERA_FREE = 1;
  CAMERA_ORBITAL = 2;
  CAMERA_FIRST_PERSON = 3;
  CAMERA_THIRD_PERSON = 4;

type
  CameraProjection = Integer;
  PCameraProjection = ^CameraProjection;

const
  CAMERA_PERSPECTIVE = 0;
  CAMERA_ORTHOGRAPHIC = 1;

type
  NPatchLayout = Integer;
  PNPatchLayout = ^NPatchLayout;

const
  NPATCH_NINE_PATCH = 0;
  NPATCH_THREE_PATCH_VERTICAL = 1;
  NPATCH_THREE_PATCH_HORIZONTAL = 2;

type
  rlGlVersion = Integer;
  PrlGlVersion = ^rlGlVersion;

const
  RL_OPENGL_11 = 1;
  RL_OPENGL_21 = 2;
  RL_OPENGL_33 = 3;
  RL_OPENGL_43 = 4;
  RL_OPENGL_ES_20 = 5;

type
  rlTraceLogLevel = Integer;
  PrlTraceLogLevel = ^rlTraceLogLevel;

const
  RL_LOG_ALL = 0;
  RL_LOG_TRACE = 1;
  RL_LOG_DEBUG = 2;
  RL_LOG_INFO = 3;
  RL_LOG_WARNING = 4;
  RL_LOG_ERROR = 5;
  RL_LOG_FATAL = 6;
  RL_LOG_NONE = 7;

type
  rlPixelFormat = Integer;
  PrlPixelFormat = ^rlPixelFormat;

const
  RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1;
  RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2;
  RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3;
  RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4;
  RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5;
  RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6;
  RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7;
  RL_PIXELFORMAT_UNCOMPRESSED_R32 = 8;
  RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9;
  RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10;
  RL_PIXELFORMAT_COMPRESSED_DXT1_RGB = 11;
  RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12;
  RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13;
  RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14;
  RL_PIXELFORMAT_COMPRESSED_ETC1_RGB = 15;
  RL_PIXELFORMAT_COMPRESSED_ETC2_RGB = 16;
  RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17;
  RL_PIXELFORMAT_COMPRESSED_PVRT_RGB = 18;
  RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19;
  RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20;
  RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21;

type
  rlTextureFilter = Integer;
  PrlTextureFilter = ^rlTextureFilter;

const
  RL_TEXTURE_FILTER_POINT = 0;
  RL_TEXTURE_FILTER_BILINEAR = 1;
  RL_TEXTURE_FILTER_TRILINEAR = 2;
  RL_TEXTURE_FILTER_ANISOTROPIC_4X = 3;
  RL_TEXTURE_FILTER_ANISOTROPIC_8X = 4;
  RL_TEXTURE_FILTER_ANISOTROPIC_16X = 5;

type
  rlBlendMode = Integer;
  PrlBlendMode = ^rlBlendMode;

const
  RL_BLEND_ALPHA = 0;
  RL_BLEND_ADDITIVE = 1;
  RL_BLEND_MULTIPLIED = 2;
  RL_BLEND_ADD_COLORS = 3;
  RL_BLEND_SUBTRACT_COLORS = 4;
  RL_BLEND_ALPHA_PREMULTIPLY = 5;
  RL_BLEND_CUSTOM = 6;
  RL_BLEND_CUSTOM_SEPARATE = 7;

type
  rlShaderLocationIndex = Integer;
  PrlShaderLocationIndex = ^rlShaderLocationIndex;

const
  RL_SHADER_LOC_VERTEX_POSITION = 0;
  RL_SHADER_LOC_VERTEX_TEXCOORD01 = 1;
  RL_SHADER_LOC_VERTEX_TEXCOORD02 = 2;
  RL_SHADER_LOC_VERTEX_NORMAL = 3;
  RL_SHADER_LOC_VERTEX_TANGENT = 4;
  RL_SHADER_LOC_VERTEX_COLOR = 5;
  RL_SHADER_LOC_MATRIX_MVP = 6;
  RL_SHADER_LOC_MATRIX_VIEW = 7;
  RL_SHADER_LOC_MATRIX_PROJECTION = 8;
  RL_SHADER_LOC_MATRIX_MODEL = 9;
  RL_SHADER_LOC_MATRIX_NORMAL = 10;
  RL_SHADER_LOC_VECTOR_VIEW = 11;
  RL_SHADER_LOC_COLOR_DIFFUSE = 12;
  RL_SHADER_LOC_COLOR_SPECULAR = 13;
  RL_SHADER_LOC_COLOR_AMBIENT = 14;
  RL_SHADER_LOC_MAP_ALBEDO = 15;
  RL_SHADER_LOC_MAP_METALNESS = 16;
  RL_SHADER_LOC_MAP_NORMAL = 17;
  RL_SHADER_LOC_MAP_ROUGHNESS = 18;
  RL_SHADER_LOC_MAP_OCCLUSION = 19;
  RL_SHADER_LOC_MAP_EMISSION = 20;
  RL_SHADER_LOC_MAP_HEIGHT = 21;
  RL_SHADER_LOC_MAP_CUBEMAP = 22;
  RL_SHADER_LOC_MAP_IRRADIANCE = 23;
  RL_SHADER_LOC_MAP_PREFILTER = 24;
  RL_SHADER_LOC_MAP_BRDF = 25;
  RL_SHADER_LOC_MAP_SPECULAR = RL_SHADER_LOC_MAP_METALNESS;
  RL_SHADER_LOC_MAP_DIFFUSE = RL_SHADER_LOC_MAP_ALBEDO;

type
  rlShaderUniformDataType = Integer;
  PrlShaderUniformDataType = ^rlShaderUniformDataType;

const
  RL_SHADER_UNIFORM_FLOAT = 0;
  RL_SHADER_UNIFORM_VEC2 = 1;
  RL_SHADER_UNIFORM_VEC3 = 2;
  RL_SHADER_UNIFORM_VEC4 = 3;
  RL_SHADER_UNIFORM_INT = 4;
  RL_SHADER_UNIFORM_IVEC2 = 5;
  RL_SHADER_UNIFORM_IVEC3 = 6;
  RL_SHADER_UNIFORM_IVEC4 = 7;
  RL_SHADER_UNIFORM_SAMPLER2D = 8;

type
  rlShaderAttributeDataType = Integer;
  PrlShaderAttributeDataType = ^rlShaderAttributeDataType;

const
  RL_SHADER_ATTRIB_FLOAT = 0;
  RL_SHADER_ATTRIB_VEC2 = 1;
  RL_SHADER_ATTRIB_VEC3 = 2;
  RL_SHADER_ATTRIB_VEC4 = 3;

type
  rlFramebufferAttachType = Integer;
  PrlFramebufferAttachType = ^rlFramebufferAttachType;

const
  RL_ATTACHMENT_COLOR_CHANNEL0 = 0;
  RL_ATTACHMENT_COLOR_CHANNEL1 = 1;
  RL_ATTACHMENT_COLOR_CHANNEL2 = 2;
  RL_ATTACHMENT_COLOR_CHANNEL3 = 3;
  RL_ATTACHMENT_COLOR_CHANNEL4 = 4;
  RL_ATTACHMENT_COLOR_CHANNEL5 = 5;
  RL_ATTACHMENT_COLOR_CHANNEL6 = 6;
  RL_ATTACHMENT_COLOR_CHANNEL7 = 7;
  RL_ATTACHMENT_DEPTH = 100;
  RL_ATTACHMENT_STENCIL = 200;

type
  rlFramebufferAttachTextureType = Integer;
  PrlFramebufferAttachTextureType = ^rlFramebufferAttachTextureType;

const
  RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0;
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1;
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2;
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3;
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4;
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5;
  RL_ATTACHMENT_TEXTURE2D = 100;
  RL_ATTACHMENT_RENDERBUFFER = 200;

type
  rlCullMode = Integer;
  PrlCullMode = ^rlCullMode;

const
  RL_CULL_FACE_FRONT = 0;
  RL_CULL_FACE_BACK = 1;

type
  GuiState = Integer;
  PGuiState = ^GuiState;

const
  STATE_NORMAL = 0;
  STATE_FOCUSED = 1;
  STATE_PRESSED = 2;
  STATE_DISABLED = 3;

type
  GuiTextAlignment = Integer;
  PGuiTextAlignment = ^GuiTextAlignment;

const
  TEXT_ALIGN_LEFT = 0;
  TEXT_ALIGN_CENTER = 1;
  TEXT_ALIGN_RIGHT = 2;

type
  GuiControl = Integer;
  PGuiControl = ^GuiControl;

const
  DEFAULT = 0;
  LABEL_ = 1;
  BUTTON = 2;
  TOGGLE = 3;
  SLIDER = 4;
  PROGRESSBAR = 5;
  CHECKBOX = 6;
  COMBOBOX = 7;
  DROPDOWNBOX = 8;
  TEXTBOX = 9;
  VALUEBOX = 10;
  SPINNER = 11;
  LISTVIEW = 12;
  COLORPICKER = 13;
  SCROLLBAR = 14;
  STATUSBAR = 15;

type
  GuiControlProperty = Integer;
  PGuiControlProperty = ^GuiControlProperty;

const
  BORDER_COLOR_NORMAL = 0;
  BASE_COLOR_NORMAL = 1;
  TEXT_COLOR_NORMAL = 2;
  BORDER_COLOR_FOCUSED = 3;
  BASE_COLOR_FOCUSED = 4;
  TEXT_COLOR_FOCUSED = 5;
  BORDER_COLOR_PRESSED = 6;
  BASE_COLOR_PRESSED = 7;
  TEXT_COLOR_PRESSED = 8;
  BORDER_COLOR_DISABLED = 9;
  BASE_COLOR_DISABLED = 10;
  TEXT_COLOR_DISABLED = 11;
  BORDER_WIDTH = 12;
  TEXT_PADDING = 13;
  TEXT_ALIGNMENT = 14;
  RESERVED = 15;

type
  GuiDefaultProperty = Integer;
  PGuiDefaultProperty = ^GuiDefaultProperty;

const
  TEXT_SIZE = 16;
  TEXT_SPACING = 17;
  LINE_COLOR = 18;
  BACKGROUND_COLOR = 19;

type
  GuiToggleProperty = Integer;
  PGuiToggleProperty = ^GuiToggleProperty;

const
  GROUP_PADDING = 16;

type
  GuiSliderProperty = Integer;
  PGuiSliderProperty = ^GuiSliderProperty;

const
  SLIDER_WIDTH = 16;
  SLIDER_PADDING = 17;

type
  GuiProgressBarProperty = Integer;
  PGuiProgressBarProperty = ^GuiProgressBarProperty;

const
  PROGRESS_PADDING = 16;

type
  GuiScrollBarProperty = Integer;
  PGuiScrollBarProperty = ^GuiScrollBarProperty;

const
  ARROWS_SIZE = 16;
  ARROWS_VISIBLE = 17;
  SCROLL_SLIDER_PADDING = 18;
  SCROLL_SLIDER_SIZE = 19;
  SCROLL_PADDING = 20;
  SCROLL_SPEED = 21;

type
  GuiCheckBoxProperty = Integer;
  PGuiCheckBoxProperty = ^GuiCheckBoxProperty;

const
  CHECK_PADDING = 16;

type
  GuiComboBoxProperty = Integer;
  PGuiComboBoxProperty = ^GuiComboBoxProperty;

const
  COMBO_BUTTON_WIDTH = 16;
  COMBO_BUTTON_SPACING = 17;

type
  GuiDropdownBoxProperty = Integer;
  PGuiDropdownBoxProperty = ^GuiDropdownBoxProperty;

const
  ARROW_PADDING = 16;
  DROPDOWN_ITEMS_SPACING = 17;

type
  GuiTextBoxProperty = Integer;
  PGuiTextBoxProperty = ^GuiTextBoxProperty;

const
  TEXT_INNER_PADDING = 16;
  TEXT_LINES_SPACING = 17;

type
  GuiSpinnerProperty = Integer;
  PGuiSpinnerProperty = ^GuiSpinnerProperty;

const
  SPIN_BUTTON_WIDTH = 16;
  SPIN_BUTTON_SPACING = 17;

type
  GuiListViewProperty = Integer;
  PGuiListViewProperty = ^GuiListViewProperty;

const
  LIST_ITEMS_HEIGHT = 16;
  LIST_ITEMS_SPACING = 17;
  SCROLLBAR_WIDTH = 18;
  SCROLLBAR_SIDE = 19;

type
  GuiColorPickerProperty = Integer;
  PGuiColorPickerProperty = ^GuiColorPickerProperty;

const
  COLOR_SELECTOR_SIZE = 16;
  HUEBAR_WIDTH = 17;
  HUEBAR_PADDING = 18;
  HUEBAR_SELECTOR_HEIGHT = 19;
  HUEBAR_SELECTOR_OVERFLOW = 20;

type
  GuiIconName = Integer;
  PGuiIconName = ^GuiIconName;

const
  ICON_NONE = 0;
  ICON_FOLDER_FILE_OPEN = 1;
  ICON_FILE_SAVE_CLASSIC = 2;
  ICON_FOLDER_OPEN = 3;
  ICON_FOLDER_SAVE = 4;
  ICON_FILE_OPEN = 5;
  ICON_FILE_SAVE = 6;
  ICON_FILE_EXPORT = 7;
  ICON_FILE_ADD = 8;
  ICON_FILE_DELETE = 9;
  ICON_FILETYPE_TEXT = 10;
  ICON_FILETYPE_AUDIO = 11;
  ICON_FILETYPE_IMAGE = 12;
  ICON_FILETYPE_PLAY = 13;
  ICON_FILETYPE_VIDEO = 14;
  ICON_FILETYPE_INFO = 15;
  ICON_FILE_COPY = 16;
  ICON_FILE_CUT = 17;
  ICON_FILE_PASTE = 18;
  ICON_CURSOR_HAND = 19;
  ICON_CURSOR_POINTER = 20;
  ICON_CURSOR_CLASSIC = 21;
  ICON_PENCIL = 22;
  ICON_PENCIL_BIG = 23;
  ICON_BRUSH_CLASSIC = 24;
  ICON_BRUSH_PAINTER = 25;
  ICON_WATER_DROP = 26;
  ICON_COLOR_PICKER = 27;
  ICON_RUBBER = 28;
  ICON_COLOR_BUCKET = 29;
  ICON_TEXT_T = 30;
  ICON_TEXT_A = 31;
  ICON_SCALE = 32;
  ICON_RESIZE = 33;
  ICON_FILTER_POINT = 34;
  ICON_FILTER_BILINEAR = 35;
  ICON_CROP = 36;
  ICON_CROP_ALPHA = 37;
  ICON_SQUARE_TOGGLE = 38;
  ICON_SYMMETRY = 39;
  ICON_SYMMETRY_HORIZONTAL = 40;
  ICON_SYMMETRY_VERTICAL = 41;
  ICON_LENS = 42;
  ICON_LENS_BIG = 43;
  ICON_EYE_ON = 44;
  ICON_EYE_OFF = 45;
  ICON_FILTER_TOP = 46;
  ICON_FILTER = 47;
  ICON_TARGET_POINT = 48;
  ICON_TARGET_SMALL = 49;
  ICON_TARGET_BIG = 50;
  ICON_TARGET_MOVE = 51;
  ICON_CURSOR_MOVE = 52;
  ICON_CURSOR_SCALE = 53;
  ICON_CURSOR_SCALE_RIGHT = 54;
  ICON_CURSOR_SCALE_LEFT = 55;
  ICON_UNDO = 56;
  ICON_REDO = 57;
  ICON_REREDO = 58;
  ICON_MUTATE = 59;
  ICON_ROTATE = 60;
  ICON_REPEAT = 61;
  ICON_SHUFFLE = 62;
  ICON_EMPTYBOX = 63;
  ICON_TARGET = 64;
  ICON_TARGET_SMALL_FILL = 65;
  ICON_TARGET_BIG_FILL = 66;
  ICON_TARGET_MOVE_FILL = 67;
  ICON_CURSOR_MOVE_FILL = 68;
  ICON_CURSOR_SCALE_FILL = 69;
  ICON_CURSOR_SCALE_RIGHT_FILL = 70;
  ICON_CURSOR_SCALE_LEFT_FILL = 71;
  ICON_UNDO_FILL = 72;
  ICON_REDO_FILL = 73;
  ICON_REREDO_FILL = 74;
  ICON_MUTATE_FILL = 75;
  ICON_ROTATE_FILL = 76;
  ICON_REPEAT_FILL = 77;
  ICON_SHUFFLE_FILL = 78;
  ICON_EMPTYBOX_SMALL = 79;
  ICON_BOX = 80;
  ICON_BOX_TOP = 81;
  ICON_BOX_TOP_RIGHT = 82;
  ICON_BOX_RIGHT = 83;
  ICON_BOX_BOTTOM_RIGHT = 84;
  ICON_BOX_BOTTOM = 85;
  ICON_BOX_BOTTOM_LEFT = 86;
  ICON_BOX_LEFT = 87;
  ICON_BOX_TOP_LEFT = 88;
  ICON_BOX_CENTER = 89;
  ICON_BOX_CIRCLE_MASK = 90;
  ICON_POT = 91;
  ICON_ALPHA_MULTIPLY = 92;
  ICON_ALPHA_CLEAR = 93;
  ICON_DITHERING = 94;
  ICON_MIPMAPS = 95;
  ICON_BOX_GRID = 96;
  ICON_GRID = 97;
  ICON_BOX_CORNERS_SMALL = 98;
  ICON_BOX_CORNERS_BIG = 99;
  ICON_FOUR_BOXES = 100;
  ICON_GRID_FILL = 101;
  ICON_BOX_MULTISIZE = 102;
  ICON_ZOOM_SMALL = 103;
  ICON_ZOOM_MEDIUM = 104;
  ICON_ZOOM_BIG = 105;
  ICON_ZOOM_ALL = 106;
  ICON_ZOOM_CENTER = 107;
  ICON_BOX_DOTS_SMALL = 108;
  ICON_BOX_DOTS_BIG = 109;
  ICON_BOX_CONCENTRIC = 110;
  ICON_BOX_GRID_BIG = 111;
  ICON_OK_TICK = 112;
  ICON_CROSS = 113;
  ICON_ARROW_LEFT = 114;
  ICON_ARROW_RIGHT = 115;
  ICON_ARROW_DOWN = 116;
  ICON_ARROW_UP = 117;
  ICON_ARROW_LEFT_FILL = 118;
  ICON_ARROW_RIGHT_FILL = 119;
  ICON_ARROW_DOWN_FILL = 120;
  ICON_ARROW_UP_FILL = 121;
  ICON_AUDIO = 122;
  ICON_FX = 123;
  ICON_WAVE = 124;
  ICON_WAVE_SINUS = 125;
  ICON_WAVE_SQUARE = 126;
  ICON_WAVE_TRIANGULAR = 127;
  ICON_CROSS_SMALL = 128;
  ICON_PLAYER_PREVIOUS = 129;
  ICON_PLAYER_PLAY_BACK = 130;
  ICON_PLAYER_PLAY = 131;
  ICON_PLAYER_PAUSE = 132;
  ICON_PLAYER_STOP = 133;
  ICON_PLAYER_NEXT = 134;
  ICON_PLAYER_RECORD = 135;
  ICON_MAGNET = 136;
  ICON_LOCK_CLOSE = 137;
  ICON_LOCK_OPEN = 138;
  ICON_CLOCK = 139;
  ICON_TOOLS = 140;
  ICON_GEAR = 141;
  ICON_GEAR_BIG = 142;
  ICON_BIN = 143;
  ICON_HAND_POINTER = 144;
  ICON_LASER = 145;
  ICON_COIN = 146;
  ICON_EXPLOSION = 147;
  ICON_1UP = 148;
  ICON_PLAYER = 149;
  ICON_PLAYER_JUMP = 150;
  ICON_KEY = 151;
  ICON_DEMON = 152;
  ICON_TEXT_POPUP = 153;
  ICON_GEAR_EX = 154;
  ICON_CRACK = 155;
  ICON_CRACK_POINTS = 156;
  ICON_STAR = 157;
  ICON_DOOR = 158;
  ICON_EXIT = 159;
  ICON_MODE_2D = 160;
  ICON_MODE_3D = 161;
  ICON_CUBE = 162;
  ICON_CUBE_FACE_TOP = 163;
  ICON_CUBE_FACE_LEFT = 164;
  ICON_CUBE_FACE_FRONT = 165;
  ICON_CUBE_FACE_BOTTOM = 166;
  ICON_CUBE_FACE_RIGHT = 167;
  ICON_CUBE_FACE_BACK = 168;
  ICON_CAMERA = 169;
  ICON_SPECIAL = 170;
  ICON_LINK_NET = 171;
  ICON_LINK_BOXES = 172;
  ICON_LINK_MULTI = 173;
  ICON_LINK = 174;
  ICON_LINK_BROKE = 175;
  ICON_TEXT_NOTES = 176;
  ICON_NOTEBOOK = 177;
  ICON_SUITCASE = 178;
  ICON_SUITCASE_ZIP = 179;
  ICON_MAILBOX = 180;
  ICON_MONITOR = 181;
  ICON_PRINTER = 182;
  ICON_PHOTO_CAMERA = 183;
  ICON_PHOTO_CAMERA_FLASH = 184;
  ICON_HOUSE = 185;
  ICON_HEART = 186;
  ICON_CORNER = 187;
  ICON_VERTICAL_BARS = 188;
  ICON_VERTICAL_BARS_FILL = 189;
  ICON_LIFE_BARS = 190;
  ICON_INFO = 191;
  ICON_CROSSLINE = 192;
  ICON_HELP = 193;
  ICON_FILETYPE_ALPHA = 194;
  ICON_FILETYPE_HOME = 195;
  ICON_LAYERS_VISIBLE = 196;
  ICON_LAYERS = 197;
  ICON_WINDOW = 198;
  ICON_HIDPI = 199;
  ICON_FILETYPE_BINARY = 200;
  ICON_HEX = 201;
  ICON_SHIELD = 202;
  ICON_FILE_NEW = 203;
  ICON_FOLDER_ADD = 204;
  ICON_ALARM = 205;
  ICON_CPU = 206;
  ICON_ROM = 207;
  ICON_STEP_OVER = 208;
  ICON_STEP_INTO = 209;
  ICON_STEP_OUT = 210;
  ICON_RESTART = 211;
  ICON_BREAKPOINT_ON = 212;
  ICON_BREAKPOINT_OFF = 213;
  ICON_BURGER_MENU = 214;
  ICON_CASE_SENSITIVE = 215;
  ICON_REG_EXP = 216;
  ICON_FOLDER = 217;
  ICON_FILE = 218;
  ICON_219 = 219;
  ICON_220 = 220;
  ICON_221 = 221;
  ICON_222 = 222;
  ICON_223 = 223;
  ICON_224 = 224;
  ICON_225 = 225;
  ICON_226 = 226;
  ICON_227 = 227;
  ICON_228 = 228;
  ICON_229 = 229;
  ICON_230 = 230;
  ICON_231 = 231;
  ICON_232 = 232;
  ICON_233 = 233;
  ICON_234 = 234;
  ICON_235 = 235;
  ICON_236 = 236;
  ICON_237 = 237;
  ICON_238 = 238;
  ICON_239 = 239;
  ICON_240 = 240;
  ICON_241 = 241;
  ICON_242 = 242;
  ICON_243 = 243;
  ICON_244 = 244;
  ICON_245 = 245;
  ICON_246 = 246;
  ICON_247 = 247;
  ICON_248 = 248;
  ICON_249 = 249;
  ICON_250 = 250;
  ICON_251 = 251;
  ICON_252 = 252;
  ICON_253 = 253;
  ICON_254 = 254;
  ICON_255 = 255;

type
  PhysicsShapeType = Integer;
  PPhysicsShapeType = ^PhysicsShapeType;

const
  PHYSICS_CIRCLE = 0;
  PHYSICS_POLYGON = 1;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PUInt8 = ^UInt8;
  PPointer = ^Pointer;
  PVector2 = ^Vector2;
  PVector3 = ^Vector3;
  PVector4 = ^Vector4;
  PMatrix = ^Matrix;
  PColor = ^Color;
  PRectangle = ^Rectangle;
  PPRectangle = ^PRectangle;
  PImage = ^Image;
  PTexture = ^Texture;
  PRenderTexture = ^RenderTexture;
  PNPatchInfo = ^NPatchInfo;
  PGlyphInfo = ^GlyphInfo;
  PFont = ^Font;
  PCamera3D = ^Camera3D;
  PCamera2D = ^Camera2D;
  PMesh = ^Mesh;
  PShader = ^Shader;
  PMaterialMap = ^MaterialMap;
  PMaterial = ^Material;
  PTransform = ^Transform;
  PPTransform = ^PTransform;
  PBoneInfo = ^BoneInfo;
  PModel = ^Model;
  PModelAnimation = ^ModelAnimation;
  PRay = ^Ray;
  PRayCollision = ^RayCollision;
  PBoundingBox = ^BoundingBox;
  PWave = ^Wave;
  PAudioStream = ^AudioStream;
  PSound = ^Sound;
  PMusic = ^Music;
  PVrDeviceInfo = ^VrDeviceInfo;
  PVrStereoConfig = ^VrStereoConfig;
  PFilePathList = ^FilePathList;
  Pfloat3 = ^float3;
  Pfloat16 = ^float16;
  PrlVertexBuffer = ^rlVertexBuffer;
  PrlDrawCall = ^rlDrawCall;
  PrlRenderBatch = ^rlRenderBatch;
  PGuiStyleProp = ^GuiStyleProp;
  PMatrix2x2 = ^Matrix2x2;
  PPhysicsVertexData = ^PhysicsVertexData;
  PPhysicsShape = ^PhysicsShape;
  PPhysicsBodyData = ^PhysicsBodyData;
  PPhysicsManifoldData = ^PhysicsManifoldData;
  Pplm_packet_t = ^plm_packet_t;
  Pplm_plane_t = ^plm_plane_t;
  Pplm_frame_t = ^plm_frame_t;
  Pplm_samples_t = ^plm_samples_t;

  Vector2 = record
    x: Single;
    y: Single;
  end;

  Vector3 = record
    x: Single;
    y: Single;
    z: Single;
  end;

  Vector4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  Quaternion = Vector4;

  Matrix = record
    m0: Single;
    m4: Single;
    m8: Single;
    m12: Single;
    m1: Single;
    m5: Single;
    m9: Single;
    m13: Single;
    m2: Single;
    m6: Single;
    m10: Single;
    m14: Single;
    m3: Single;
    m7: Single;
    m11: Single;
    m15: Single;
  end;

  Color = record
    r: Byte;
    g: Byte;
    b: Byte;
    a: Byte;
  end;

  Rectangle = record
    x: Single;
    y: Single;
    width: Single;
    height: Single;
  end;

  Image = record
    data: Pointer;
    width: Integer;
    height: Integer;
    mipmaps: Integer;
    format: Integer;
  end;

  Texture = record
    id: Cardinal;
    width: Integer;
    height: Integer;
    mipmaps: Integer;
    format: Integer;
  end;

  Texture2D = Texture;
  PTexture2D = ^Texture2D;
  TextureCubemap = Texture;

  RenderTexture = record
    id: Cardinal;
    texture: Texture;
    depth: Texture;
  end;

  RenderTexture2D = RenderTexture;

  NPatchInfo = record
    source: Rectangle;
    left: Integer;
    top: Integer;
    right: Integer;
    bottom: Integer;
    layout: Integer;
  end;

  GlyphInfo = record
    value: Integer;
    offsetX: Integer;
    offsetY: Integer;
    advanceX: Integer;
    image: Image;
  end;

  Font = record
    baseSize: Integer;
    glyphCount: Integer;
    glyphPadding: Integer;
    texture: Texture2D;
    recs: PRectangle;
    glyphs: PGlyphInfo;
  end;

  Camera3D = record
    position: Vector3;
    target: Vector3;
    up: Vector3;
    fovy: Single;
    projection: Integer;
  end;

  Camera = Camera3D;
  PCamera = ^Camera;

  Camera2D = record
    offset: Vector2;
    target: Vector2;
    rotation: Single;
    zoom: Single;
  end;

  Mesh = record
    vertexCount: Integer;
    triangleCount: Integer;
    vertices: PSingle;
    texcoords: PSingle;
    texcoords2: PSingle;
    normals: PSingle;
    tangents: PSingle;
    colors: PByte;
    indices: PWord;
    animVertices: PSingle;
    animNormals: PSingle;
    boneIds: PByte;
    boneWeights: PSingle;
    vaoId: Cardinal;
    vboId: PCardinal;
  end;

  Shader = record
    id: Cardinal;
    locs: PInteger;
  end;

  MaterialMap = record
    texture: Texture2D;
    color: Color;
    value: Single;
  end;

  Material = record
    shader: Shader;
    maps: PMaterialMap;
    params: array [0..3] of Single;
  end;

  Transform = record
    translation: Vector3;
    rotation: Quaternion;
    scale: Vector3;
  end;

  BoneInfo = record
    name: array [0..31] of UTF8Char;
    parent: Integer;
  end;

  Model = record
    transform: Matrix;
    meshCount: Integer;
    materialCount: Integer;
    meshes: PMesh;
    materials: PMaterial;
    meshMaterial: PInteger;
    boneCount: Integer;
    bones: PBoneInfo;
    bindPose: PTransform;
  end;

  ModelAnimation = record
    boneCount: Integer;
    frameCount: Integer;
    bones: PBoneInfo;
    framePoses: PPTransform;
  end;

  Ray = record
    position: Vector3;
    direction: Vector3;
  end;

  RayCollision = record
    hit: Boolean;
    distance: Single;
    point: Vector3;
    normal: Vector3;
  end;

  BoundingBox = record
    min: Vector3;
    max: Vector3;
  end;

  Wave = record
    frameCount: Cardinal;
    sampleRate: Cardinal;
    sampleSize: Cardinal;
    channels: Cardinal;
    data: Pointer;
  end;

  PrAudioBuffer = Pointer;
  PPrAudioBuffer = ^PrAudioBuffer;
  PrAudioProcessor = Pointer;
  PPrAudioProcessor = ^PrAudioProcessor;

  AudioStream = record
    buffer: PrAudioBuffer;
    processor: PrAudioProcessor;
    sampleRate: Cardinal;
    sampleSize: Cardinal;
    channels: Cardinal;
  end;

  Sound = record
    stream: AudioStream;
    frameCount: Cardinal;
  end;

  Music = record
    stream: AudioStream;
    frameCount: Cardinal;
    looping: Boolean;
    ctxType: Integer;
    ctxData: Pointer;
  end;

  VrDeviceInfo = record
    hResolution: Integer;
    vResolution: Integer;
    hScreenSize: Single;
    vScreenSize: Single;
    vScreenCenter: Single;
    eyeToScreenDistance: Single;
    lensSeparationDistance: Single;
    interpupillaryDistance: Single;
    lensDistortionValues: array [0..3] of Single;
    chromaAbCorrection: array [0..3] of Single;
  end;

  VrStereoConfig = record
    projection: array [0..1] of Matrix;
    viewOffset: array [0..1] of Matrix;
    leftLensCenter: array [0..1] of Single;
    rightLensCenter: array [0..1] of Single;
    leftScreenCenter: array [0..1] of Single;
    rightScreenCenter: array [0..1] of Single;
    scale: array [0..1] of Single;
    scaleIn: array [0..1] of Single;
  end;

  FilePathList = record
    capacity: Cardinal;
    count: Cardinal;
    paths: PPUTF8Char;
  end;

  TraceLogCallback = procedure(logLevel: Integer; const text: PUTF8Char; args: Pointer); cdecl;

  LoadFileDataCallback = function(const fileName: PUTF8Char; bytesRead: PCardinal): PByte; cdecl;

  SaveFileDataCallback = function(const fileName: PUTF8Char; data: Pointer; bytesToWrite: Cardinal): Boolean; cdecl;

  LoadFileTextCallback = function(const fileName: PUTF8Char): PUTF8Char; cdecl;

  SaveFileTextCallback = function(const fileName: PUTF8Char; text: PUTF8Char): Boolean; cdecl;

  AudioCallback = procedure(bufferData: Pointer; frames: Cardinal); cdecl;

  float3 = record
    v: array [0..2] of Single;
  end;

  float16 = record
    v: array [0..15] of Single;
  end;

  rlVertexBuffer = record
    elementCount: Integer;
    vertices: PSingle;
    texcoords: PSingle;
    colors: PByte;
    indices: PCardinal;
    vaoId: Cardinal;
    vboId: array [0..3] of Cardinal;
  end;

  rlDrawCall = record
    mode: Integer;
    vertexCount: Integer;
    vertexAlignment: Integer;
    textureId: Cardinal;
  end;

  rlRenderBatch = record
    bufferCount: Integer;
    currentBuffer: Integer;
    vertexBuffer: PrlVertexBuffer;
    draws: PrlDrawCall;
    drawCounter: Integer;
    currentDepth: Single;
  end;

  GuiStyleProp = record
    controlId: Word;
    propertyId: Word;
    propertyValue: Cardinal;
  end;

  PhysicsBody = PPhysicsBodyData;

  Matrix2x2 = record
    m00: Single;
    m01: Single;
    m10: Single;
    m11: Single;
  end;

  PhysicsVertexData = record
    vertexCount: Cardinal;
    positions: array [0..23] of Vector2;
    normals: array [0..23] of Vector2;
  end;

  PhysicsShape = record
    type_: PhysicsShapeType;
    body: PhysicsBody;
    vertexData: PhysicsVertexData;
    radius: Single;
    transform: Matrix2x2;
  end;

  PhysicsBodyData = record
    id: Cardinal;
    enabled: Boolean;
    position: Vector2;
    velocity: Vector2;
    force: Vector2;
    angularVelocity: Single;
    torque: Single;
    orient: Single;
    inertia: Single;
    inverseInertia: Single;
    mass: Single;
    inverseMass: Single;
    staticFriction: Single;
    dynamicFriction: Single;
    restitution: Single;
    useGravity: Boolean;
    isGrounded: Boolean;
    freezeOrient: Boolean;
    shape: PhysicsShape;
  end;

  PhysicsManifoldData = record
    id: Cardinal;
    bodyA: PhysicsBody;
    bodyB: PhysicsBody;
    penetration: Single;
    normal: Vector2;
    contacts: array [0..1] of Vector2;
    contactsCount: Cardinal;
    restitution: Single;
    dynamicFriction: Single;
    staticFriction: Single;
  end;

  PhysicsManifold = PPhysicsManifoldData;
  Pplm_t = Pointer;
  PPplm_t = ^Pplm_t;
  Pplm_buffer_t = Pointer;
  PPplm_buffer_t = ^Pplm_buffer_t;
  Pplm_demux_t = Pointer;
  PPplm_demux_t = ^Pplm_demux_t;
  Pplm_video_t = Pointer;
  PPplm_video_t = ^Pplm_video_t;
  Pplm_audio_t = Pointer;
  PPplm_audio_t = ^Pplm_audio_t;

  plm_packet_t = record
    type_: Integer;
    pts: Double;
    length: NativeUInt;
    data: PUInt8;
  end;

  plm_plane_t = record
    width: Cardinal;
    height: Cardinal;
    data: PUInt8;
  end;

  plm_frame_t = record
    time: Double;
    width: Cardinal;
    height: Cardinal;
    y: plm_plane_t;
    cr: plm_plane_t;
    cb: plm_plane_t;
  end;

  plm_video_decode_callback = procedure(self: Pplm_t; frame: Pplm_frame_t; user: Pointer); cdecl;

  plm_samples_t = record
    time: Double;
    count: Cardinal;
    interleaved: array [0..2303] of Single;
  end;

  plm_audio_decode_callback = procedure(self: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;

  plm_buffer_load_callback = procedure(self: Pplm_buffer_t; user: Pointer); cdecl;

const
  PLM_DEMUX_PACKET_PRIVATE: Integer = $BD;
  PLM_DEMUX_PACKET_AUDIO_1: Integer = $C0;
  PLM_DEMUX_PACKET_AUDIO_2: Integer = $C1;
  PLM_DEMUX_PACKET_AUDIO_3: Integer = $C2;
  PLM_DEMUX_PACKET_AUDIO_4: Integer = $C2;
  PLM_DEMUX_PACKET_VIDEO_1: Integer = $E0;

{$REGION ' Common Colors '}
const
  ALICEBLUE           : Color = (R:$F0; G:$F8; B:$FF; A:$FF);
  ANTIQUEWHITE        : Color = (R:$FA; G:$EB; B:$D7; A:$FF);
  AQUA                : Color = (R:$00; G:$FF; B:$FF; A:$FF);
  AQUAMARINE          : Color = (R:$7F; G:$FF; B:$D4; A:$FF);
  AZURE               : Color = (R:$F0; G:$FF; B:$FF; A:$FF);
  BEIGE               : Color = (R:$F5; G:$F5; B:$DC; A:$FF);
  BISQUE              : Color = (R:$FF; G:$E4; B:$C4; A:$FF);
  BLACK               : Color = (R:$00; G:$00; B:$00; A:$FF);
  BLANCHEDALMOND      : Color = (R:$FF; G:$EB; B:$CD; A:$FF);
  BLUE                : Color = (R:$00; G:$00; B:$FF; A:$FF);
  BLUEVIOLET          : Color = (R:$8A; G:$2B; B:$E2; A:$FF);
  BROWN               : Color = (R:$A5; G:$2A; B:$2A; A:$FF);
  BURLYWOOD           : Color = (R:$DE; G:$B8; B:$87; A:$FF);
  CADETBLUE           : Color = (R:$5F; G:$9E; B:$A0; A:$FF);
  CHARTREUSE          : Color = (R:$7F; G:$FF; B:$00; A:$FF);
  CHOCOLATE           : Color = (R:$D2; G:$69; B:$1E; A:$FF);
  CORAL               : Color = (R:$FF; G:$7F; B:$50; A:$FF);
  CORNFLOWERBLUE      : Color = (R:$64; G:$95; B:$ED; A:$FF);
  CORNSILK            : Color = (R:$FF; G:$F8; B:$DC; A:$FF);
  CRIMSON             : Color = (R:$DC; G:$14; B:$3C; A:$FF);
  CYAN                : Color = (R:$00; G:$FF; B:$FF; A:$FF);
  DARKBLUE            : Color = (R:$00; G:$00; B:$8B; A:$FF);
  DARKCYAN            : Color = (R:$00; G:$8B; B:$8B; A:$FF);
  DARKGOLDENROD       : Color = (R:$B8; G:$86; B:$0B; A:$FF);
  DARKGRAY            : Color = (R:$A9; G:$A9; B:$A9; A:$FF);
  DARKGREEN           : Color = (R:$00; G:$64; B:$00; A:$FF);
  DARKGREY            : Color = (R:$A9; G:$A9; B:$A9; A:$FF);
  DARKKHAKI           : Color = (R:$BD; G:$B7; B:$6B; A:$FF);
  DARKMAGENTA         : Color = (R:$8B; G:$00; B:$8B; A:$FF);
  DARKOLIVEGREEN      : Color = (R:$55; G:$6B; B:$2F; A:$FF);
  DARKORANGE          : Color = (R:$FF; G:$8C; B:$00; A:$FF);
  DARKORCHID          : Color = (R:$99; G:$32; B:$CC; A:$FF);
  DARKRED             : Color = (R:$8B; G:$00; B:$00; A:$FF);
  DARKSALMON          : Color = (R:$E9; G:$96; B:$7A; A:$FF);
  DARKSEAGREEN        : Color = (R:$8F; G:$BC; B:$8F; A:$FF);
  DARKSLATEBLUE       : Color = (R:$48; G:$3D; B:$8B; A:$FF);
  DARKSLATEGRAY       : Color = (R:$2F; G:$4F; B:$4F; A:$FF);
  DARKTURQUOISE       : Color = (R:$00; G:$CE; B:$D1; A:$FF);
  DARKVIOLET          : Color = (R:$94; G:$00; B:$D3; A:$FF);
  DEEPPINK            : Color = (R:$FF; G:$14; B:$93; A:$FF);
  DEEPSKYBLUE         : Color = (R:$00; G:$BF; B:$FF; A:$FF);
  DIMGRAY             : Color = (R:$69; G:$69; B:$69; A:$FF);
  DODGERBLUE          : Color = (R:$1E; G:$90; B:$FF; A:$FF);
  FIREBRICK           : Color = (R:$B2; G:$22; B:$22; A:$FF);
  FLORALWHITE         : Color = (R:$FF; G:$FA; B:$F0; A:$FF);
  FORESTGREEN         : Color = (R:$22; G:$8B; B:$22; A:$FF);
  FUCHSIA             : Color = (R:$FF; G:$00; B:$FF; A:$FF);
  GAINSBORO           : Color = (R:$DC; G:$DC; B:$DC; A:$FF);
  GHOSTWHITE          : Color = (R:$F8; G:$F8; B:$FF; A:$FF);
  GOLD                : Color = (R:$FF; G:$D7; B:$00; A:$FF);
  GOLDENROD           : Color = (R:$DA; G:$A5; B:$20; A:$FF);
  GRAY                : Color = (R:$80; G:$80; B:$80; A:$FF);
  GREEN               : Color = (R:$00; G:$80; B:$00; A:$FF);
  GREENYELLOW         : Color = (R:$AD; G:$FF; B:$2F; A:$FF);
  GREY                : Color = (R:$80; G:$80; B:$80; A:$FF);
  HONEYDEW            : Color = (R:$F0; G:$FF; B:$F0; A:$FF);
  HOTPINK             : Color = (R:$FF; G:$69; B:$B4; A:$FF);
  INDIANRED           : Color = (R:$CD; G:$5C; B:$5C; A:$FF);
  INDIGO              : Color = (R:$4B; G:$00; B:$82; A:$FF);
  IVORY               : Color = (R:$FF; G:$FF; B:$F0; A:$FF);
  KHAKI               : Color = (R:$F0; G:$E6; B:$8C; A:$FF);
  LAVENDER            : Color = (R:$E6; G:$E6; B:$FA; A:$FF);
  LAVENDERBLUSH       : Color = (R:$FF; G:$F0; B:$F5; A:$FF);
  LAWNGREEN           : Color = (R:$7C; G:$FC; B:$00; A:$FF);
  LEMONCHIFFON        : Color = (R:$FF; G:$FA; B:$CD; A:$FF);
  LIGHTBLUE           : Color = (R:$AD; G:$D8; B:$E6; A:$FF);
  LIGHTCORAL          : Color = (R:$F0; G:$80; B:$80; A:$FF);
  LIGHTCYAN           : Color = (R:$E0; G:$FF; B:$FF; A:$FF);
  LIGHTGOLDENRODYELLOW: Color = (R:$FA; G:$FA; B:$D2; A:$FF);
  LIGHTGRAY           : Color = (R:$D3; G:$D3; B:$D3; A:$FF);
  LIGHTGREEN          : Color = (R:$90; G:$EE; B:$90; A:$FF);
  LIGHTGREY           : Color = (R:$D3; G:$D3; B:$D3; A:$FF);
  LIGHTPINK           : Color = (R:$FF; G:$B6; B:$C1; A:$FF);
  LIGHTSALMON         : Color = (R:$FF; G:$A0; B:$7A; A:$FF);
  LIGHTSEAGREEN       : Color = (R:$20; G:$B2; B:$AA; A:$FF);
  LIGHTSKYBLUE        : Color = (R:$87; G:$CE; B:$FA; A:$FF);
  LIGHTSLATEGRAY      : Color = (R:$77; G:$88; B:$99; A:$FF);
  LIGHTSLATEGREY      : Color = (R:$77; G:$88; B:$99; A:$FF);
  LIGHTSTEELBLUE      : Color = (R:$B0; G:$C4; B:$DE; A:$FF);
  LIGHTYELLOW         : Color = (R:$FF; G:$FF; B:$E0; A:$FF);
  LIME                : Color = (R:$00; G:$FF; B:$00; A:$FF);
  LIMEGREEN           : Color = (R:$32; G:$CD; B:$32; A:$FF);
  LINEN               : Color = (R:$FA; G:$F0; B:$E6; A:$FF);
  MAGENTA             : Color = (R:$FF; G:$00; B:$FF; A:$FF);
  MAROON              : Color = (R:$80; G:$00; B:$00; A:$FF);
  MEDIUMAQUAMARINE    : Color = (R:$66; G:$CD; B:$AA; A:$FF);
  MEDIUMBLUE          : Color = (R:$00; G:$00; B:$CD; A:$FF);
  MEDIUMORCHID        : Color = (R:$BA; G:$55; B:$D3; A:$FF);
  MEDIUMPURPLE        : Color = (R:$93; G:$70; B:$DB; A:$FF);
  MEDIUMSEAGREEN      : Color = (R:$3C; G:$B3; B:$71; A:$FF);
  MEDIUMSLATEBLUE     : Color = (R:$7B; G:$68; B:$EE; A:$FF);
  MEDIUMSPRINGGREEN   : Color = (R:$00; G:$FA; B:$9A; A:$FF);
  MEDIUMTURQUOISE     : Color = (R:$48; G:$D1; B:$CC; A:$FF);
  MEDIUMVIOLETRED     : Color = (R:$C7; G:$15; B:$85; A:$FF);
  MIDNIGHTBLUE        : Color = (R:$19; G:$19; B:$70; A:$FF);
  MINTCREAM           : Color = (R:$F5; G:$FF; B:$FA; A:$FF);
  MISTYROSE           : Color = (R:$FF; G:$E4; B:$E1; A:$FF);
  MOCCASIN            : Color = (R:$FF; G:$E4; B:$B5; A:$FF);
  NAVAJOWHITE         : Color = (R:$FF; G:$DE; B:$AD; A:$FF);
  NAVY                : Color = (R:$00; G:$00; B:$80; A:$FF);
  OLDLACE             : Color = (R:$FD; G:$F5; B:$E6; A:$FF);
  OLIVE               : Color = (R:$80; G:$80; B:$00; A:$FF);
  OLIVEDRAB           : Color = (R:$6B; G:$8E; B:$23; A:$FF);
  ORANGE              : Color = (R:$FF; G:$A5; B:$00; A:$FF);
  ORANGERED           : Color = (R:$FF; G:$45; B:$00; A:$FF);
  ORCHID              : Color = (R:$DA; G:$70; B:$D6; A:$FF);
  PALEGOLDENROD       : Color = (R:$EE; G:$E8; B:$AA; A:$FF);
  PALEGREEN           : Color = (R:$98; G:$FB; B:$98; A:$FF);
  PALETURQUOISE       : Color = (R:$AF; G:$EE; B:$EE; A:$FF);
  PALEVIOLETRED       : Color = (R:$DB; G:$70; B:$93; A:$FF);
  PAPAYAWHIP          : Color = (R:$FF; G:$EF; B:$D5; A:$FF);
  PEACHPUFF           : Color = (R:$FF; G:$DA; B:$B9; A:$FF);
  PERU                : Color = (R:$CD; G:$85; B:$3F; A:$FF);
  PINK                : Color = (R:$FF; G:$C0; B:$CB; A:$FF);
  PLUM                : Color = (R:$DD; G:$A0; B:$DD; A:$FF);
  POWDERBLUE          : Color = (R:$B0; G:$E0; B:$E6; A:$FF);
  PURPLE              : Color = (R:$80; G:$00; B:$80; A:$FF);
  REBECCAPURPLE       : Color = (R:$66; G:$33; B:$99; A:$FF);
  RED                 : Color = (R:$FF; G:$00; B:$00; A:$FF);
  ROSYBROWN           : Color = (R:$BC; G:$8F; B:$8F; A:$FF);
  ROYALBLUE           : Color = (R:$41; G:$69; B:$E1; A:$FF);
  SADDLEBROWN         : Color = (R:$8B; G:$45; B:$13; A:$FF);
  SALMON              : Color = (R:$FA; G:$80; B:$72; A:$FF);
  SANDYBROWN          : Color = (R:$F4; G:$A4; B:$60; A:$FF);
  SEAGREEN            : Color = (R:$2E; G:$8B; B:$57; A:$FF);
  SEASHELL            : Color = (R:$FF; G:$F5; B:$EE; A:$FF);
  SIENNA              : Color = (R:$A0; G:$52; B:$2D; A:$FF);
  SILVER              : Color = (R:$C0; G:$C0; B:$C0; A:$FF);
  SKYBLUE             : Color = (R:$87; G:$CE; B:$EB; A:$FF);
  SLATEBLUE           : Color = (R:$6A; G:$5A; B:$CD; A:$FF);
  SLATEGRAY           : Color = (R:$70; G:$80; B:$90; A:$FF);
  SLATEGREY           : Color = (R:$70; G:$80; B:$90; A:$FF);
  SNOW                : Color = (R:$FF; G:$FA; B:$FA; A:$FF);
  SPRINGGREEN         : Color = (R:$00; G:$FF; B:$7F; A:$FF);
  STEELBLUE           : Color = (R:$46; G:$82; B:$B4; A:$FF);
  TAN                 : Color = (R:$D2; G:$B4; B:$8C; A:$FF);
  TEAL                : Color = (R:$00; G:$80; B:$80; A:$FF);
  THISTLE             : Color = (R:$D8; G:$BF; B:$D8; A:$FF);
  TOMATO              : Color = (R:$FF; G:$63; B:$47; A:$FF);
  TURQUOISE           : Color = (R:$40; G:$E0; B:$D0; A:$FF);
  VIOLET              : Color = (R:$EE; G:$82; B:$EE; A:$FF);
  WHEAT               : Color = (R:$F5; G:$DE; B:$B3; A:$FF);
  WHITE               : Color = (R:$FF; G:$FF; B:$FF; A:$FF);
  WHITESMOKE          : Color = (R:$F5; G:$F5; B:$F5; A:$FF);
  YELLOW              : Color = (R:$FF; G:$FF; B:$00; A:$FF);
  YELLOWGREEN         : Color = (R:$9A; G:$CD; B:$32; A:$FF);
  BLANK               : Color = (R:$00; G:$00; B:$00; A:$00);
  WHITE2              : Color = (R:$F5; G:$F5; B:$F5; A:$FF);
  RED2                : Color = (R:$7E; G:$32; B:$3F; A:255);
  COLORKEY            : Color = (R:$FF; G:$00; B:$FF; A:$FF);
  OVERLAY1            : Color = (R:$00; G:$20; B:$29; A:$B4);
  OVERLAY2            : Color = (R:$01; G:$1B; B:$01; A:255);
  DIMWHITE            : Color = (R:$10; G:$10; B:$10; A:$10);
  DARKSLATEBROWN      : Color = (R: 30; G: 31; B: 30; A:  1);
  RAYWHITE            : Color = (R:245; G:245; B:245; A:255);
{$ENDREGION}  

var
  InitWindow: procedure(width: Integer; height: Integer; const title: PUTF8Char); cdecl;
  WindowShouldClose: function(): Boolean; cdecl;
  CloseWindow: procedure(); cdecl;
  IsWindowReady: function(): Boolean; cdecl;
  IsWindowFullscreen: function(): Boolean; cdecl;
  IsWindowHidden: function(): Boolean; cdecl;
  IsWindowMinimized: function(): Boolean; cdecl;
  IsWindowMaximized: function(): Boolean; cdecl;
  IsWindowFocused: function(): Boolean; cdecl;
  IsWindowResized: function(): Boolean; cdecl;
  IsWindowState: function(flag: Cardinal): Boolean; cdecl;
  SetWindowState: procedure(flags: Cardinal); cdecl;
  ClearWindowState: procedure(flags: Cardinal); cdecl;
  ToggleFullscreen: procedure(); cdecl;
  MaximizeWindow: procedure(); cdecl;
  MinimizeWindow: procedure(); cdecl;
  RestoreWindow: procedure(); cdecl;
  SetWindowIcon: procedure(image: Image); cdecl;
  SetWindowIcons: procedure(images: PImage; count: Integer); cdecl;
  SetWindowTitle: procedure(const title: PUTF8Char); cdecl;
  SetWindowPosition: procedure(x: Integer; y: Integer); cdecl;
  SetWindowMonitor: procedure(monitor: Integer); cdecl;
  SetWindowMinSize: procedure(width: Integer; height: Integer); cdecl;
  SetWindowSize: procedure(width: Integer; height: Integer); cdecl;
  SetWindowOpacity: procedure(opacity: Single); cdecl;
  GetWindowHandle: function(): Pointer; cdecl;
  GetScreenWidth: function(): Integer; cdecl;
  GetScreenHeight: function(): Integer; cdecl;
  GetRenderWidth: function(): Integer; cdecl;
  GetRenderHeight: function(): Integer; cdecl;
  GetMonitorCount: function(): Integer; cdecl;
  GetCurrentMonitor: function(): Integer; cdecl;
  GetMonitorPosition: function(monitor: Integer): Vector2; cdecl;
  GetMonitorWidth: function(monitor: Integer): Integer; cdecl;
  GetMonitorHeight: function(monitor: Integer): Integer; cdecl;
  GetMonitorPhysicalWidth: function(monitor: Integer): Integer; cdecl;
  GetMonitorPhysicalHeight: function(monitor: Integer): Integer; cdecl;
  GetMonitorRefreshRate: function(monitor: Integer): Integer; cdecl;
  GetWindowPosition: function(): Vector2; cdecl;
  GetWindowScaleDPI: function(): Vector2; cdecl;
  GetMonitorName: function(monitor: Integer): PUTF8Char; cdecl;
  SetClipboardText: procedure(const text: PUTF8Char); cdecl;
  GetClipboardText: function(): PUTF8Char; cdecl;
  EnableEventWaiting: procedure(); cdecl;
  DisableEventWaiting: procedure(); cdecl;
  SwapScreenBuffer: procedure(); cdecl;
  PollInputEvents: procedure(); cdecl;
  WaitTime: procedure(seconds: Double); cdecl;
  ShowCursor: procedure(); cdecl;
  HideCursor: procedure(); cdecl;
  IsCursorHidden: function(): Boolean; cdecl;
  EnableCursor: procedure(); cdecl;
  DisableCursor: procedure(); cdecl;
  IsCursorOnScreen: function(): Boolean; cdecl;
  ClearBackground: procedure(color: Color); cdecl;
  BeginDrawing: procedure(); cdecl;
  EndDrawing: procedure(); cdecl;
  BeginMode2D: procedure(camera: Camera2D); cdecl;
  EndMode2D: procedure(); cdecl;
  BeginMode3D: procedure(camera: Camera3D); cdecl;
  EndMode3D: procedure(); cdecl;
  BeginTextureMode: procedure(target: RenderTexture2D); cdecl;
  EndTextureMode: procedure(); cdecl;
  BeginShaderMode: procedure(shader: Shader); cdecl;
  EndShaderMode: procedure(); cdecl;
  BeginBlendMode: procedure(mode: Integer); cdecl;
  EndBlendMode: procedure(); cdecl;
  BeginScissorMode: procedure(x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  EndScissorMode: procedure(); cdecl;
  BeginVrStereoMode: procedure(config: VrStereoConfig); cdecl;
  EndVrStereoMode: procedure(); cdecl;
  LoadVrStereoConfig: function(device: VrDeviceInfo): VrStereoConfig; cdecl;
  UnloadVrStereoConfig: procedure(config: VrStereoConfig); cdecl;
  LoadShader: function(const vsFileName: PUTF8Char; const fsFileName: PUTF8Char): Shader; cdecl;
  LoadShaderFromMemory: function(const vsCode: PUTF8Char; const fsCode: PUTF8Char): Shader; cdecl;
  IsShaderReady: function(shader: Shader): Boolean; cdecl;
  GetShaderLocation: function(shader: Shader; const uniformName: PUTF8Char): Integer; cdecl;
  GetShaderLocationAttrib: function(shader: Shader; const attribName: PUTF8Char): Integer; cdecl;
  SetShaderValue: procedure(shader: Shader; locIndex: Integer; const value: Pointer; uniformType: Integer); cdecl;
  SetShaderValueV: procedure(shader: Shader; locIndex: Integer; const value: Pointer; uniformType: Integer; count: Integer); cdecl;
  SetShaderValueMatrix: procedure(shader: Shader; locIndex: Integer; mat: Matrix); cdecl;
  SetShaderValueTexture: procedure(shader: Shader; locIndex: Integer; texture: Texture2D); cdecl;
  UnloadShader: procedure(shader: Shader); cdecl;
  GetMouseRay: function(mousePosition: Vector2; camera: Camera): Ray; cdecl;
  GetCameraMatrix: function(camera: Camera): Matrix; cdecl;
  GetCameraMatrix2D: function(camera: Camera2D): Matrix; cdecl;
  GetWorldToScreen: function(position: Vector3; camera: Camera): Vector2; cdecl;
  GetScreenToWorld2D: function(position: Vector2; camera: Camera2D): Vector2; cdecl;
  GetWorldToScreenEx: function(position: Vector3; camera: Camera; width: Integer; height: Integer): Vector2; cdecl;
  GetWorldToScreen2D: function(position: Vector2; camera: Camera2D): Vector2; cdecl;
  SetTargetFPS: procedure(fps: Integer); cdecl;
  GetFPS: function(): Integer; cdecl;
  GetFrameTime: function(): Single; cdecl;
  GetTime: function(): Double; cdecl;
  GetRandomValue: function(min: Integer; max: Integer): Integer; cdecl;
  SetRandomSeed: procedure(seed: Cardinal); cdecl;
  TakeScreenshot: procedure(const fileName: PUTF8Char); cdecl;
  SetConfigFlags: procedure(flags: Cardinal); cdecl;
  TraceLog: procedure(logLevel: Integer; const text: PUTF8Char) varargs; cdecl;
  SetTraceLogLevel: procedure(logLevel: Integer); cdecl;
  MemAlloc: function(size: Cardinal): Pointer; cdecl;
  MemRealloc: function(ptr: Pointer; size: Cardinal): Pointer; cdecl;
  MemFree: procedure(ptr: Pointer); cdecl;
  OpenURL: procedure(const url: PUTF8Char); cdecl;
  SetTraceLogCallback: procedure(callback: TraceLogCallback); cdecl;
  SetLoadFileDataCallback: procedure(callback: LoadFileDataCallback); cdecl;
  SetSaveFileDataCallback: procedure(callback: SaveFileDataCallback); cdecl;
  SetLoadFileTextCallback: procedure(callback: LoadFileTextCallback); cdecl;
  SetSaveFileTextCallback: procedure(callback: SaveFileTextCallback); cdecl;
  LoadFileData: function(const fileName: PUTF8Char; bytesRead: PCardinal): PByte; cdecl;
  UnloadFileData: procedure(data: PByte); cdecl;
  SaveFileData: function(const fileName: PUTF8Char; data: Pointer; bytesToWrite: Cardinal): Boolean; cdecl;
  ExportDataAsCode: function(const data: PByte; size: Cardinal; const fileName: PUTF8Char): Boolean; cdecl;
  LoadFileText: function(const fileName: PUTF8Char): PUTF8Char; cdecl;
  UnloadFileText: procedure(text: PUTF8Char); cdecl;
  SaveFileText: function(const fileName: PUTF8Char; text: PUTF8Char): Boolean; cdecl;
  FileExists: function(const fileName: PUTF8Char): Boolean; cdecl;
  DirectoryExists: function(const dirPath: PUTF8Char): Boolean; cdecl;
  IsFileExtension: function(const fileName: PUTF8Char; const ext: PUTF8Char): Boolean; cdecl;
  GetFileLength: function(const fileName: PUTF8Char): Integer; cdecl;
  GetFileExtension: function(const fileName: PUTF8Char): PUTF8Char; cdecl;
  GetFileName: function(const filePath: PUTF8Char): PUTF8Char; cdecl;
  GetFileNameWithoutExt: function(const filePath: PUTF8Char): PUTF8Char; cdecl;
  GetDirectoryPath: function(const filePath: PUTF8Char): PUTF8Char; cdecl;
  GetPrevDirectoryPath: function(const dirPath: PUTF8Char): PUTF8Char; cdecl;
  GetWorkingDirectory: function(): PUTF8Char; cdecl;
  GetApplicationDirectory: function(): PUTF8Char; cdecl;
  ChangeDirectory: function(const dir: PUTF8Char): Boolean; cdecl;
  IsPathFile: function(const path: PUTF8Char): Boolean; cdecl;
  LoadDirectoryFiles: function(const dirPath: PUTF8Char): FilePathList; cdecl;
  LoadDirectoryFilesEx: function(const basePath: PUTF8Char; const filter: PUTF8Char; scanSubdirs: Boolean): FilePathList; cdecl;
  UnloadDirectoryFiles: procedure(files: FilePathList); cdecl;
  IsFileDropped: function(): Boolean; cdecl;
  LoadDroppedFiles: function(): FilePathList; cdecl;
  UnloadDroppedFiles: procedure(files: FilePathList); cdecl;
  GetFileModTime: function(const fileName: PUTF8Char): Integer; cdecl;
  CompressData: function(const data: PByte; dataSize: Integer; compDataSize: PInteger): PByte; cdecl;
  DecompressData: function(const compData: PByte; compDataSize: Integer; dataSize: PInteger): PByte; cdecl;
  EncodeDataBase64: function(const data: PByte; dataSize: Integer; outputSize: PInteger): PUTF8Char; cdecl;
  DecodeDataBase64: function(const data: PByte; outputSize: PInteger): PByte; cdecl;
  IsKeyPressed: function(key: Integer): Boolean; cdecl;
  IsKeyDown: function(key: Integer): Boolean; cdecl;
  IsKeyReleased: function(key: Integer): Boolean; cdecl;
  IsKeyUp: function(key: Integer): Boolean; cdecl;
  SetExitKey: procedure(key: Integer); cdecl;
  GetKeyPressed: function(): Integer; cdecl;
  GetCharPressed: function(): Integer; cdecl;
  IsGamepadAvailable: function(gamepad: Integer): Boolean; cdecl;
  GetGamepadName: function(gamepad: Integer): PUTF8Char; cdecl;
  IsGamepadButtonPressed: function(gamepad: Integer; button: Integer): Boolean; cdecl;
  IsGamepadButtonDown: function(gamepad: Integer; button: Integer): Boolean; cdecl;
  IsGamepadButtonReleased: function(gamepad: Integer; button: Integer): Boolean; cdecl;
  IsGamepadButtonUp: function(gamepad: Integer; button: Integer): Boolean; cdecl;
  GetGamepadButtonPressed: function(): Integer; cdecl;
  GetGamepadAxisCount: function(gamepad: Integer): Integer; cdecl;
  GetGamepadAxisMovement: function(gamepad: Integer; axis: Integer): Single; cdecl;
  SetGamepadMappings: function(const mappings: PUTF8Char): Integer; cdecl;
  IsMouseButtonPressed: function(button: Integer): Boolean; cdecl;
  IsMouseButtonDown: function(button: Integer): Boolean; cdecl;
  IsMouseButtonReleased: function(button: Integer): Boolean; cdecl;
  IsMouseButtonUp: function(button: Integer): Boolean; cdecl;
  GetMouseX: function(): Integer; cdecl;
  GetMouseY: function(): Integer; cdecl;
  GetMousePosition: function(): Vector2; cdecl;
  GetMouseDelta: function(): Vector2; cdecl;
  SetMousePosition: procedure(x: Integer; y: Integer); cdecl;
  SetMouseOffset: procedure(offsetX: Integer; offsetY: Integer); cdecl;
  SetMouseScale: procedure(scaleX: Single; scaleY: Single); cdecl;
  GetMouseWheelMove: function(): Single; cdecl;
  GetMouseWheelMoveV: function(): Vector2; cdecl;
  SetMouseCursor: procedure(cursor: Integer); cdecl;
  GetTouchX: function(): Integer; cdecl;
  GetTouchY: function(): Integer; cdecl;
  GetTouchPosition: function(index: Integer): Vector2; cdecl;
  GetTouchPointId: function(index: Integer): Integer; cdecl;
  GetTouchPointCount: function(): Integer; cdecl;
  SetGesturesEnabled: procedure(flags: Cardinal); cdecl;
  IsGestureDetected: function(gesture: Integer): Boolean; cdecl;
  GetGestureDetected: function(): Integer; cdecl;
  GetGestureHoldDuration: function(): Single; cdecl;
  GetGestureDragVector: function(): Vector2; cdecl;
  GetGestureDragAngle: function(): Single; cdecl;
  GetGesturePinchVector: function(): Vector2; cdecl;
  GetGesturePinchAngle: function(): Single; cdecl;
  UpdateCamera: procedure(camera: PCamera; mode: Integer); cdecl;
  UpdateCameraPro: procedure(camera: PCamera; movement: Vector3; rotation: Vector3; zoom: Single); cdecl;
  SetShapesTexture: procedure(texture: Texture2D; source: Rectangle); cdecl;
  DrawPixel: procedure(posX: Integer; posY: Integer; color: Color); cdecl;
  DrawPixelV: procedure(position: Vector2; color: Color); cdecl;
  DrawLine: procedure(startPosX: Integer; startPosY: Integer; endPosX: Integer; endPosY: Integer; color: Color); cdecl;
  DrawLineV: procedure(startPos: Vector2; endPos: Vector2; color: Color); cdecl;
  DrawLineEx: procedure(startPos: Vector2; endPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineBezier: procedure(startPos: Vector2; endPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineBezierQuad: procedure(startPos: Vector2; endPos: Vector2; controlPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineBezierCubic: procedure(startPos: Vector2; endPos: Vector2; startControlPos: Vector2; endControlPos: Vector2; thick: Single; color: Color); cdecl;
  DrawLineStrip: procedure(points: PVector2; pointCount: Integer; color: Color); cdecl;
  DrawCircle: procedure(centerX: Integer; centerY: Integer; radius: Single; color: Color); cdecl;
  DrawCircleSector: procedure(center: Vector2; radius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawCircleSectorLines: procedure(center: Vector2; radius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawCircleGradient: procedure(centerX: Integer; centerY: Integer; radius: Single; color1: Color; color2: Color); cdecl;
  DrawCircleV: procedure(center: Vector2; radius: Single; color: Color); cdecl;
  DrawCircleLines: procedure(centerX: Integer; centerY: Integer; radius: Single; color: Color); cdecl;
  DrawEllipse: procedure(centerX: Integer; centerY: Integer; radiusH: Single; radiusV: Single; color: Color); cdecl;
  DrawEllipseLines: procedure(centerX: Integer; centerY: Integer; radiusH: Single; radiusV: Single; color: Color); cdecl;
  DrawRing: procedure(center: Vector2; innerRadius: Single; outerRadius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawRingLines: procedure(center: Vector2; innerRadius: Single; outerRadius: Single; startAngle: Single; endAngle: Single; segments: Integer; color: Color); cdecl;
  DrawRectangle: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color: Color); cdecl;
  DrawRectangleV: procedure(position: Vector2; size: Vector2; color: Color); cdecl;
  DrawRectangleRec: procedure(rec: Rectangle; color: Color); cdecl;
  DrawRectanglePro: procedure(rec: Rectangle; origin: Vector2; rotation: Single; color: Color); cdecl;
  DrawRectangleGradientV: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color1: Color; color2: Color); cdecl;
  DrawRectangleGradientH: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color1: Color; color2: Color); cdecl;
  DrawRectangleGradientEx: procedure(rec: Rectangle; col1: Color; col2: Color; col3: Color; col4: Color); cdecl;
  DrawRectangleLines: procedure(posX: Integer; posY: Integer; width: Integer; height: Integer; color: Color); cdecl;
  DrawRectangleLinesEx: procedure(rec: Rectangle; lineThick: Single; color: Color); cdecl;
  DrawRectangleRounded: procedure(rec: Rectangle; roundness: Single; segments: Integer; color: Color); cdecl;
  DrawRectangleRoundedLines: procedure(rec: Rectangle; roundness: Single; segments: Integer; lineThick: Single; color: Color); cdecl;
  DrawTriangle: procedure(v1: Vector2; v2: Vector2; v3: Vector2; color: Color); cdecl;
  DrawTriangleLines: procedure(v1: Vector2; v2: Vector2; v3: Vector2; color: Color); cdecl;
  DrawTriangleFan: procedure(points: PVector2; pointCount: Integer; color: Color); cdecl;
  DrawTriangleStrip: procedure(points: PVector2; pointCount: Integer; color: Color); cdecl;
  DrawPoly: procedure(center: Vector2; sides: Integer; radius: Single; rotation: Single; color: Color); cdecl;
  DrawPolyLines: procedure(center: Vector2; sides: Integer; radius: Single; rotation: Single; color: Color); cdecl;
  DrawPolyLinesEx: procedure(center: Vector2; sides: Integer; radius: Single; rotation: Single; lineThick: Single; color: Color); cdecl;
  CheckCollisionRecs: function(rec1: Rectangle; rec2: Rectangle): Boolean; cdecl;
  CheckCollisionCircles: function(center1: Vector2; radius1: Single; center2: Vector2; radius2: Single): Boolean; cdecl;
  CheckCollisionCircleRec: function(center: Vector2; radius: Single; rec: Rectangle): Boolean; cdecl;
  CheckCollisionPointRec: function(point: Vector2; rec: Rectangle): Boolean; cdecl;
  CheckCollisionPointCircle: function(point: Vector2; center: Vector2; radius: Single): Boolean; cdecl;
  CheckCollisionPointTriangle: function(point: Vector2; p1: Vector2; p2: Vector2; p3: Vector2): Boolean; cdecl;
  CheckCollisionPointPoly: function(point: Vector2; points: PVector2; pointCount: Integer): Boolean; cdecl;
  CheckCollisionLines: function(startPos1: Vector2; endPos1: Vector2; startPos2: Vector2; endPos2: Vector2; collisionPoint: PVector2): Boolean; cdecl;
  CheckCollisionPointLine: function(point: Vector2; p1: Vector2; p2: Vector2; threshold: Integer): Boolean; cdecl;
  GetCollisionRec: function(rec1: Rectangle; rec2: Rectangle): Rectangle; cdecl;
  LoadImage: function(const fileName: PUTF8Char): Image; cdecl;
  LoadImageRaw: function(const fileName: PUTF8Char; width: Integer; height: Integer; format: Integer; headerSize: Integer): Image; cdecl;
  LoadImageAnim: function(const fileName: PUTF8Char; frames: PInteger): Image; cdecl;
  LoadImageFromMemory: function(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer): Image; cdecl;
  LoadImageFromTexture: function(texture: Texture2D): Image; cdecl;
  LoadImageFromScreen: function(): Image; cdecl;
  IsImageReady: function(image: Image): Boolean; cdecl;
  UnloadImage: procedure(image: Image); cdecl;
  ExportImage: function(image: Image; const fileName: PUTF8Char): Boolean; cdecl;
  ExportImageAsCode: function(image: Image; const fileName: PUTF8Char): Boolean; cdecl;
  GenImageColor: function(width: Integer; height: Integer; color: Color): Image; cdecl;
  GenImageGradientV: function(width: Integer; height: Integer; top: Color; bottom: Color): Image; cdecl;
  GenImageGradientH: function(width: Integer; height: Integer; left: Color; right: Color): Image; cdecl;
  GenImageGradientRadial: function(width: Integer; height: Integer; density: Single; inner: Color; outer: Color): Image; cdecl;
  GenImageChecked: function(width: Integer; height: Integer; checksX: Integer; checksY: Integer; col1: Color; col2: Color): Image; cdecl;
  GenImageWhiteNoise: function(width: Integer; height: Integer; factor: Single): Image; cdecl;
  GenImagePerlinNoise: function(width: Integer; height: Integer; offsetX: Integer; offsetY: Integer; scale: Single): Image; cdecl;
  GenImageCellular: function(width: Integer; height: Integer; tileSize: Integer): Image; cdecl;
  GenImageText: function(width: Integer; height: Integer; const text: PUTF8Char): Image; cdecl;
  ImageCopy: function(image: Image): Image; cdecl;
  ImageFromImage: function(image: Image; rec: Rectangle): Image; cdecl;
  ImageText: function(const text: PUTF8Char; fontSize: Integer; color: Color): Image; cdecl;
  ImageTextEx: function(font: Font; const text: PUTF8Char; fontSize: Single; spacing: Single; tint: Color): Image; cdecl;
  ImageFormat: procedure(image: PImage; newFormat: Integer); cdecl;
  ImageToPOT: procedure(image: PImage; fill: Color); cdecl;
  ImageCrop: procedure(image: PImage; crop: Rectangle); cdecl;
  ImageAlphaCrop: procedure(image: PImage; threshold: Single); cdecl;
  ImageAlphaClear: procedure(image: PImage; color: Color; threshold: Single); cdecl;
  ImageAlphaMask: procedure(image: PImage; alphaMask: Image); cdecl;
  ImageAlphaPremultiply: procedure(image: PImage); cdecl;
  ImageBlurGaussian: procedure(image: PImage; blurSize: Integer); cdecl;
  ImageResize: procedure(image: PImage; newWidth: Integer; newHeight: Integer); cdecl;
  ImageResizeNN: procedure(image: PImage; newWidth: Integer; newHeight: Integer); cdecl;
  ImageResizeCanvas: procedure(image: PImage; newWidth: Integer; newHeight: Integer; offsetX: Integer; offsetY: Integer; fill: Color); cdecl;
  ImageMipmaps: procedure(image: PImage); cdecl;
  ImageDither: procedure(image: PImage; rBpp: Integer; gBpp: Integer; bBpp: Integer; aBpp: Integer); cdecl;
  ImageFlipVertical: procedure(image: PImage); cdecl;
  ImageFlipHorizontal: procedure(image: PImage); cdecl;
  ImageRotateCW: procedure(image: PImage); cdecl;
  ImageRotateCCW: procedure(image: PImage); cdecl;
  ImageColorTint: procedure(image: PImage; color: Color); cdecl;
  ImageColorInvert: procedure(image: PImage); cdecl;
  ImageColorGrayscale: procedure(image: PImage); cdecl;
  ImageColorContrast: procedure(image: PImage; contrast: Single); cdecl;
  ImageColorBrightness: procedure(image: PImage; brightness: Integer); cdecl;
  ImageColorReplace: procedure(image: PImage; color: Color; replace: Color); cdecl;
  LoadImageColors: function(image: Image): PColor; cdecl;
  LoadImagePalette: function(image: Image; maxPaletteSize: Integer; colorCount: PInteger): PColor; cdecl;
  UnloadImageColors: procedure(colors: PColor); cdecl;
  UnloadImagePalette: procedure(colors: PColor); cdecl;
  GetImageAlphaBorder: function(image: Image; threshold: Single): Rectangle; cdecl;
  GetImageColor: function(image: Image; x: Integer; y: Integer): Color; cdecl;
  ImageClearBackground: procedure(dst: PImage; color: Color); cdecl;
  ImageDrawPixel: procedure(dst: PImage; posX: Integer; posY: Integer; color: Color); cdecl;
  ImageDrawPixelV: procedure(dst: PImage; position: Vector2; color: Color); cdecl;
  ImageDrawLine: procedure(dst: PImage; startPosX: Integer; startPosY: Integer; endPosX: Integer; endPosY: Integer; color: Color); cdecl;
  ImageDrawLineV: procedure(dst: PImage; start: Vector2; end_: Vector2; color: Color); cdecl;
  ImageDrawCircle: procedure(dst: PImage; centerX: Integer; centerY: Integer; radius: Integer; color: Color); cdecl;
  ImageDrawCircleV: procedure(dst: PImage; center: Vector2; radius: Integer; color: Color); cdecl;
  ImageDrawCircleLines: procedure(dst: PImage; centerX: Integer; centerY: Integer; radius: Integer; color: Color); cdecl;
  ImageDrawCircleLinesV: procedure(dst: PImage; center: Vector2; radius: Integer; color: Color); cdecl;
  ImageDrawRectangle: procedure(dst: PImage; posX: Integer; posY: Integer; width: Integer; height: Integer; color: Color); cdecl;
  ImageDrawRectangleV: procedure(dst: PImage; position: Vector2; size: Vector2; color: Color); cdecl;
  ImageDrawRectangleRec: procedure(dst: PImage; rec: Rectangle; color: Color); cdecl;
  ImageDrawRectangleLines: procedure(dst: PImage; rec: Rectangle; thick: Integer; color: Color); cdecl;
  ImageDraw: procedure(dst: PImage; src: Image; srcRec: Rectangle; dstRec: Rectangle; tint: Color); cdecl;
  ImageDrawText: procedure(dst: PImage; const text: PUTF8Char; posX: Integer; posY: Integer; fontSize: Integer; color: Color); cdecl;
  ImageDrawTextEx: procedure(dst: PImage; font: Font; const text: PUTF8Char; position: Vector2; fontSize: Single; spacing: Single; tint: Color); cdecl;
  LoadTexture: function(const fileName: PUTF8Char): Texture2D; cdecl;
  LoadTextureFromImage: function(image: Image): Texture2D; cdecl;
  LoadTextureCubemap: function(image: Image; layout: Integer): TextureCubemap; cdecl;
  LoadRenderTexture: function(width: Integer; height: Integer): RenderTexture2D; cdecl;
  IsTextureReady: function(texture: Texture2D): Boolean; cdecl;
  UnloadTexture: procedure(texture: Texture2D); cdecl;
  IsRenderTextureReady: function(target: RenderTexture2D): Boolean; cdecl;
  UnloadRenderTexture: procedure(target: RenderTexture2D); cdecl;
  UpdateTexture: procedure(texture: Texture2D; const pixels: Pointer); cdecl;
  UpdateTextureRec: procedure(texture: Texture2D; rec: Rectangle; const pixels: Pointer); cdecl;
  GenTextureMipmaps: procedure(texture: PTexture2D); cdecl;
  SetTextureFilter: procedure(texture: Texture2D; filter: Integer); cdecl;
  SetTextureWrap: procedure(texture: Texture2D; wrap: Integer); cdecl;
  DrawTexture: procedure(texture: Texture2D; posX: Integer; posY: Integer; tint: Color); cdecl;
  DrawTextureV: procedure(texture: Texture2D; position: Vector2; tint: Color); cdecl;
  DrawTextureEx: procedure(texture: Texture2D; position: Vector2; rotation: Single; scale: Single; tint: Color); cdecl;
  DrawTextureRec: procedure(texture: Texture2D; source: Rectangle; position: Vector2; tint: Color); cdecl;
  DrawTexturePro: procedure(texture: Texture2D; source: Rectangle; dest: Rectangle; origin: Vector2; rotation: Single; tint: Color); cdecl;
  DrawTextureNPatch: procedure(texture: Texture2D; nPatchInfo: NPatchInfo; dest: Rectangle; origin: Vector2; rotation: Single; tint: Color); cdecl;
  Fade: function(color: Color; alpha: Single): Color; cdecl;
  ColorToInt: function(color: Color): Integer; cdecl;
  ColorNormalize: function(color: Color): Vector4; cdecl;
  ColorFromNormalized: function(normalized: Vector4): Color; cdecl;
  ColorToHSV: function(color: Color): Vector3; cdecl;
  ColorFromHSV: function(hue: Single; saturation: Single; value: Single): Color; cdecl;
  ColorTint: function(color: Color; tint: Color): Color; cdecl;
  ColorBrightness: function(color: Color; factor: Single): Color; cdecl;
  ColorContrast: function(color: Color; contrast: Single): Color; cdecl;
  ColorAlpha: function(color: Color; alpha: Single): Color; cdecl;
  ColorAlphaBlend: function(dst: Color; src: Color; tint: Color): Color; cdecl;
  GetColor: function(hexValue: Cardinal): Color; cdecl;
  GetPixelColor: function(srcPtr: Pointer; format: Integer): Color; cdecl;
  SetPixelColor: procedure(dstPtr: Pointer; color: Color; format: Integer); cdecl;
  GetPixelDataSize: function(width: Integer; height: Integer; format: Integer): Integer; cdecl;
  GetFontDefault: function(): Font; cdecl;
  LoadFont: function(const fileName: PUTF8Char): Font; cdecl;
  LoadFontEx: function(const fileName: PUTF8Char; fontSize: Integer; fontChars: PInteger; glyphCount: Integer): Font; cdecl;
  LoadFontFromImage: function(image: Image; key: Color; firstChar: Integer): Font; cdecl;
  LoadFontFromMemory: function(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer; fontSize: Integer; fontChars: PInteger; glyphCount: Integer): Font; cdecl;
  IsFontReady: function(font: Font): Boolean; cdecl;
  LoadFontData: function(const fileData: PByte; dataSize: Integer; fontSize: Integer; fontChars: PInteger; glyphCount: Integer; type_: Integer): PGlyphInfo; cdecl;
  GenImageFontAtlas: function(const chars: PGlyphInfo; recs: PPRectangle; glyphCount: Integer; fontSize: Integer; padding: Integer; packMethod: Integer): Image; cdecl;
  UnloadFontData: procedure(chars: PGlyphInfo; glyphCount: Integer); cdecl;
  UnloadFont: procedure(font: Font); cdecl;
  ExportFontAsCode: function(font: Font; const fileName: PUTF8Char): Boolean; cdecl;
  DrawFPS: procedure(posX: Integer; posY: Integer); cdecl;
  DrawText: procedure(const text: PUTF8Char; posX: Integer; posY: Integer; fontSize: Integer; color: Color); cdecl;
  DrawTextEx: procedure(font: Font; const text: PUTF8Char; position: Vector2; fontSize: Single; spacing: Single; tint: Color); cdecl;
  DrawTextPro: procedure(font: Font; const text: PUTF8Char; position: Vector2; origin: Vector2; rotation: Single; fontSize: Single; spacing: Single; tint: Color); cdecl;
  DrawTextCodepoint: procedure(font: Font; codepoint: Integer; position: Vector2; fontSize: Single; tint: Color); cdecl;
  DrawTextCodepoints: procedure(font: Font; const codepoints: PInteger; count: Integer; position: Vector2; fontSize: Single; spacing: Single; tint: Color); cdecl;
  MeasureText: function(const text: PUTF8Char; fontSize: Integer): Integer; cdecl;
  MeasureTextEx: function(font: Font; const text: PUTF8Char; fontSize: Single; spacing: Single): Vector2; cdecl;
  GetGlyphIndex: function(font: Font; codepoint: Integer): Integer; cdecl;
  GetGlyphInfo: function(font: Font; codepoint: Integer): GlyphInfo; cdecl;
  GetGlyphAtlasRec: function(font: Font; codepoint: Integer): Rectangle; cdecl;
  LoadUTF8: function(const codepoints: PInteger; length: Integer): PUTF8Char; cdecl;
  UnloadUTF8: procedure(text: PUTF8Char); cdecl;
  LoadCodepoints: function(const text: PUTF8Char; count: PInteger): PInteger; cdecl;
  UnloadCodepoints: procedure(codepoints: PInteger); cdecl;
  GetCodepointCount: function(const text: PUTF8Char): Integer; cdecl;
  GetCodepoint: function(const text: PUTF8Char; codepointSize: PInteger): Integer; cdecl;
  GetCodepointNext: function(const text: PUTF8Char; codepointSize: PInteger): Integer; cdecl;
  GetCodepointPrevious: function(const text: PUTF8Char; codepointSize: PInteger): Integer; cdecl;
  CodepointToUTF8: function(codepoint: Integer; utf8Size: PInteger): PUTF8Char; cdecl;
  TextCopy: function(dst: PUTF8Char; const src: PUTF8Char): Integer; cdecl;
  TextIsEqual: function(const text1: PUTF8Char; const text2: PUTF8Char): Boolean; cdecl;
  TextLength: function(const text: PUTF8Char): Cardinal; cdecl;
  TextFormat: function(const text: PUTF8Char): PUTF8Char varargs; cdecl;
  TextSubtext: function(const text: PUTF8Char; position: Integer; length: Integer): PUTF8Char; cdecl;
  TextReplace: function(text: PUTF8Char; const replace: PUTF8Char; const by: PUTF8Char): PUTF8Char; cdecl;
  TextInsert: function(const text: PUTF8Char; const insert: PUTF8Char; position: Integer): PUTF8Char; cdecl;
  TextJoin: function(textList: PPUTF8Char; count: Integer; const delimiter: PUTF8Char): PUTF8Char; cdecl;
  TextSplit: function(const text: PUTF8Char; delimiter: UTF8Char; count: PInteger): PPUTF8Char; cdecl;
  TextAppend: procedure(text: PUTF8Char; const append: PUTF8Char; position: PInteger); cdecl;
  TextFindIndex: function(const text: PUTF8Char; const find: PUTF8Char): Integer; cdecl;
  TextToUpper: function(const text: PUTF8Char): PUTF8Char; cdecl;
  TextToLower: function(const text: PUTF8Char): PUTF8Char; cdecl;
  TextToPascal: function(const text: PUTF8Char): PUTF8Char; cdecl;
  TextToInteger: function(const text: PUTF8Char): Integer; cdecl;
  DrawLine3D: procedure(startPos: Vector3; endPos: Vector3; color: Color); cdecl;
  DrawPoint3D: procedure(position: Vector3; color: Color); cdecl;
  DrawCircle3D: procedure(center: Vector3; radius: Single; rotationAxis: Vector3; rotationAngle: Single; color: Color); cdecl;
  DrawTriangle3D: procedure(v1: Vector3; v2: Vector3; v3: Vector3; color: Color); cdecl;
  DrawTriangleStrip3D: procedure(points: PVector3; pointCount: Integer; color: Color); cdecl;
  DrawCube: procedure(position: Vector3; width: Single; height: Single; length: Single; color: Color); cdecl;
  DrawCubeV: procedure(position: Vector3; size: Vector3; color: Color); cdecl;
  DrawCubeWires: procedure(position: Vector3; width: Single; height: Single; length: Single; color: Color); cdecl;
  DrawCubeWiresV: procedure(position: Vector3; size: Vector3; color: Color); cdecl;
  DrawSphere: procedure(centerPos: Vector3; radius: Single; color: Color); cdecl;
  DrawSphereEx: procedure(centerPos: Vector3; radius: Single; rings: Integer; slices: Integer; color: Color); cdecl;
  DrawSphereWires: procedure(centerPos: Vector3; radius: Single; rings: Integer; slices: Integer; color: Color); cdecl;
  DrawCylinder: procedure(position: Vector3; radiusTop: Single; radiusBottom: Single; height: Single; slices: Integer; color: Color); cdecl;
  DrawCylinderEx: procedure(startPos: Vector3; endPos: Vector3; startRadius: Single; endRadius: Single; sides: Integer; color: Color); cdecl;
  DrawCylinderWires: procedure(position: Vector3; radiusTop: Single; radiusBottom: Single; height: Single; slices: Integer; color: Color); cdecl;
  DrawCylinderWiresEx: procedure(startPos: Vector3; endPos: Vector3; startRadius: Single; endRadius: Single; sides: Integer; color: Color); cdecl;
  DrawCapsule: procedure(startPos: Vector3; endPos: Vector3; radius: Single; slices: Integer; rings: Integer; color: Color); cdecl;
  DrawCapsuleWires: procedure(startPos: Vector3; endPos: Vector3; radius: Single; slices: Integer; rings: Integer; color: Color); cdecl;
  DrawPlane: procedure(centerPos: Vector3; size: Vector2; color: Color); cdecl;
  DrawRay: procedure(ray: Ray; color: Color); cdecl;
  DrawGrid: procedure(slices: Integer; spacing: Single); cdecl;
  LoadModel: function(const fileName: PUTF8Char): Model; cdecl;
  LoadModelFromMesh: function(mesh: Mesh): Model; cdecl;
  IsModelReady: function(model: Model): Boolean; cdecl;
  UnloadModel: procedure(model: Model); cdecl;
  GetModelBoundingBox: function(model: Model): BoundingBox; cdecl;
  DrawModel: procedure(model: Model; position: Vector3; scale: Single; tint: Color); cdecl;
  DrawModelEx: procedure(model: Model; position: Vector3; rotationAxis: Vector3; rotationAngle: Single; scale: Vector3; tint: Color); cdecl;
  DrawModelWires: procedure(model: Model; position: Vector3; scale: Single; tint: Color); cdecl;
  DrawModelWiresEx: procedure(model: Model; position: Vector3; rotationAxis: Vector3; rotationAngle: Single; scale: Vector3; tint: Color); cdecl;
  DrawBoundingBox: procedure(box: BoundingBox; color: Color); cdecl;
  DrawBillboard: procedure(camera: Camera; texture: Texture2D; position: Vector3; size: Single; tint: Color); cdecl;
  DrawBillboardRec: procedure(camera: Camera; texture: Texture2D; source: Rectangle; position: Vector3; size: Vector2; tint: Color); cdecl;
  DrawBillboardPro: procedure(camera: Camera; texture: Texture2D; source: Rectangle; position: Vector3; up: Vector3; size: Vector2; origin: Vector2; rotation: Single; tint: Color); cdecl;
  UploadMesh: procedure(mesh: PMesh; dynamic_: Boolean); cdecl;
  UpdateMeshBuffer: procedure(mesh: Mesh; index: Integer; const data: Pointer; dataSize: Integer; offset: Integer); cdecl;
  UnloadMesh: procedure(mesh: Mesh); cdecl;
  DrawMesh: procedure(mesh: Mesh; material: Material; transform: Matrix); cdecl;
  DrawMeshInstanced: procedure(mesh: Mesh; material: Material; const transforms: PMatrix; instances: Integer); cdecl;
  ExportMesh: function(mesh: Mesh; const fileName: PUTF8Char): Boolean; cdecl;
  GetMeshBoundingBox: function(mesh: Mesh): BoundingBox; cdecl;
  GenMeshTangents: procedure(mesh: PMesh); cdecl;
  GenMeshPoly: function(sides: Integer; radius: Single): Mesh; cdecl;
  GenMeshPlane: function(width: Single; length: Single; resX: Integer; resZ: Integer): Mesh; cdecl;
  GenMeshCube: function(width: Single; height: Single; length: Single): Mesh; cdecl;
  GenMeshSphere: function(radius: Single; rings: Integer; slices: Integer): Mesh; cdecl;
  GenMeshHemiSphere: function(radius: Single; rings: Integer; slices: Integer): Mesh; cdecl;
  GenMeshCylinder: function(radius: Single; height: Single; slices: Integer): Mesh; cdecl;
  GenMeshCone: function(radius: Single; height: Single; slices: Integer): Mesh; cdecl;
  GenMeshTorus: function(radius: Single; size: Single; radSeg: Integer; sides: Integer): Mesh; cdecl;
  GenMeshKnot: function(radius: Single; size: Single; radSeg: Integer; sides: Integer): Mesh; cdecl;
  GenMeshHeightmap: function(heightmap: Image; size: Vector3): Mesh; cdecl;
  GenMeshCubicmap: function(cubicmap: Image; cubeSize: Vector3): Mesh; cdecl;
  LoadMaterials: function(const fileName: PUTF8Char; materialCount: PInteger): PMaterial; cdecl;
  LoadMaterialDefault: function(): Material; cdecl;
  IsMaterialReady: function(material: Material): Boolean; cdecl;
  UnloadMaterial: procedure(material: Material); cdecl;
  SetMaterialTexture: procedure(material: PMaterial; mapType: Integer; texture: Texture2D); cdecl;
  SetModelMeshMaterial: procedure(model: PModel; meshId: Integer; materialId: Integer); cdecl;
  LoadModelAnimations: function(const fileName: PUTF8Char; animCount: PCardinal): PModelAnimation; cdecl;
  UpdateModelAnimation: procedure(model: Model; anim: ModelAnimation; frame: Integer); cdecl;
  UnloadModelAnimation: procedure(anim: ModelAnimation); cdecl;
  UnloadModelAnimations: procedure(animations: PModelAnimation; count: Cardinal); cdecl;
  IsModelAnimationValid: function(model: Model; anim: ModelAnimation): Boolean; cdecl;
  CheckCollisionSpheres: function(center1: Vector3; radius1: Single; center2: Vector3; radius2: Single): Boolean; cdecl;
  CheckCollisionBoxes: function(box1: BoundingBox; box2: BoundingBox): Boolean; cdecl;
  CheckCollisionBoxSphere: function(box: BoundingBox; center: Vector3; radius: Single): Boolean; cdecl;
  GetRayCollisionSphere: function(ray: Ray; center: Vector3; radius: Single): RayCollision; cdecl;
  GetRayCollisionBox: function(ray: Ray; box: BoundingBox): RayCollision; cdecl;
  GetRayCollisionMesh: function(ray: Ray; mesh: Mesh; transform: Matrix): RayCollision; cdecl;
  GetRayCollisionTriangle: function(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3): RayCollision; cdecl;
  GetRayCollisionQuad: function(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3; p4: Vector3): RayCollision; cdecl;
  InitAudioDevice: procedure(); cdecl;
  CloseAudioDevice: procedure(); cdecl;
  IsAudioDeviceReady: function(): Boolean; cdecl;
  SetMasterVolume: procedure(volume: Single); cdecl;
  LoadWave: function(const fileName: PUTF8Char): Wave; cdecl;
  LoadWaveFromMemory: function(const fileType: PUTF8Char; const fileData: PByte; dataSize: Integer): Wave; cdecl;
  IsWaveReady: function(wave: Wave): Boolean; cdecl;
  LoadSound: function(const fileName: PUTF8Char): Sound; cdecl;
  LoadSoundFromWave: function(wave: Wave): Sound; cdecl;
  IsSoundReady: function(sound: Sound): Boolean; cdecl;
  UpdateSound: procedure(sound: Sound; const data: Pointer; sampleCount: Integer); cdecl;
  UnloadWave: procedure(wave: Wave); cdecl;
  UnloadSound: procedure(sound: Sound); cdecl;
  ExportWave: function(wave: Wave; const fileName: PUTF8Char): Boolean; cdecl;
  ExportWaveAsCode: function(wave: Wave; const fileName: PUTF8Char): Boolean; cdecl;
  PlaySound: procedure(sound: Sound); cdecl;
  StopSound: procedure(sound: Sound); cdecl;
  PauseSound: procedure(sound: Sound); cdecl;
  ResumeSound: procedure(sound: Sound); cdecl;
  IsSoundPlaying: function(sound: Sound): Boolean; cdecl;
  SetSoundVolume: procedure(sound: Sound; volume: Single); cdecl;
  SetSoundPitch: procedure(sound: Sound; pitch: Single); cdecl;
  SetSoundPan: procedure(sound: Sound; pan: Single); cdecl;
  WaveCopy: function(wave: Wave): Wave; cdecl;
  WaveCrop: procedure(wave: PWave; initSample: Integer; finalSample: Integer); cdecl;
  WaveFormat: procedure(wave: PWave; sampleRate: Integer; sampleSize: Integer; channels: Integer); cdecl;
  LoadWaveSamples: function(wave: Wave): PSingle; cdecl;
  UnloadWaveSamples: procedure(samples: PSingle); cdecl;
  LoadMusicStream: function(const fileName: PUTF8Char): Music; cdecl;
  LoadMusicStreamFromMemory: function(const fileType: PUTF8Char; const data: PByte; dataSize: Integer): Music; cdecl;
  IsMusicReady: function(music: Music): Boolean; cdecl;
  UnloadMusicStream: procedure(music: Music); cdecl;
  PlayMusicStream: procedure(music: Music); cdecl;
  IsMusicStreamPlaying: function(music: Music): Boolean; cdecl;
  UpdateMusicStream: procedure(music: Music); cdecl;
  StopMusicStream: procedure(music: Music); cdecl;
  PauseMusicStream: procedure(music: Music); cdecl;
  ResumeMusicStream: procedure(music: Music); cdecl;
  SeekMusicStream: procedure(music: Music; position: Single); cdecl;
  SetMusicVolume: procedure(music: Music; volume: Single); cdecl;
  SetMusicPitch: procedure(music: Music; pitch: Single); cdecl;
  SetMusicPan: procedure(music: Music; pan: Single); cdecl;
  GetMusicTimeLength: function(music: Music): Single; cdecl;
  GetMusicTimePlayed: function(music: Music): Single; cdecl;
  LoadAudioStream: function(sampleRate: Cardinal; sampleSize: Cardinal; channels: Cardinal): AudioStream; cdecl;
  IsAudioStreamReady: function(stream: AudioStream): Boolean; cdecl;
  UnloadAudioStream: procedure(stream: AudioStream); cdecl;
  UpdateAudioStream: procedure(stream: AudioStream; const data: Pointer; frameCount: Integer); cdecl;
  IsAudioStreamProcessed: function(stream: AudioStream): Boolean; cdecl;
  PlayAudioStream: procedure(stream: AudioStream); cdecl;
  PauseAudioStream: procedure(stream: AudioStream); cdecl;
  ResumeAudioStream: procedure(stream: AudioStream); cdecl;
  IsAudioStreamPlaying: function(stream: AudioStream): Boolean; cdecl;
  StopAudioStream: procedure(stream: AudioStream); cdecl;
  SetAudioStreamVolume: procedure(stream: AudioStream; volume: Single); cdecl;
  SetAudioStreamPitch: procedure(stream: AudioStream; pitch: Single); cdecl;
  SetAudioStreamPan: procedure(stream: AudioStream; pan: Single); cdecl;
  SetAudioStreamBufferSizeDefault: procedure(size: Integer); cdecl;
  SetAudioStreamCallback: procedure(stream: AudioStream; callback: AudioCallback); cdecl;
  AttachAudioStreamProcessor: procedure(stream: AudioStream; processor: AudioCallback); cdecl;
  DetachAudioStreamProcessor: procedure(stream: AudioStream; processor: AudioCallback); cdecl;
  AttachAudioMixedProcessor: procedure(processor: AudioCallback); cdecl;
  DetachAudioMixedProcessor: procedure(processor: AudioCallback); cdecl;
  Clamp: function(value: Single; min: Single; max: Single): Single; cdecl;
  Lerp: function(start: Single; end_: Single; amount: Single): Single; cdecl;
  Normalize: function(value: Single; start: Single; end_: Single): Single; cdecl;
  Remap: function(value: Single; inputStart: Single; inputEnd: Single; outputStart: Single; outputEnd: Single): Single; cdecl;
  Wrap: function(value: Single; min: Single; max: Single): Single; cdecl;
  FloatEquals: function(x: Single; y: Single): Integer; cdecl;
  Vector2Zero: function(): Vector2; cdecl;
  Vector2One: function(): Vector2; cdecl;
  Vector2Add: function(v1: Vector2; v2: Vector2): Vector2; cdecl;
  Vector2AddValue: function(v: Vector2; add: Single): Vector2; cdecl;
  Vector2Subtract: function(v1: Vector2; v2: Vector2): Vector2; cdecl;
  Vector2SubtractValue: function(v: Vector2; sub: Single): Vector2; cdecl;
  Vector2Length: function(v: Vector2): Single; cdecl;
  Vector2LengthSqr: function(v: Vector2): Single; cdecl;
  Vector2DotProduct: function(v1: Vector2; v2: Vector2): Single; cdecl;
  Vector2Distance: function(v1: Vector2; v2: Vector2): Single; cdecl;
  Vector2DistanceSqr: function(v1: Vector2; v2: Vector2): Single; cdecl;
  Vector2Angle: function(v1: Vector2; v2: Vector2): Single; cdecl;
  Vector2LineAngle: function(start: Vector2; end_: Vector2): Single; cdecl;
  Vector2Scale: function(v: Vector2; scale: Single): Vector2; cdecl;
  Vector2Multiply: function(v1: Vector2; v2: Vector2): Vector2; cdecl;
  Vector2Negate: function(v: Vector2): Vector2; cdecl;
  Vector2Divide: function(v1: Vector2; v2: Vector2): Vector2; cdecl;
  Vector2Normalize: function(v: Vector2): Vector2; cdecl;
  Vector2Transform: function(v: Vector2; mat: Matrix): Vector2; cdecl;
  Vector2Lerp: function(v1: Vector2; v2: Vector2; amount: Single): Vector2; cdecl;
  Vector2Reflect: function(v: Vector2; normal: Vector2): Vector2; cdecl;
  Vector2Rotate: function(v: Vector2; angle: Single): Vector2; cdecl;
  Vector2MoveTowards: function(v: Vector2; target: Vector2; maxDistance: Single): Vector2; cdecl;
  Vector2Invert: function(v: Vector2): Vector2; cdecl;
  Vector2Clamp: function(v: Vector2; min: Vector2; max: Vector2): Vector2; cdecl;
  Vector2ClampValue: function(v: Vector2; min: Single; max: Single): Vector2; cdecl;
  Vector2Equals: function(p: Vector2; q: Vector2): Integer; cdecl;
  Vector3Zero: function(): Vector3; cdecl;
  Vector3One: function(): Vector3; cdecl;
  Vector3Add: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3AddValue: function(v: Vector3; add: Single): Vector3; cdecl;
  Vector3Subtract: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3SubtractValue: function(v: Vector3; sub: Single): Vector3; cdecl;
  Vector3Scale: function(v: Vector3; scalar: Single): Vector3; cdecl;
  Vector3Multiply: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3CrossProduct: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3Perpendicular: function(v: Vector3): Vector3; cdecl;
  Vector3Length: function(const v: Vector3): Single; cdecl;
  Vector3LengthSqr: function(const v: Vector3): Single; cdecl;
  Vector3DotProduct: function(v1: Vector3; v2: Vector3): Single; cdecl;
  Vector3Distance: function(v1: Vector3; v2: Vector3): Single; cdecl;
  Vector3DistanceSqr: function(v1: Vector3; v2: Vector3): Single; cdecl;
  Vector3Angle: function(v1: Vector3; v2: Vector3): Single; cdecl;
  Vector3Negate: function(v: Vector3): Vector3; cdecl;
  Vector3Divide: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3Normalize: function(v: Vector3): Vector3; cdecl;
  Vector3OrthoNormalize: procedure(v1: PVector3; v2: PVector3); cdecl;
  Vector3Transform: function(v: Vector3; mat: Matrix): Vector3; cdecl;
  Vector3RotateByQuaternion: function(v: Vector3; q: Quaternion): Vector3; cdecl;
  Vector3RotateByAxisAngle: function(v: Vector3; axis: Vector3; angle: Single): Vector3; cdecl;
  Vector3Lerp: function(v1: Vector3; v2: Vector3; amount: Single): Vector3; cdecl;
  Vector3Reflect: function(v: Vector3; normal: Vector3): Vector3; cdecl;
  Vector3Min: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3Max: function(v1: Vector3; v2: Vector3): Vector3; cdecl;
  Vector3Barycenter: function(p: Vector3; a: Vector3; b: Vector3; c: Vector3): Vector3; cdecl;
  Vector3Unproject: function(source: Vector3; projection: Matrix; view: Matrix): Vector3; cdecl;
  Vector3ToFloatV: function(v: Vector3): float3; cdecl;
  Vector3Invert: function(v: Vector3): Vector3; cdecl;
  Vector3Clamp: function(v: Vector3; min: Vector3; max: Vector3): Vector3; cdecl;
  Vector3ClampValue: function(v: Vector3; min: Single; max: Single): Vector3; cdecl;
  Vector3Equals: function(p: Vector3; q: Vector3): Integer; cdecl;
  Vector3Refract: function(v: Vector3; n: Vector3; r: Single): Vector3; cdecl;
  MatrixDeterminant: function(mat: Matrix): Single; cdecl;
  MatrixTrace: function(mat: Matrix): Single; cdecl;
  MatrixTranspose: function(mat: Matrix): Matrix; cdecl;
  MatrixInvert: function(mat: Matrix): Matrix; cdecl;
  MatrixIdentity: function(): Matrix; cdecl;
  MatrixAdd: function(left: Matrix; right: Matrix): Matrix; cdecl;
  MatrixSubtract: function(left: Matrix; right: Matrix): Matrix; cdecl;
  MatrixMultiply: function(left: Matrix; right: Matrix): Matrix; cdecl;
  MatrixTranslate: function(x: Single; y: Single; z: Single): Matrix; cdecl;
  MatrixRotate: function(axis: Vector3; angle: Single): Matrix; cdecl;
  MatrixRotateX: function(angle: Single): Matrix; cdecl;
  MatrixRotateY: function(angle: Single): Matrix; cdecl;
  MatrixRotateZ: function(angle: Single): Matrix; cdecl;
  MatrixRotateXYZ: function(angle: Vector3): Matrix; cdecl;
  MatrixRotateZYX: function(angle: Vector3): Matrix; cdecl;
  MatrixScale: function(x: Single; y: Single; z: Single): Matrix; cdecl;
  MatrixFrustum: function(left: Double; right: Double; bottom: Double; top: Double; near_: Double; far_: Double): Matrix; cdecl;
  MatrixPerspective: function(fovy: Double; aspect: Double; near_: Double; far_: Double): Matrix; cdecl;
  MatrixOrtho: function(left: Double; right: Double; bottom: Double; top: Double; near_: Double; far_: Double): Matrix; cdecl;
  MatrixLookAt: function(eye: Vector3; target: Vector3; up: Vector3): Matrix; cdecl;
  MatrixToFloatV: function(mat: Matrix): float16; cdecl;
  QuaternionAdd: function(q1: Quaternion; q2: Quaternion): Quaternion; cdecl;
  QuaternionAddValue: function(q: Quaternion; add: Single): Quaternion; cdecl;
  QuaternionSubtract: function(q1: Quaternion; q2: Quaternion): Quaternion; cdecl;
  QuaternionSubtractValue: function(q: Quaternion; sub: Single): Quaternion; cdecl;
  QuaternionIdentity: function(): Quaternion; cdecl;
  QuaternionLength: function(q: Quaternion): Single; cdecl;
  QuaternionNormalize: function(q: Quaternion): Quaternion; cdecl;
  QuaternionInvert: function(q: Quaternion): Quaternion; cdecl;
  QuaternionMultiply: function(q1: Quaternion; q2: Quaternion): Quaternion; cdecl;
  QuaternionScale: function(q: Quaternion; mul: Single): Quaternion; cdecl;
  QuaternionDivide: function(q1: Quaternion; q2: Quaternion): Quaternion; cdecl;
  QuaternionLerp: function(q1: Quaternion; q2: Quaternion; amount: Single): Quaternion; cdecl;
  QuaternionNlerp: function(q1: Quaternion; q2: Quaternion; amount: Single): Quaternion; cdecl;
  QuaternionSlerp: function(q1: Quaternion; q2: Quaternion; amount: Single): Quaternion; cdecl;
  QuaternionFromVector3ToVector3: function(from: Vector3; to_: Vector3): Quaternion; cdecl;
  QuaternionFromMatrix: function(mat: Matrix): Quaternion; cdecl;
  QuaternionToMatrix: function(q: Quaternion): Matrix; cdecl;
  QuaternionFromAxisAngle: function(axis: Vector3; angle: Single): Quaternion; cdecl;
  QuaternionToAxisAngle: procedure(q: Quaternion; outAxis: PVector3; outAngle: PSingle); cdecl;
  QuaternionFromEuler: function(pitch: Single; yaw: Single; roll: Single): Quaternion; cdecl;
  QuaternionToEuler: function(q: Quaternion): Vector3; cdecl;
  QuaternionTransform: function(q: Quaternion; mat: Matrix): Quaternion; cdecl;
  QuaternionEquals: function(p: Quaternion; q: Quaternion): Integer; cdecl;
  rlMatrixMode: procedure(mode: Integer); cdecl;
  rlPushMatrix: procedure(); cdecl;
  rlPopMatrix: procedure(); cdecl;
  rlLoadIdentity: procedure(); cdecl;
  rlTranslatef: procedure(x: Single; y: Single; z: Single); cdecl;
  rlRotatef: procedure(angle: Single; x: Single; y: Single; z: Single); cdecl;
  rlScalef: procedure(x: Single; y: Single; z: Single); cdecl;
  rlMultMatrixf: procedure(const matf: PSingle); cdecl;
  rlFrustum: procedure(left: Double; right: Double; bottom: Double; top: Double; znear: Double; zfar: Double); cdecl;
  rlOrtho: procedure(left: Double; right: Double; bottom: Double; top: Double; znear: Double; zfar: Double); cdecl;
  rlViewport: procedure(x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  rlBegin: procedure(mode: Integer); cdecl;
  rlEnd: procedure(); cdecl;
  rlVertex2i: procedure(x: Integer; y: Integer); cdecl;
  rlVertex2f: procedure(x: Single; y: Single); cdecl;
  rlVertex3f: procedure(x: Single; y: Single; z: Single); cdecl;
  rlTexCoord2f: procedure(x: Single; y: Single); cdecl;
  rlNormal3f: procedure(x: Single; y: Single; z: Single); cdecl;
  rlColor4ub: procedure(r: Byte; g: Byte; b: Byte; a: Byte); cdecl;
  rlColor3f: procedure(x: Single; y: Single; z: Single); cdecl;
  rlColor4f: procedure(x: Single; y: Single; z: Single; w: Single); cdecl;
  rlEnableVertexArray: function(vaoId: Cardinal): Boolean; cdecl;
  rlDisableVertexArray: procedure(); cdecl;
  rlEnableVertexBuffer: procedure(id: Cardinal); cdecl;
  rlDisableVertexBuffer: procedure(); cdecl;
  rlEnableVertexBufferElement: procedure(id: Cardinal); cdecl;
  rlDisableVertexBufferElement: procedure(); cdecl;
  rlEnableVertexAttribute: procedure(index: Cardinal); cdecl;
  rlDisableVertexAttribute: procedure(index: Cardinal); cdecl;
  rlActiveTextureSlot: procedure(slot: Integer); cdecl;
  rlEnableTexture: procedure(id: Cardinal); cdecl;
  rlDisableTexture: procedure(); cdecl;
  rlEnableTextureCubemap: procedure(id: Cardinal); cdecl;
  rlDisableTextureCubemap: procedure(); cdecl;
  rlTextureParameters: procedure(id: Cardinal; param: Integer; value: Integer); cdecl;
  rlCubemapParameters: procedure(id: Cardinal; param: Integer; value: Integer); cdecl;
  rlEnableShader: procedure(id: Cardinal); cdecl;
  rlDisableShader: procedure(); cdecl;
  rlEnableFramebuffer: procedure(id: Cardinal); cdecl;
  rlDisableFramebuffer: procedure(); cdecl;
  rlActiveDrawBuffers: procedure(count: Integer); cdecl;
  rlEnableColorBlend: procedure(); cdecl;
  rlDisableColorBlend: procedure(); cdecl;
  rlEnableDepthTest: procedure(); cdecl;
  rlDisableDepthTest: procedure(); cdecl;
  rlEnableDepthMask: procedure(); cdecl;
  rlDisableDepthMask: procedure(); cdecl;
  rlEnableBackfaceCulling: procedure(); cdecl;
  rlDisableBackfaceCulling: procedure(); cdecl;
  rlSetCullFace: procedure(mode: Integer); cdecl;
  rlEnableScissorTest: procedure(); cdecl;
  rlDisableScissorTest: procedure(); cdecl;
  rlScissor: procedure(x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  rlEnableWireMode: procedure(); cdecl;
  rlDisableWireMode: procedure(); cdecl;
  rlSetLineWidth: procedure(width: Single); cdecl;
  rlGetLineWidth: function(): Single; cdecl;
  rlEnableSmoothLines: procedure(); cdecl;
  rlDisableSmoothLines: procedure(); cdecl;
  rlEnableStereoRender: procedure(); cdecl;
  rlDisableStereoRender: procedure(); cdecl;
  rlIsStereoRenderEnabled: function(): Boolean; cdecl;
  rlClearColor: procedure(r: Byte; g: Byte; b: Byte; a: Byte); cdecl;
  rlClearScreenBuffers: procedure(); cdecl;
  rlCheckErrors: procedure(); cdecl;
  rlSetBlendMode: procedure(mode: Integer); cdecl;
  rlSetBlendFactors: procedure(glSrcFactor: Integer; glDstFactor: Integer; glEquation: Integer); cdecl;
  rlSetBlendFactorsSeparate: procedure(glSrcRGB: Integer; glDstRGB: Integer; glSrcAlpha: Integer; glDstAlpha: Integer; glEqRGB: Integer; glEqAlpha: Integer); cdecl;
  rlglInit: procedure(width: Integer; height: Integer); cdecl;
  rlglClose: procedure(); cdecl;
  rlLoadExtensions: procedure(loader: Pointer); cdecl;
  rlGetVersion: function(): Integer; cdecl;
  rlSetFramebufferWidth: procedure(width: Integer); cdecl;
  rlGetFramebufferWidth: function(): Integer; cdecl;
  rlSetFramebufferHeight: procedure(height: Integer); cdecl;
  rlGetFramebufferHeight: function(): Integer; cdecl;
  rlGetTextureIdDefault: function(): Cardinal; cdecl;
  rlGetShaderIdDefault: function(): Cardinal; cdecl;
  rlGetShaderLocsDefault: function(): PInteger; cdecl;
  rlLoadRenderBatch: function(numBuffers: Integer; bufferElements: Integer): rlRenderBatch; cdecl;
  rlUnloadRenderBatch: procedure(batch: rlRenderBatch); cdecl;
  rlDrawRenderBatch: procedure(batch: PrlRenderBatch); cdecl;
  rlSetRenderBatchActive: procedure(batch: PrlRenderBatch); cdecl;
  rlDrawRenderBatchActive: procedure(); cdecl;
  rlCheckRenderBatchLimit: function(vCount: Integer): Boolean; cdecl;
  rlSetTexture: procedure(id: Cardinal); cdecl;
  rlLoadVertexArray: function(): Cardinal; cdecl;
  rlLoadVertexBuffer: function(const buffer: Pointer; size: Integer; dynamic_: Boolean): Cardinal; cdecl;
  rlLoadVertexBufferElement: function(const buffer: Pointer; size: Integer; dynamic_: Boolean): Cardinal; cdecl;
  rlUpdateVertexBuffer: procedure(bufferId: Cardinal; const data: Pointer; dataSize: Integer; offset: Integer); cdecl;
  rlUpdateVertexBufferElements: procedure(id: Cardinal; const data: Pointer; dataSize: Integer; offset: Integer); cdecl;
  rlUnloadVertexArray: procedure(vaoId: Cardinal); cdecl;
  rlUnloadVertexBuffer: procedure(vboId: Cardinal); cdecl;
  rlSetVertexAttribute: procedure(index: Cardinal; compSize: Integer; type_: Integer; normalized: Boolean; stride: Integer; const pointer: Pointer); cdecl;
  rlSetVertexAttributeDivisor: procedure(index: Cardinal; divisor: Integer); cdecl;
  rlSetVertexAttributeDefault: procedure(locIndex: Integer; const value: Pointer; attribType: Integer; count: Integer); cdecl;
  rlDrawVertexArray: procedure(offset: Integer; count: Integer); cdecl;
  rlDrawVertexArrayElements: procedure(offset: Integer; count: Integer; const buffer: Pointer); cdecl;
  rlDrawVertexArrayInstanced: procedure(offset: Integer; count: Integer; instances: Integer); cdecl;
  rlDrawVertexArrayElementsInstanced: procedure(offset: Integer; count: Integer; const buffer: Pointer; instances: Integer); cdecl;
  rlLoadTexture: function(const data: Pointer; width: Integer; height: Integer; format: Integer; mipmapCount: Integer): Cardinal; cdecl;
  rlLoadTextureDepth: function(width: Integer; height: Integer; useRenderBuffer: Boolean): Cardinal; cdecl;
  rlLoadTextureCubemap: function(const data: Pointer; size: Integer; format: Integer): Cardinal; cdecl;
  rlUpdateTexture: procedure(id: Cardinal; offsetX: Integer; offsetY: Integer; width: Integer; height: Integer; format: Integer; const data: Pointer); cdecl;
  rlGetGlTextureFormats: procedure(format: Integer; glInternalFormat: PCardinal; glFormat: PCardinal; glType: PCardinal); cdecl;
  rlGetPixelFormatName: function(format: Cardinal): PUTF8Char; cdecl;
  rlUnloadTexture: procedure(id: Cardinal); cdecl;
  rlGenTextureMipmaps: procedure(id: Cardinal; width: Integer; height: Integer; format: Integer; mipmaps: PInteger); cdecl;
  rlReadTexturePixels: function(id: Cardinal; width: Integer; height: Integer; format: Integer): Pointer; cdecl;
  rlReadScreenPixels: function(width: Integer; height: Integer): PByte; cdecl;
  rlLoadFramebuffer: function(width: Integer; height: Integer): Cardinal; cdecl;
  rlFramebufferAttach: procedure(fboId: Cardinal; texId: Cardinal; attachType: Integer; texType: Integer; mipLevel: Integer); cdecl;
  rlFramebufferComplete: function(id: Cardinal): Boolean; cdecl;
  rlUnloadFramebuffer: procedure(id: Cardinal); cdecl;
  rlLoadShaderCode: function(const vsCode: PUTF8Char; const fsCode: PUTF8Char): Cardinal; cdecl;
  rlCompileShader: function(const shaderCode: PUTF8Char; type_: Integer): Cardinal; cdecl;
  rlLoadShaderProgram: function(vShaderId: Cardinal; fShaderId: Cardinal): Cardinal; cdecl;
  rlUnloadShaderProgram: procedure(id: Cardinal); cdecl;
  rlGetLocationUniform: function(shaderId: Cardinal; const uniformName: PUTF8Char): Integer; cdecl;
  rlGetLocationAttrib: function(shaderId: Cardinal; const attribName: PUTF8Char): Integer; cdecl;
  rlSetUniform: procedure(locIndex: Integer; const value: Pointer; uniformType: Integer; count: Integer); cdecl;
  rlSetUniformMatrix: procedure(locIndex: Integer; mat: Matrix); cdecl;
  rlSetUniformSampler: procedure(locIndex: Integer; textureId: Cardinal); cdecl;
  rlSetShader: procedure(id: Cardinal; locs: PInteger); cdecl;
  rlLoadComputeShaderProgram: function(shaderId: Cardinal): Cardinal; cdecl;
  rlComputeShaderDispatch: procedure(groupX: Cardinal; groupY: Cardinal; groupZ: Cardinal); cdecl;
  rlLoadShaderBuffer: function(size: Cardinal; const data: Pointer; usageHint: Integer): Cardinal; cdecl;
  rlUnloadShaderBuffer: procedure(ssboId: Cardinal); cdecl;
  rlUpdateShaderBuffer: procedure(id: Cardinal; const data: Pointer; dataSize: Cardinal; offset: Cardinal); cdecl;
  rlBindShaderBuffer: procedure(id: Cardinal; index: Cardinal); cdecl;
  rlReadShaderBuffer: procedure(id: Cardinal; dest: Pointer; count: Cardinal; offset: Cardinal); cdecl;
  rlCopyShaderBuffer: procedure(destId: Cardinal; srcId: Cardinal; destOffset: Cardinal; srcOffset: Cardinal; count: Cardinal); cdecl;
  rlGetShaderBufferSize: function(id: Cardinal): Cardinal; cdecl;
  rlBindImageTexture: procedure(id: Cardinal; index: Cardinal; format: Integer; readonly: Boolean); cdecl;
  rlGetMatrixModelview: function(): Matrix; cdecl;
  rlGetMatrixProjection: function(): Matrix; cdecl;
  rlGetMatrixTransform: function(): Matrix; cdecl;
  rlGetMatrixProjectionStereo: function(eye: Integer): Matrix; cdecl;
  rlGetMatrixViewOffsetStereo: function(eye: Integer): Matrix; cdecl;
  rlSetMatrixProjection: procedure(proj: Matrix); cdecl;
  rlSetMatrixModelview: procedure(view: Matrix); cdecl;
  rlSetMatrixProjectionStereo: procedure(right: Matrix; left: Matrix); cdecl;
  rlSetMatrixViewOffsetStereo: procedure(right: Matrix; left: Matrix); cdecl;
  rlLoadDrawCube: procedure(); cdecl;
  rlLoadDrawQuad: procedure(); cdecl;
  GuiEnable: procedure(); cdecl;
  GuiDisable: procedure(); cdecl;
  GuiLock: procedure(); cdecl;
  GuiUnlock: procedure(); cdecl;
  GuiIsLocked: function(): Boolean; cdecl;
  GuiFade: procedure(alpha: Single); cdecl;
  GuiSetState: procedure(state: Integer); cdecl;
  GuiGetState: function(): Integer; cdecl;
  GuiSetFont: procedure(font: Font); cdecl;
  GuiGetFont: function(): Font; cdecl;
  GuiSetStyle: procedure(control: Integer; property_: Integer; value: Integer); cdecl;
  GuiGetStyle: function(control: Integer; property_: Integer): Integer; cdecl;
  GuiWindowBox: function(bounds: Rectangle; const title: PUTF8Char): Boolean; cdecl;
  GuiGroupBox: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiLine: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiPanel: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiTabBar: function(bounds: Rectangle; text: PPUTF8Char; count: Integer; active: PInteger): Integer; cdecl;
  GuiScrollPanel: function(bounds: Rectangle; const text: PUTF8Char; content: Rectangle; scroll: PVector2): Rectangle; cdecl;
  GuiLabel: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiButton: function(bounds: Rectangle; const text: PUTF8Char): Boolean; cdecl;
  GuiLabelButton: function(bounds: Rectangle; const text: PUTF8Char): Boolean; cdecl;
  GuiToggle: function(bounds: Rectangle; const text: PUTF8Char; active: Boolean): Boolean; cdecl;
  GuiToggleGroup: function(bounds: Rectangle; const text: PUTF8Char; active: Integer): Integer; cdecl;
  GuiCheckBox: function(bounds: Rectangle; const text: PUTF8Char; checked: Boolean): Boolean; cdecl;
  GuiComboBox: function(bounds: Rectangle; const text: PUTF8Char; active: Integer): Integer; cdecl;
  GuiDropdownBox: function(bounds: Rectangle; const text: PUTF8Char; active: PInteger; editMode: Boolean): Boolean; cdecl;
  GuiSpinner: function(bounds: Rectangle; const text: PUTF8Char; value: PInteger; minValue: Integer; maxValue: Integer; editMode: Boolean): Boolean; cdecl;
  GuiValueBox: function(bounds: Rectangle; const text: PUTF8Char; value: PInteger; minValue: Integer; maxValue: Integer; editMode: Boolean): Boolean; cdecl;
  GuiTextBox: function(bounds: Rectangle; text: PUTF8Char; textSize: Integer; editMode: Boolean): Boolean; cdecl;
  GuiTextBoxMulti: function(bounds: Rectangle; text: PUTF8Char; textSize: Integer; editMode: Boolean): Boolean; cdecl;
  GuiSlider: function(bounds: Rectangle; const textLeft: PUTF8Char; const textRight: PUTF8Char; value: Single; minValue: Single; maxValue: Single): Single; cdecl;
  GuiSliderBar: function(bounds: Rectangle; const textLeft: PUTF8Char; const textRight: PUTF8Char; value: Single; minValue: Single; maxValue: Single): Single; cdecl;
  GuiProgressBar: function(bounds: Rectangle; const textLeft: PUTF8Char; const textRight: PUTF8Char; value: Single; minValue: Single; maxValue: Single): Single; cdecl;
  GuiStatusBar: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiDummyRec: procedure(bounds: Rectangle; const text: PUTF8Char); cdecl;
  GuiGrid: function(bounds: Rectangle; const text: PUTF8Char; spacing: Single; subdivs: Integer): Vector2; cdecl;
  GuiListView: function(bounds: Rectangle; const text: PUTF8Char; scrollIndex: PInteger; active: Integer): Integer; cdecl;
  GuiListViewEx: function(bounds: Rectangle; text: PPUTF8Char; count: Integer; focus: PInteger; scrollIndex: PInteger; active: Integer): Integer; cdecl;
  GuiMessageBox: function(bounds: Rectangle; const title: PUTF8Char; const message_: PUTF8Char; const buttons: PUTF8Char): Integer; cdecl;
  GuiTextInputBox: function(bounds: Rectangle; const title: PUTF8Char; const message_: PUTF8Char; const buttons: PUTF8Char; text: PUTF8Char; textMaxSize: Integer; secretViewActive: PInteger): Integer; cdecl;
  GuiColorPicker: function(bounds: Rectangle; const text: PUTF8Char; color: Color): Color; cdecl;
  GuiColorPanel: function(bounds: Rectangle; const text: PUTF8Char; color: Color): Color; cdecl;
  GuiColorBarAlpha: function(bounds: Rectangle; const text: PUTF8Char; alpha: Single): Single; cdecl;
  GuiColorBarHue: function(bounds: Rectangle; const text: PUTF8Char; value: Single): Single; cdecl;
  GuiLoadStyle: procedure(const fileName: PUTF8Char); cdecl;
  GuiLoadStyleDefault: procedure(); cdecl;
  GuiEnableTooltip: procedure(); cdecl;
  GuiDisableTooltip: procedure(); cdecl;
  GuiSetTooltip: procedure(const tooltip: PUTF8Char); cdecl;
  GuiIconText: function(iconId: Integer; const text: PUTF8Char): PUTF8Char; cdecl;
  GuiGetIcons: function(): PCardinal; cdecl;
  GuiLoadIcons: function(const fileName: PUTF8Char; loadIconsName: Boolean): PPUTF8Char; cdecl;
  GuiDrawIcon: procedure(iconId: Integer; posX: Integer; posY: Integer; pixelSize: Integer; color: Color); cdecl;
  GuiSetIconScale: procedure(scale: Integer); cdecl;
  InitPhysics: procedure(); cdecl;
  UpdatePhysics: procedure(); cdecl;
  ResetPhysics: procedure(); cdecl;
  ClosePhysics: procedure(); cdecl;
  SetPhysicsTimeStep: procedure(delta: Double); cdecl;
  SetPhysicsGravity: procedure(x: Single; y: Single); cdecl;
  CreatePhysicsBodyCircle: function(pos: Vector2; radius: Single; density: Single): PhysicsBody; cdecl;
  CreatePhysicsBodyRectangle: function(pos: Vector2; width: Single; height: Single; density: Single): PhysicsBody; cdecl;
  CreatePhysicsBodyPolygon: function(pos: Vector2; radius: Single; sides: Integer; density: Single): PhysicsBody; cdecl;
  DestroyPhysicsBody: procedure(body: PhysicsBody); cdecl;
  PhysicsAddForce: procedure(body: PhysicsBody; force: Vector2); cdecl;
  PhysicsAddTorque: procedure(body: PhysicsBody; amount: Single); cdecl;
  PhysicsShatter: procedure(body: PhysicsBody; position: Vector2; force: Single); cdecl;
  SetPhysicsBodyRotation: procedure(body: PhysicsBody; radians: Single); cdecl;
  GetPhysicsBody: function(index: Integer): PhysicsBody; cdecl;
  GetPhysicsBodiesCount: function(): Integer; cdecl;
  GetPhysicsShapeType: function(index: Integer): Integer; cdecl;
  GetPhysicsShapeVerticesCount: function(index: Integer): Integer; cdecl;
  GetPhysicsShapeVertex: function(body: PhysicsBody; vertex: Integer): Vector2; cdecl;
  plm_create_with_filename: function(const filename: PUTF8Char): Pplm_t; cdecl;
  plm_create_with_file: function(fh: PPointer; close_when_done: Integer): Pplm_t; cdecl;
  plm_create_with_memory: function(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_t; cdecl;
  plm_create_with_buffer: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_t; cdecl;
  plm_destroy: procedure(self: Pplm_t); cdecl;
  plm_has_headers: function(self: Pplm_t): Integer; cdecl;
  plm_get_video_enabled: function(self: Pplm_t): Integer; cdecl;
  plm_set_video_enabled: procedure(self: Pplm_t; enabled: Integer); cdecl;
  plm_get_num_video_streams: function(self: Pplm_t): Integer; cdecl;
  plm_get_width: function(self: Pplm_t): Integer; cdecl;
  plm_get_height: function(self: Pplm_t): Integer; cdecl;
  plm_get_framerate: function(self: Pplm_t): Double; cdecl;
  plm_get_audio_enabled: function(self: Pplm_t): Integer; cdecl;
  plm_set_audio_enabled: procedure(self: Pplm_t; enabled: Integer); cdecl;
  plm_get_num_audio_streams: function(self: Pplm_t): Integer; cdecl;
  plm_set_audio_stream: procedure(self: Pplm_t; stream_index: Integer); cdecl;
  plm_get_samplerate: function(self: Pplm_t): Integer; cdecl;
  plm_get_audio_lead_time: function(self: Pplm_t): Double; cdecl;
  plm_set_audio_lead_time: procedure(self: Pplm_t; lead_time: Double); cdecl;
  plm_get_time: function(self: Pplm_t): Double; cdecl;
  plm_get_duration: function(self: Pplm_t): Double; cdecl;
  plm_rewind: procedure(self: Pplm_t); cdecl;
  plm_get_loop: function(self: Pplm_t): Integer; cdecl;
  plm_set_loop: procedure(self: Pplm_t; loop: Integer); cdecl;
  plm_has_ended: function(self: Pplm_t): Integer; cdecl;
  plm_set_video_decode_callback: procedure(self: Pplm_t; fp: plm_video_decode_callback; user: Pointer); cdecl;
  plm_set_audio_decode_callback: procedure(self: Pplm_t; fp: plm_audio_decode_callback; user: Pointer); cdecl;
  plm_decode: procedure(self: Pplm_t; seconds: Double); cdecl;
  plm_decode_video: function(self: Pplm_t): Pplm_frame_t; cdecl;
  plm_decode_audio: function(self: Pplm_t): Pplm_samples_t; cdecl;
  plm_seek: function(self: Pplm_t; time: Double; seek_exact: Integer): Integer; cdecl;
  plm_seek_frame: function(self: Pplm_t; time: Double; seek_exact: Integer): Pplm_frame_t; cdecl;
  plm_buffer_create_with_filename: function(const filename: PUTF8Char): Pplm_buffer_t; cdecl;
  plm_buffer_create_with_file: function(fh: PPointer; close_when_done: Integer): Pplm_buffer_t; cdecl;
  plm_buffer_create_with_memory: function(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_buffer_t; cdecl;
  plm_buffer_create_with_capacity: function(capacity: NativeUInt): Pplm_buffer_t; cdecl;
  plm_buffer_create_for_appending: function(initial_capacity: NativeUInt): Pplm_buffer_t; cdecl;
  plm_buffer_destroy: procedure(self: Pplm_buffer_t); cdecl;
  plm_buffer_write: function(self: Pplm_buffer_t; bytes: PUInt8; length: NativeUInt): NativeUInt; cdecl;
  plm_buffer_signal_end: procedure(self: Pplm_buffer_t); cdecl;
  plm_buffer_set_load_callback: procedure(self: Pplm_buffer_t; fp: plm_buffer_load_callback; user: Pointer); cdecl;
  plm_buffer_rewind: procedure(self: Pplm_buffer_t); cdecl;
  plm_buffer_get_size: function(self: Pplm_buffer_t): NativeUInt; cdecl;
  plm_buffer_get_remaining: function(self: Pplm_buffer_t): NativeUInt; cdecl;
  plm_buffer_has_ended: function(self: Pplm_buffer_t): Integer; cdecl;
  plm_demux_create: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_demux_t; cdecl;
  plm_demux_destroy: procedure(self: Pplm_demux_t); cdecl;
  plm_demux_has_headers: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_get_num_video_streams: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_get_num_audio_streams: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_rewind: procedure(self: Pplm_demux_t); cdecl;
  plm_demux_has_ended: function(self: Pplm_demux_t): Integer; cdecl;
  plm_demux_seek: function(self: Pplm_demux_t; time: Double; type_: Integer; force_intra: Integer): Pplm_packet_t; cdecl;
  plm_demux_get_start_time: function(self: Pplm_demux_t; type_: Integer): Double; cdecl;
  plm_demux_get_duration: function(self: Pplm_demux_t; type_: Integer): Double; cdecl;
  plm_demux_decode: function(self: Pplm_demux_t): Pplm_packet_t; cdecl;
  plm_video_create_with_buffer: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_video_t; cdecl;
  plm_video_destroy: procedure(self: Pplm_video_t); cdecl;
  plm_video_has_header: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_get_framerate: function(self: Pplm_video_t): Double; cdecl;
  plm_video_get_width: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_get_height: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_set_no_delay: procedure(self: Pplm_video_t; no_delay: Integer); cdecl;
  plm_video_get_time: function(self: Pplm_video_t): Double; cdecl;
  plm_video_set_time: procedure(self: Pplm_video_t; time: Double); cdecl;
  plm_video_rewind: procedure(self: Pplm_video_t); cdecl;
  plm_video_has_ended: function(self: Pplm_video_t): Integer; cdecl;
  plm_video_decode: function(self: Pplm_video_t): Pplm_frame_t; cdecl;
  plm_frame_to_rgb: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_bgr: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_rgba: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_bgra: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_argb: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_frame_to_abgr: procedure(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  plm_audio_create_with_buffer: function(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_audio_t; cdecl;
  plm_audio_destroy: procedure(self: Pplm_audio_t); cdecl;
  plm_audio_has_header: function(self: Pplm_audio_t): Integer; cdecl;
  plm_audio_get_samplerate: function(self: Pplm_audio_t): Integer; cdecl;
  plm_audio_get_time: function(self: Pplm_audio_t): Double; cdecl;
  plm_audio_set_time: procedure(self: Pplm_audio_t; time: Double); cdecl;
  plm_audio_rewind: procedure(self: Pplm_audio_t); cdecl;
  plm_audio_has_ended: function(self: Pplm_audio_t): Integer; cdecl;
  plm_audio_decode: function(self: Pplm_audio_t): Pplm_samples_t; cdecl;

implementation

{$R raylib.res}

uses
  Classes,
  Windows,
  SysUtils,
  StrUtils;

procedure GetExports(const aDLLHandle: THandle);
begin
{$REGION 'Exports'}
  if aDllHandle = 0 then Exit;
  AttachAudioMixedProcessor := GetProcAddress(aDLLHandle, 'AttachAudioMixedProcessor');
  AttachAudioStreamProcessor := GetProcAddress(aDLLHandle, 'AttachAudioStreamProcessor');
  BeginBlendMode := GetProcAddress(aDLLHandle, 'BeginBlendMode');
  BeginDrawing := GetProcAddress(aDLLHandle, 'BeginDrawing');
  BeginMode2D := GetProcAddress(aDLLHandle, 'BeginMode2D');
  BeginMode3D := GetProcAddress(aDLLHandle, 'BeginMode3D');
  BeginScissorMode := GetProcAddress(aDLLHandle, 'BeginScissorMode');
  BeginShaderMode := GetProcAddress(aDLLHandle, 'BeginShaderMode');
  BeginTextureMode := GetProcAddress(aDLLHandle, 'BeginTextureMode');
  BeginVrStereoMode := GetProcAddress(aDLLHandle, 'BeginVrStereoMode');
  ChangeDirectory := GetProcAddress(aDLLHandle, 'ChangeDirectory');
  CheckCollisionBoxes := GetProcAddress(aDLLHandle, 'CheckCollisionBoxes');
  CheckCollisionBoxSphere := GetProcAddress(aDLLHandle, 'CheckCollisionBoxSphere');
  CheckCollisionCircleRec := GetProcAddress(aDLLHandle, 'CheckCollisionCircleRec');
  CheckCollisionCircles := GetProcAddress(aDLLHandle, 'CheckCollisionCircles');
  CheckCollisionLines := GetProcAddress(aDLLHandle, 'CheckCollisionLines');
  CheckCollisionPointCircle := GetProcAddress(aDLLHandle, 'CheckCollisionPointCircle');
  CheckCollisionPointLine := GetProcAddress(aDLLHandle, 'CheckCollisionPointLine');
  CheckCollisionPointPoly := GetProcAddress(aDLLHandle, 'CheckCollisionPointPoly');
  CheckCollisionPointRec := GetProcAddress(aDLLHandle, 'CheckCollisionPointRec');
  CheckCollisionPointTriangle := GetProcAddress(aDLLHandle, 'CheckCollisionPointTriangle');
  CheckCollisionRecs := GetProcAddress(aDLLHandle, 'CheckCollisionRecs');
  CheckCollisionSpheres := GetProcAddress(aDLLHandle, 'CheckCollisionSpheres');
  Clamp := GetProcAddress(aDLLHandle, 'Clamp');
  ClearBackground := GetProcAddress(aDLLHandle, 'ClearBackground');
  ClearWindowState := GetProcAddress(aDLLHandle, 'ClearWindowState');
  CloseAudioDevice := GetProcAddress(aDLLHandle, 'CloseAudioDevice');
  ClosePhysics := GetProcAddress(aDLLHandle, 'ClosePhysics');
  CloseWindow := GetProcAddress(aDLLHandle, 'CloseWindow');
  CodepointToUTF8 := GetProcAddress(aDLLHandle, 'CodepointToUTF8');
  ColorAlpha := GetProcAddress(aDLLHandle, 'ColorAlpha');
  ColorAlphaBlend := GetProcAddress(aDLLHandle, 'ColorAlphaBlend');
  ColorBrightness := GetProcAddress(aDLLHandle, 'ColorBrightness');
  ColorContrast := GetProcAddress(aDLLHandle, 'ColorContrast');
  ColorFromHSV := GetProcAddress(aDLLHandle, 'ColorFromHSV');
  ColorFromNormalized := GetProcAddress(aDLLHandle, 'ColorFromNormalized');
  ColorNormalize := GetProcAddress(aDLLHandle, 'ColorNormalize');
  ColorTint := GetProcAddress(aDLLHandle, 'ColorTint');
  ColorToHSV := GetProcAddress(aDLLHandle, 'ColorToHSV');
  ColorToInt := GetProcAddress(aDLLHandle, 'ColorToInt');
  CompressData := GetProcAddress(aDLLHandle, 'CompressData');
  CreatePhysicsBodyCircle := GetProcAddress(aDLLHandle, 'CreatePhysicsBodyCircle');
  CreatePhysicsBodyPolygon := GetProcAddress(aDLLHandle, 'CreatePhysicsBodyPolygon');
  CreatePhysicsBodyRectangle := GetProcAddress(aDLLHandle, 'CreatePhysicsBodyRectangle');
  DecodeDataBase64 := GetProcAddress(aDLLHandle, 'DecodeDataBase64');
  DecompressData := GetProcAddress(aDLLHandle, 'DecompressData');
  DestroyPhysicsBody := GetProcAddress(aDLLHandle, 'DestroyPhysicsBody');
  DetachAudioMixedProcessor := GetProcAddress(aDLLHandle, 'DetachAudioMixedProcessor');
  DetachAudioStreamProcessor := GetProcAddress(aDLLHandle, 'DetachAudioStreamProcessor');
  DirectoryExists := GetProcAddress(aDLLHandle, 'DirectoryExists');
  DisableCursor := GetProcAddress(aDLLHandle, 'DisableCursor');
  DisableEventWaiting := GetProcAddress(aDLLHandle, 'DisableEventWaiting');
  DrawBillboard := GetProcAddress(aDLLHandle, 'DrawBillboard');
  DrawBillboardPro := GetProcAddress(aDLLHandle, 'DrawBillboardPro');
  DrawBillboardRec := GetProcAddress(aDLLHandle, 'DrawBillboardRec');
  DrawBoundingBox := GetProcAddress(aDLLHandle, 'DrawBoundingBox');
  DrawCapsule := GetProcAddress(aDLLHandle, 'DrawCapsule');
  DrawCapsuleWires := GetProcAddress(aDLLHandle, 'DrawCapsuleWires');
  DrawCircle := GetProcAddress(aDLLHandle, 'DrawCircle');
  DrawCircle3D := GetProcAddress(aDLLHandle, 'DrawCircle3D');
  DrawCircleGradient := GetProcAddress(aDLLHandle, 'DrawCircleGradient');
  DrawCircleLines := GetProcAddress(aDLLHandle, 'DrawCircleLines');
  DrawCircleSector := GetProcAddress(aDLLHandle, 'DrawCircleSector');
  DrawCircleSectorLines := GetProcAddress(aDLLHandle, 'DrawCircleSectorLines');
  DrawCircleV := GetProcAddress(aDLLHandle, 'DrawCircleV');
  DrawCube := GetProcAddress(aDLLHandle, 'DrawCube');
  DrawCubeV := GetProcAddress(aDLLHandle, 'DrawCubeV');
  DrawCubeWires := GetProcAddress(aDLLHandle, 'DrawCubeWires');
  DrawCubeWiresV := GetProcAddress(aDLLHandle, 'DrawCubeWiresV');
  DrawCylinder := GetProcAddress(aDLLHandle, 'DrawCylinder');
  DrawCylinderEx := GetProcAddress(aDLLHandle, 'DrawCylinderEx');
  DrawCylinderWires := GetProcAddress(aDLLHandle, 'DrawCylinderWires');
  DrawCylinderWiresEx := GetProcAddress(aDLLHandle, 'DrawCylinderWiresEx');
  DrawEllipse := GetProcAddress(aDLLHandle, 'DrawEllipse');
  DrawEllipseLines := GetProcAddress(aDLLHandle, 'DrawEllipseLines');
  DrawFPS := GetProcAddress(aDLLHandle, 'DrawFPS');
  DrawGrid := GetProcAddress(aDLLHandle, 'DrawGrid');
  DrawLine := GetProcAddress(aDLLHandle, 'DrawLine');
  DrawLine3D := GetProcAddress(aDLLHandle, 'DrawLine3D');
  DrawLineBezier := GetProcAddress(aDLLHandle, 'DrawLineBezier');
  DrawLineBezierCubic := GetProcAddress(aDLLHandle, 'DrawLineBezierCubic');
  DrawLineBezierQuad := GetProcAddress(aDLLHandle, 'DrawLineBezierQuad');
  DrawLineEx := GetProcAddress(aDLLHandle, 'DrawLineEx');
  DrawLineStrip := GetProcAddress(aDLLHandle, 'DrawLineStrip');
  DrawLineV := GetProcAddress(aDLLHandle, 'DrawLineV');
  DrawMesh := GetProcAddress(aDLLHandle, 'DrawMesh');
  DrawMeshInstanced := GetProcAddress(aDLLHandle, 'DrawMeshInstanced');
  DrawModel := GetProcAddress(aDLLHandle, 'DrawModel');
  DrawModelEx := GetProcAddress(aDLLHandle, 'DrawModelEx');
  DrawModelWires := GetProcAddress(aDLLHandle, 'DrawModelWires');
  DrawModelWiresEx := GetProcAddress(aDLLHandle, 'DrawModelWiresEx');
  DrawPixel := GetProcAddress(aDLLHandle, 'DrawPixel');
  DrawPixelV := GetProcAddress(aDLLHandle, 'DrawPixelV');
  DrawPlane := GetProcAddress(aDLLHandle, 'DrawPlane');
  DrawPoint3D := GetProcAddress(aDLLHandle, 'DrawPoint3D');
  DrawPoly := GetProcAddress(aDLLHandle, 'DrawPoly');
  DrawPolyLines := GetProcAddress(aDLLHandle, 'DrawPolyLines');
  DrawPolyLinesEx := GetProcAddress(aDLLHandle, 'DrawPolyLinesEx');
  DrawRay := GetProcAddress(aDLLHandle, 'DrawRay');
  DrawRectangle := GetProcAddress(aDLLHandle, 'DrawRectangle');
  DrawRectangleGradientEx := GetProcAddress(aDLLHandle, 'DrawRectangleGradientEx');
  DrawRectangleGradientH := GetProcAddress(aDLLHandle, 'DrawRectangleGradientH');
  DrawRectangleGradientV := GetProcAddress(aDLLHandle, 'DrawRectangleGradientV');
  DrawRectangleLines := GetProcAddress(aDLLHandle, 'DrawRectangleLines');
  DrawRectangleLinesEx := GetProcAddress(aDLLHandle, 'DrawRectangleLinesEx');
  DrawRectanglePro := GetProcAddress(aDLLHandle, 'DrawRectanglePro');
  DrawRectangleRec := GetProcAddress(aDLLHandle, 'DrawRectangleRec');
  DrawRectangleRounded := GetProcAddress(aDLLHandle, 'DrawRectangleRounded');
  DrawRectangleRoundedLines := GetProcAddress(aDLLHandle, 'DrawRectangleRoundedLines');
  DrawRectangleV := GetProcAddress(aDLLHandle, 'DrawRectangleV');
  DrawRing := GetProcAddress(aDLLHandle, 'DrawRing');
  DrawRingLines := GetProcAddress(aDLLHandle, 'DrawRingLines');
  DrawSphere := GetProcAddress(aDLLHandle, 'DrawSphere');
  DrawSphereEx := GetProcAddress(aDLLHandle, 'DrawSphereEx');
  DrawSphereWires := GetProcAddress(aDLLHandle, 'DrawSphereWires');
  DrawText := GetProcAddress(aDLLHandle, 'DrawText');
  DrawTextCodepoint := GetProcAddress(aDLLHandle, 'DrawTextCodepoint');
  DrawTextCodepoints := GetProcAddress(aDLLHandle, 'DrawTextCodepoints');
  DrawTextEx := GetProcAddress(aDLLHandle, 'DrawTextEx');
  DrawTextPro := GetProcAddress(aDLLHandle, 'DrawTextPro');
  DrawTexture := GetProcAddress(aDLLHandle, 'DrawTexture');
  DrawTextureEx := GetProcAddress(aDLLHandle, 'DrawTextureEx');
  DrawTextureNPatch := GetProcAddress(aDLLHandle, 'DrawTextureNPatch');
  DrawTexturePro := GetProcAddress(aDLLHandle, 'DrawTexturePro');
  DrawTextureRec := GetProcAddress(aDLLHandle, 'DrawTextureRec');
  DrawTextureV := GetProcAddress(aDLLHandle, 'DrawTextureV');
  DrawTriangle := GetProcAddress(aDLLHandle, 'DrawTriangle');
  DrawTriangle3D := GetProcAddress(aDLLHandle, 'DrawTriangle3D');
  DrawTriangleFan := GetProcAddress(aDLLHandle, 'DrawTriangleFan');
  DrawTriangleLines := GetProcAddress(aDLLHandle, 'DrawTriangleLines');
  DrawTriangleStrip := GetProcAddress(aDLLHandle, 'DrawTriangleStrip');
  DrawTriangleStrip3D := GetProcAddress(aDLLHandle, 'DrawTriangleStrip3D');
  EnableCursor := GetProcAddress(aDLLHandle, 'EnableCursor');
  EnableEventWaiting := GetProcAddress(aDLLHandle, 'EnableEventWaiting');
  EncodeDataBase64 := GetProcAddress(aDLLHandle, 'EncodeDataBase64');
  EndBlendMode := GetProcAddress(aDLLHandle, 'EndBlendMode');
  EndDrawing := GetProcAddress(aDLLHandle, 'EndDrawing');
  EndMode2D := GetProcAddress(aDLLHandle, 'EndMode2D');
  EndMode3D := GetProcAddress(aDLLHandle, 'EndMode3D');
  EndScissorMode := GetProcAddress(aDLLHandle, 'EndScissorMode');
  EndShaderMode := GetProcAddress(aDLLHandle, 'EndShaderMode');
  EndTextureMode := GetProcAddress(aDLLHandle, 'EndTextureMode');
  EndVrStereoMode := GetProcAddress(aDLLHandle, 'EndVrStereoMode');
  ExportDataAsCode := GetProcAddress(aDLLHandle, 'ExportDataAsCode');
  ExportFontAsCode := GetProcAddress(aDLLHandle, 'ExportFontAsCode');
  ExportImage := GetProcAddress(aDLLHandle, 'ExportImage');
  ExportImageAsCode := GetProcAddress(aDLLHandle, 'ExportImageAsCode');
  ExportMesh := GetProcAddress(aDLLHandle, 'ExportMesh');
  ExportWave := GetProcAddress(aDLLHandle, 'ExportWave');
  ExportWaveAsCode := GetProcAddress(aDLLHandle, 'ExportWaveAsCode');
  Fade := GetProcAddress(aDLLHandle, 'Fade');
  FileExists := GetProcAddress(aDLLHandle, 'FileExists');
  FloatEquals := GetProcAddress(aDLLHandle, 'FloatEquals');
  GenImageCellular := GetProcAddress(aDLLHandle, 'GenImageCellular');
  GenImageChecked := GetProcAddress(aDLLHandle, 'GenImageChecked');
  GenImageColor := GetProcAddress(aDLLHandle, 'GenImageColor');
  GenImageFontAtlas := GetProcAddress(aDLLHandle, 'GenImageFontAtlas');
  GenImageGradientH := GetProcAddress(aDLLHandle, 'GenImageGradientH');
  GenImageGradientRadial := GetProcAddress(aDLLHandle, 'GenImageGradientRadial');
  GenImageGradientV := GetProcAddress(aDLLHandle, 'GenImageGradientV');
  GenImagePerlinNoise := GetProcAddress(aDLLHandle, 'GenImagePerlinNoise');
  GenImageText := GetProcAddress(aDLLHandle, 'GenImageText');
  GenImageWhiteNoise := GetProcAddress(aDLLHandle, 'GenImageWhiteNoise');
  GenMeshCone := GetProcAddress(aDLLHandle, 'GenMeshCone');
  GenMeshCube := GetProcAddress(aDLLHandle, 'GenMeshCube');
  GenMeshCubicmap := GetProcAddress(aDLLHandle, 'GenMeshCubicmap');
  GenMeshCylinder := GetProcAddress(aDLLHandle, 'GenMeshCylinder');
  GenMeshHeightmap := GetProcAddress(aDLLHandle, 'GenMeshHeightmap');
  GenMeshHemiSphere := GetProcAddress(aDLLHandle, 'GenMeshHemiSphere');
  GenMeshKnot := GetProcAddress(aDLLHandle, 'GenMeshKnot');
  GenMeshPlane := GetProcAddress(aDLLHandle, 'GenMeshPlane');
  GenMeshPoly := GetProcAddress(aDLLHandle, 'GenMeshPoly');
  GenMeshSphere := GetProcAddress(aDLLHandle, 'GenMeshSphere');
  GenMeshTangents := GetProcAddress(aDLLHandle, 'GenMeshTangents');
  GenMeshTorus := GetProcAddress(aDLLHandle, 'GenMeshTorus');
  GenTextureMipmaps := GetProcAddress(aDLLHandle, 'GenTextureMipmaps');
  GetApplicationDirectory := GetProcAddress(aDLLHandle, 'GetApplicationDirectory');
  GetCameraMatrix := GetProcAddress(aDLLHandle, 'GetCameraMatrix');
  GetCameraMatrix2D := GetProcAddress(aDLLHandle, 'GetCameraMatrix2D');
  GetCharPressed := GetProcAddress(aDLLHandle, 'GetCharPressed');
  GetClipboardText := GetProcAddress(aDLLHandle, 'GetClipboardText');
  GetCodepoint := GetProcAddress(aDLLHandle, 'GetCodepoint');
  GetCodepointCount := GetProcAddress(aDLLHandle, 'GetCodepointCount');
  GetCodepointNext := GetProcAddress(aDLLHandle, 'GetCodepointNext');
  GetCodepointPrevious := GetProcAddress(aDLLHandle, 'GetCodepointPrevious');
  GetCollisionRec := GetProcAddress(aDLLHandle, 'GetCollisionRec');
  GetColor := GetProcAddress(aDLLHandle, 'GetColor');
  GetCurrentMonitor := GetProcAddress(aDLLHandle, 'GetCurrentMonitor');
  GetDirectoryPath := GetProcAddress(aDLLHandle, 'GetDirectoryPath');
  GetFileExtension := GetProcAddress(aDLLHandle, 'GetFileExtension');
  GetFileLength := GetProcAddress(aDLLHandle, 'GetFileLength');
  GetFileModTime := GetProcAddress(aDLLHandle, 'GetFileModTime');
  GetFileName := GetProcAddress(aDLLHandle, 'GetFileName');
  GetFileNameWithoutExt := GetProcAddress(aDLLHandle, 'GetFileNameWithoutExt');
  GetFontDefault := GetProcAddress(aDLLHandle, 'GetFontDefault');
  GetFPS := GetProcAddress(aDLLHandle, 'GetFPS');
  GetFrameTime := GetProcAddress(aDLLHandle, 'GetFrameTime');
  GetGamepadAxisCount := GetProcAddress(aDLLHandle, 'GetGamepadAxisCount');
  GetGamepadAxisMovement := GetProcAddress(aDLLHandle, 'GetGamepadAxisMovement');
  GetGamepadButtonPressed := GetProcAddress(aDLLHandle, 'GetGamepadButtonPressed');
  GetGamepadName := GetProcAddress(aDLLHandle, 'GetGamepadName');
  GetGestureDetected := GetProcAddress(aDLLHandle, 'GetGestureDetected');
  GetGestureDragAngle := GetProcAddress(aDLLHandle, 'GetGestureDragAngle');
  GetGestureDragVector := GetProcAddress(aDLLHandle, 'GetGestureDragVector');
  GetGestureHoldDuration := GetProcAddress(aDLLHandle, 'GetGestureHoldDuration');
  GetGesturePinchAngle := GetProcAddress(aDLLHandle, 'GetGesturePinchAngle');
  GetGesturePinchVector := GetProcAddress(aDLLHandle, 'GetGesturePinchVector');
  GetGlyphAtlasRec := GetProcAddress(aDLLHandle, 'GetGlyphAtlasRec');
  GetGlyphIndex := GetProcAddress(aDLLHandle, 'GetGlyphIndex');
  GetGlyphInfo := GetProcAddress(aDLLHandle, 'GetGlyphInfo');
  GetImageAlphaBorder := GetProcAddress(aDLLHandle, 'GetImageAlphaBorder');
  GetImageColor := GetProcAddress(aDLLHandle, 'GetImageColor');
  GetKeyPressed := GetProcAddress(aDLLHandle, 'GetKeyPressed');
  GetMeshBoundingBox := GetProcAddress(aDLLHandle, 'GetMeshBoundingBox');
  GetModelBoundingBox := GetProcAddress(aDLLHandle, 'GetModelBoundingBox');
  GetMonitorCount := GetProcAddress(aDLLHandle, 'GetMonitorCount');
  GetMonitorHeight := GetProcAddress(aDLLHandle, 'GetMonitorHeight');
  GetMonitorName := GetProcAddress(aDLLHandle, 'GetMonitorName');
  GetMonitorPhysicalHeight := GetProcAddress(aDLLHandle, 'GetMonitorPhysicalHeight');
  GetMonitorPhysicalWidth := GetProcAddress(aDLLHandle, 'GetMonitorPhysicalWidth');
  GetMonitorPosition := GetProcAddress(aDLLHandle, 'GetMonitorPosition');
  GetMonitorRefreshRate := GetProcAddress(aDLLHandle, 'GetMonitorRefreshRate');
  GetMonitorWidth := GetProcAddress(aDLLHandle, 'GetMonitorWidth');
  GetMouseDelta := GetProcAddress(aDLLHandle, 'GetMouseDelta');
  GetMousePosition := GetProcAddress(aDLLHandle, 'GetMousePosition');
  GetMouseRay := GetProcAddress(aDLLHandle, 'GetMouseRay');
  GetMouseWheelMove := GetProcAddress(aDLLHandle, 'GetMouseWheelMove');
  GetMouseWheelMoveV := GetProcAddress(aDLLHandle, 'GetMouseWheelMoveV');
  GetMouseX := GetProcAddress(aDLLHandle, 'GetMouseX');
  GetMouseY := GetProcAddress(aDLLHandle, 'GetMouseY');
  GetMusicTimeLength := GetProcAddress(aDLLHandle, 'GetMusicTimeLength');
  GetMusicTimePlayed := GetProcAddress(aDLLHandle, 'GetMusicTimePlayed');
  GetPhysicsBodiesCount := GetProcAddress(aDLLHandle, 'GetPhysicsBodiesCount');
  GetPhysicsBody := GetProcAddress(aDLLHandle, 'GetPhysicsBody');
  GetPhysicsShapeType := GetProcAddress(aDLLHandle, 'GetPhysicsShapeType');
  GetPhysicsShapeVertex := GetProcAddress(aDLLHandle, 'GetPhysicsShapeVertex');
  GetPhysicsShapeVerticesCount := GetProcAddress(aDLLHandle, 'GetPhysicsShapeVerticesCount');
  GetPixelColor := GetProcAddress(aDLLHandle, 'GetPixelColor');
  GetPixelDataSize := GetProcAddress(aDLLHandle, 'GetPixelDataSize');
  GetPrevDirectoryPath := GetProcAddress(aDLLHandle, 'GetPrevDirectoryPath');
  GetRandomValue := GetProcAddress(aDLLHandle, 'GetRandomValue');
  GetRayCollisionBox := GetProcAddress(aDLLHandle, 'GetRayCollisionBox');
  GetRayCollisionMesh := GetProcAddress(aDLLHandle, 'GetRayCollisionMesh');
  GetRayCollisionQuad := GetProcAddress(aDLLHandle, 'GetRayCollisionQuad');
  GetRayCollisionSphere := GetProcAddress(aDLLHandle, 'GetRayCollisionSphere');
  GetRayCollisionTriangle := GetProcAddress(aDLLHandle, 'GetRayCollisionTriangle');
  GetRenderHeight := GetProcAddress(aDLLHandle, 'GetRenderHeight');
  GetRenderWidth := GetProcAddress(aDLLHandle, 'GetRenderWidth');
  GetScreenHeight := GetProcAddress(aDLLHandle, 'GetScreenHeight');
  GetScreenToWorld2D := GetProcAddress(aDLLHandle, 'GetScreenToWorld2D');
  GetScreenWidth := GetProcAddress(aDLLHandle, 'GetScreenWidth');
  GetShaderLocation := GetProcAddress(aDLLHandle, 'GetShaderLocation');
  GetShaderLocationAttrib := GetProcAddress(aDLLHandle, 'GetShaderLocationAttrib');
  GetTime := GetProcAddress(aDLLHandle, 'GetTime');
  GetTouchPointCount := GetProcAddress(aDLLHandle, 'GetTouchPointCount');
  GetTouchPointId := GetProcAddress(aDLLHandle, 'GetTouchPointId');
  GetTouchPosition := GetProcAddress(aDLLHandle, 'GetTouchPosition');
  GetTouchX := GetProcAddress(aDLLHandle, 'GetTouchX');
  GetTouchY := GetProcAddress(aDLLHandle, 'GetTouchY');
  GetWindowHandle := GetProcAddress(aDLLHandle, 'GetWindowHandle');
  GetWindowPosition := GetProcAddress(aDLLHandle, 'GetWindowPosition');
  GetWindowScaleDPI := GetProcAddress(aDLLHandle, 'GetWindowScaleDPI');
  GetWorkingDirectory := GetProcAddress(aDLLHandle, 'GetWorkingDirectory');
  GetWorldToScreen := GetProcAddress(aDLLHandle, 'GetWorldToScreen');
  GetWorldToScreen2D := GetProcAddress(aDLLHandle, 'GetWorldToScreen2D');
  GetWorldToScreenEx := GetProcAddress(aDLLHandle, 'GetWorldToScreenEx');
  GuiButton := GetProcAddress(aDLLHandle, 'GuiButton');
  GuiCheckBox := GetProcAddress(aDLLHandle, 'GuiCheckBox');
  GuiColorBarAlpha := GetProcAddress(aDLLHandle, 'GuiColorBarAlpha');
  GuiColorBarHue := GetProcAddress(aDLLHandle, 'GuiColorBarHue');
  GuiColorPanel := GetProcAddress(aDLLHandle, 'GuiColorPanel');
  GuiColorPicker := GetProcAddress(aDLLHandle, 'GuiColorPicker');
  GuiComboBox := GetProcAddress(aDLLHandle, 'GuiComboBox');
  GuiDisable := GetProcAddress(aDLLHandle, 'GuiDisable');
  GuiDisableTooltip := GetProcAddress(aDLLHandle, 'GuiDisableTooltip');
  GuiDrawIcon := GetProcAddress(aDLLHandle, 'GuiDrawIcon');
  GuiDropdownBox := GetProcAddress(aDLLHandle, 'GuiDropdownBox');
  GuiDummyRec := GetProcAddress(aDLLHandle, 'GuiDummyRec');
  GuiEnable := GetProcAddress(aDLLHandle, 'GuiEnable');
  GuiEnableTooltip := GetProcAddress(aDLLHandle, 'GuiEnableTooltip');
  GuiFade := GetProcAddress(aDLLHandle, 'GuiFade');
  GuiGetFont := GetProcAddress(aDLLHandle, 'GuiGetFont');
  GuiGetIcons := GetProcAddress(aDLLHandle, 'GuiGetIcons');
  GuiGetState := GetProcAddress(aDLLHandle, 'GuiGetState');
  GuiGetStyle := GetProcAddress(aDLLHandle, 'GuiGetStyle');
  GuiGrid := GetProcAddress(aDLLHandle, 'GuiGrid');
  GuiGroupBox := GetProcAddress(aDLLHandle, 'GuiGroupBox');
  GuiIconText := GetProcAddress(aDLLHandle, 'GuiIconText');
  GuiIsLocked := GetProcAddress(aDLLHandle, 'GuiIsLocked');
  GuiLabel := GetProcAddress(aDLLHandle, 'GuiLabel');
  GuiLabelButton := GetProcAddress(aDLLHandle, 'GuiLabelButton');
  GuiLine := GetProcAddress(aDLLHandle, 'GuiLine');
  GuiListView := GetProcAddress(aDLLHandle, 'GuiListView');
  GuiListViewEx := GetProcAddress(aDLLHandle, 'GuiListViewEx');
  GuiLoadIcons := GetProcAddress(aDLLHandle, 'GuiLoadIcons');
  GuiLoadStyle := GetProcAddress(aDLLHandle, 'GuiLoadStyle');
  GuiLoadStyleDefault := GetProcAddress(aDLLHandle, 'GuiLoadStyleDefault');
  GuiLock := GetProcAddress(aDLLHandle, 'GuiLock');
  GuiMessageBox := GetProcAddress(aDLLHandle, 'GuiMessageBox');
  GuiPanel := GetProcAddress(aDLLHandle, 'GuiPanel');
  GuiProgressBar := GetProcAddress(aDLLHandle, 'GuiProgressBar');
  GuiScrollPanel := GetProcAddress(aDLLHandle, 'GuiScrollPanel');
  GuiSetFont := GetProcAddress(aDLLHandle, 'GuiSetFont');
  GuiSetIconScale := GetProcAddress(aDLLHandle, 'GuiSetIconScale');
  GuiSetState := GetProcAddress(aDLLHandle, 'GuiSetState');
  GuiSetStyle := GetProcAddress(aDLLHandle, 'GuiSetStyle');
  GuiSetTooltip := GetProcAddress(aDLLHandle, 'GuiSetTooltip');
  GuiSlider := GetProcAddress(aDLLHandle, 'GuiSlider');
  GuiSliderBar := GetProcAddress(aDLLHandle, 'GuiSliderBar');
  GuiSpinner := GetProcAddress(aDLLHandle, 'GuiSpinner');
  GuiStatusBar := GetProcAddress(aDLLHandle, 'GuiStatusBar');
  GuiTabBar := GetProcAddress(aDLLHandle, 'GuiTabBar');
  GuiTextBox := GetProcAddress(aDLLHandle, 'GuiTextBox');
  GuiTextBoxMulti := GetProcAddress(aDLLHandle, 'GuiTextBoxMulti');
  GuiTextInputBox := GetProcAddress(aDLLHandle, 'GuiTextInputBox');
  GuiToggle := GetProcAddress(aDLLHandle, 'GuiToggle');
  GuiToggleGroup := GetProcAddress(aDLLHandle, 'GuiToggleGroup');
  GuiUnlock := GetProcAddress(aDLLHandle, 'GuiUnlock');
  GuiValueBox := GetProcAddress(aDLLHandle, 'GuiValueBox');
  GuiWindowBox := GetProcAddress(aDLLHandle, 'GuiWindowBox');
  HideCursor := GetProcAddress(aDLLHandle, 'HideCursor');
  ImageAlphaClear := GetProcAddress(aDLLHandle, 'ImageAlphaClear');
  ImageAlphaCrop := GetProcAddress(aDLLHandle, 'ImageAlphaCrop');
  ImageAlphaMask := GetProcAddress(aDLLHandle, 'ImageAlphaMask');
  ImageAlphaPremultiply := GetProcAddress(aDLLHandle, 'ImageAlphaPremultiply');
  ImageBlurGaussian := GetProcAddress(aDLLHandle, 'ImageBlurGaussian');
  ImageClearBackground := GetProcAddress(aDLLHandle, 'ImageClearBackground');
  ImageColorBrightness := GetProcAddress(aDLLHandle, 'ImageColorBrightness');
  ImageColorContrast := GetProcAddress(aDLLHandle, 'ImageColorContrast');
  ImageColorGrayscale := GetProcAddress(aDLLHandle, 'ImageColorGrayscale');
  ImageColorInvert := GetProcAddress(aDLLHandle, 'ImageColorInvert');
  ImageColorReplace := GetProcAddress(aDLLHandle, 'ImageColorReplace');
  ImageColorTint := GetProcAddress(aDLLHandle, 'ImageColorTint');
  ImageCopy := GetProcAddress(aDLLHandle, 'ImageCopy');
  ImageCrop := GetProcAddress(aDLLHandle, 'ImageCrop');
  ImageDither := GetProcAddress(aDLLHandle, 'ImageDither');
  ImageDraw := GetProcAddress(aDLLHandle, 'ImageDraw');
  ImageDrawCircle := GetProcAddress(aDLLHandle, 'ImageDrawCircle');
  ImageDrawCircleLines := GetProcAddress(aDLLHandle, 'ImageDrawCircleLines');
  ImageDrawCircleLinesV := GetProcAddress(aDLLHandle, 'ImageDrawCircleLinesV');
  ImageDrawCircleV := GetProcAddress(aDLLHandle, 'ImageDrawCircleV');
  ImageDrawLine := GetProcAddress(aDLLHandle, 'ImageDrawLine');
  ImageDrawLineV := GetProcAddress(aDLLHandle, 'ImageDrawLineV');
  ImageDrawPixel := GetProcAddress(aDLLHandle, 'ImageDrawPixel');
  ImageDrawPixelV := GetProcAddress(aDLLHandle, 'ImageDrawPixelV');
  ImageDrawRectangle := GetProcAddress(aDLLHandle, 'ImageDrawRectangle');
  ImageDrawRectangleLines := GetProcAddress(aDLLHandle, 'ImageDrawRectangleLines');
  ImageDrawRectangleRec := GetProcAddress(aDLLHandle, 'ImageDrawRectangleRec');
  ImageDrawRectangleV := GetProcAddress(aDLLHandle, 'ImageDrawRectangleV');
  ImageDrawText := GetProcAddress(aDLLHandle, 'ImageDrawText');
  ImageDrawTextEx := GetProcAddress(aDLLHandle, 'ImageDrawTextEx');
  ImageFlipHorizontal := GetProcAddress(aDLLHandle, 'ImageFlipHorizontal');
  ImageFlipVertical := GetProcAddress(aDLLHandle, 'ImageFlipVertical');
  ImageFormat := GetProcAddress(aDLLHandle, 'ImageFormat');
  ImageFromImage := GetProcAddress(aDLLHandle, 'ImageFromImage');
  ImageMipmaps := GetProcAddress(aDLLHandle, 'ImageMipmaps');
  ImageResize := GetProcAddress(aDLLHandle, 'ImageResize');
  ImageResizeCanvas := GetProcAddress(aDLLHandle, 'ImageResizeCanvas');
  ImageResizeNN := GetProcAddress(aDLLHandle, 'ImageResizeNN');
  ImageRotateCCW := GetProcAddress(aDLLHandle, 'ImageRotateCCW');
  ImageRotateCW := GetProcAddress(aDLLHandle, 'ImageRotateCW');
  ImageText := GetProcAddress(aDLLHandle, 'ImageText');
  ImageTextEx := GetProcAddress(aDLLHandle, 'ImageTextEx');
  ImageToPOT := GetProcAddress(aDLLHandle, 'ImageToPOT');
  InitAudioDevice := GetProcAddress(aDLLHandle, 'InitAudioDevice');
  InitPhysics := GetProcAddress(aDLLHandle, 'InitPhysics');
  InitWindow := GetProcAddress(aDLLHandle, 'InitWindow');
  IsAudioDeviceReady := GetProcAddress(aDLLHandle, 'IsAudioDeviceReady');
  IsAudioStreamPlaying := GetProcAddress(aDLLHandle, 'IsAudioStreamPlaying');
  IsAudioStreamProcessed := GetProcAddress(aDLLHandle, 'IsAudioStreamProcessed');
  IsAudioStreamReady := GetProcAddress(aDLLHandle, 'IsAudioStreamReady');
  IsCursorHidden := GetProcAddress(aDLLHandle, 'IsCursorHidden');
  IsCursorOnScreen := GetProcAddress(aDLLHandle, 'IsCursorOnScreen');
  IsFileDropped := GetProcAddress(aDLLHandle, 'IsFileDropped');
  IsFileExtension := GetProcAddress(aDLLHandle, 'IsFileExtension');
  IsFontReady := GetProcAddress(aDLLHandle, 'IsFontReady');
  IsGamepadAvailable := GetProcAddress(aDLLHandle, 'IsGamepadAvailable');
  IsGamepadButtonDown := GetProcAddress(aDLLHandle, 'IsGamepadButtonDown');
  IsGamepadButtonPressed := GetProcAddress(aDLLHandle, 'IsGamepadButtonPressed');
  IsGamepadButtonReleased := GetProcAddress(aDLLHandle, 'IsGamepadButtonReleased');
  IsGamepadButtonUp := GetProcAddress(aDLLHandle, 'IsGamepadButtonUp');
  IsGestureDetected := GetProcAddress(aDLLHandle, 'IsGestureDetected');
  IsImageReady := GetProcAddress(aDLLHandle, 'IsImageReady');
  IsKeyDown := GetProcAddress(aDLLHandle, 'IsKeyDown');
  IsKeyPressed := GetProcAddress(aDLLHandle, 'IsKeyPressed');
  IsKeyReleased := GetProcAddress(aDLLHandle, 'IsKeyReleased');
  IsKeyUp := GetProcAddress(aDLLHandle, 'IsKeyUp');
  IsMaterialReady := GetProcAddress(aDLLHandle, 'IsMaterialReady');
  IsModelAnimationValid := GetProcAddress(aDLLHandle, 'IsModelAnimationValid');
  IsModelReady := GetProcAddress(aDLLHandle, 'IsModelReady');
  IsMouseButtonDown := GetProcAddress(aDLLHandle, 'IsMouseButtonDown');
  IsMouseButtonPressed := GetProcAddress(aDLLHandle, 'IsMouseButtonPressed');
  IsMouseButtonReleased := GetProcAddress(aDLLHandle, 'IsMouseButtonReleased');
  IsMouseButtonUp := GetProcAddress(aDLLHandle, 'IsMouseButtonUp');
  IsMusicReady := GetProcAddress(aDLLHandle, 'IsMusicReady');
  IsMusicStreamPlaying := GetProcAddress(aDLLHandle, 'IsMusicStreamPlaying');
  IsPathFile := GetProcAddress(aDLLHandle, 'IsPathFile');
  IsRenderTextureReady := GetProcAddress(aDLLHandle, 'IsRenderTextureReady');
  IsShaderReady := GetProcAddress(aDLLHandle, 'IsShaderReady');
  IsSoundPlaying := GetProcAddress(aDLLHandle, 'IsSoundPlaying');
  IsSoundReady := GetProcAddress(aDLLHandle, 'IsSoundReady');
  IsTextureReady := GetProcAddress(aDLLHandle, 'IsTextureReady');
  IsWaveReady := GetProcAddress(aDLLHandle, 'IsWaveReady');
  IsWindowFocused := GetProcAddress(aDLLHandle, 'IsWindowFocused');
  IsWindowFullscreen := GetProcAddress(aDLLHandle, 'IsWindowFullscreen');
  IsWindowHidden := GetProcAddress(aDLLHandle, 'IsWindowHidden');
  IsWindowMaximized := GetProcAddress(aDLLHandle, 'IsWindowMaximized');
  IsWindowMinimized := GetProcAddress(aDLLHandle, 'IsWindowMinimized');
  IsWindowReady := GetProcAddress(aDLLHandle, 'IsWindowReady');
  IsWindowResized := GetProcAddress(aDLLHandle, 'IsWindowResized');
  IsWindowState := GetProcAddress(aDLLHandle, 'IsWindowState');
  Lerp := GetProcAddress(aDLLHandle, 'Lerp');
  LoadAudioStream := GetProcAddress(aDLLHandle, 'LoadAudioStream');
  LoadCodepoints := GetProcAddress(aDLLHandle, 'LoadCodepoints');
  LoadDirectoryFiles := GetProcAddress(aDLLHandle, 'LoadDirectoryFiles');
  LoadDirectoryFilesEx := GetProcAddress(aDLLHandle, 'LoadDirectoryFilesEx');
  LoadDroppedFiles := GetProcAddress(aDLLHandle, 'LoadDroppedFiles');
  LoadFileData := GetProcAddress(aDLLHandle, 'LoadFileData');
  LoadFileText := GetProcAddress(aDLLHandle, 'LoadFileText');
  LoadFont := GetProcAddress(aDLLHandle, 'LoadFont');
  LoadFontData := GetProcAddress(aDLLHandle, 'LoadFontData');
  LoadFontEx := GetProcAddress(aDLLHandle, 'LoadFontEx');
  LoadFontFromImage := GetProcAddress(aDLLHandle, 'LoadFontFromImage');
  LoadFontFromMemory := GetProcAddress(aDLLHandle, 'LoadFontFromMemory');
  LoadImage := GetProcAddress(aDLLHandle, 'LoadImage');
  LoadImageAnim := GetProcAddress(aDLLHandle, 'LoadImageAnim');
  LoadImageColors := GetProcAddress(aDLLHandle, 'LoadImageColors');
  LoadImageFromMemory := GetProcAddress(aDLLHandle, 'LoadImageFromMemory');
  LoadImageFromScreen := GetProcAddress(aDLLHandle, 'LoadImageFromScreen');
  LoadImageFromTexture := GetProcAddress(aDLLHandle, 'LoadImageFromTexture');
  LoadImagePalette := GetProcAddress(aDLLHandle, 'LoadImagePalette');
  LoadImageRaw := GetProcAddress(aDLLHandle, 'LoadImageRaw');
  LoadMaterialDefault := GetProcAddress(aDLLHandle, 'LoadMaterialDefault');
  LoadMaterials := GetProcAddress(aDLLHandle, 'LoadMaterials');
  LoadModel := GetProcAddress(aDLLHandle, 'LoadModel');
  LoadModelAnimations := GetProcAddress(aDLLHandle, 'LoadModelAnimations');
  LoadModelFromMesh := GetProcAddress(aDLLHandle, 'LoadModelFromMesh');
  LoadMusicStream := GetProcAddress(aDLLHandle, 'LoadMusicStream');
  LoadMusicStreamFromMemory := GetProcAddress(aDLLHandle, 'LoadMusicStreamFromMemory');
  LoadRenderTexture := GetProcAddress(aDLLHandle, 'LoadRenderTexture');
  LoadShader := GetProcAddress(aDLLHandle, 'LoadShader');
  LoadShaderFromMemory := GetProcAddress(aDLLHandle, 'LoadShaderFromMemory');
  LoadSound := GetProcAddress(aDLLHandle, 'LoadSound');
  LoadSoundFromWave := GetProcAddress(aDLLHandle, 'LoadSoundFromWave');
  LoadTexture := GetProcAddress(aDLLHandle, 'LoadTexture');
  LoadTextureCubemap := GetProcAddress(aDLLHandle, 'LoadTextureCubemap');
  LoadTextureFromImage := GetProcAddress(aDLLHandle, 'LoadTextureFromImage');
  LoadUTF8 := GetProcAddress(aDLLHandle, 'LoadUTF8');
  LoadVrStereoConfig := GetProcAddress(aDLLHandle, 'LoadVrStereoConfig');
  LoadWave := GetProcAddress(aDLLHandle, 'LoadWave');
  LoadWaveFromMemory := GetProcAddress(aDLLHandle, 'LoadWaveFromMemory');
  LoadWaveSamples := GetProcAddress(aDLLHandle, 'LoadWaveSamples');
  MatrixAdd := GetProcAddress(aDLLHandle, 'MatrixAdd');
  MatrixDeterminant := GetProcAddress(aDLLHandle, 'MatrixDeterminant');
  MatrixFrustum := GetProcAddress(aDLLHandle, 'MatrixFrustum');
  MatrixIdentity := GetProcAddress(aDLLHandle, 'MatrixIdentity');
  MatrixInvert := GetProcAddress(aDLLHandle, 'MatrixInvert');
  MatrixLookAt := GetProcAddress(aDLLHandle, 'MatrixLookAt');
  MatrixMultiply := GetProcAddress(aDLLHandle, 'MatrixMultiply');
  MatrixOrtho := GetProcAddress(aDLLHandle, 'MatrixOrtho');
  MatrixPerspective := GetProcAddress(aDLLHandle, 'MatrixPerspective');
  MatrixRotate := GetProcAddress(aDLLHandle, 'MatrixRotate');
  MatrixRotateX := GetProcAddress(aDLLHandle, 'MatrixRotateX');
  MatrixRotateXYZ := GetProcAddress(aDLLHandle, 'MatrixRotateXYZ');
  MatrixRotateY := GetProcAddress(aDLLHandle, 'MatrixRotateY');
  MatrixRotateZ := GetProcAddress(aDLLHandle, 'MatrixRotateZ');
  MatrixRotateZYX := GetProcAddress(aDLLHandle, 'MatrixRotateZYX');
  MatrixScale := GetProcAddress(aDLLHandle, 'MatrixScale');
  MatrixSubtract := GetProcAddress(aDLLHandle, 'MatrixSubtract');
  MatrixToFloatV := GetProcAddress(aDLLHandle, 'MatrixToFloatV');
  MatrixTrace := GetProcAddress(aDLLHandle, 'MatrixTrace');
  MatrixTranslate := GetProcAddress(aDLLHandle, 'MatrixTranslate');
  MatrixTranspose := GetProcAddress(aDLLHandle, 'MatrixTranspose');
  MaximizeWindow := GetProcAddress(aDLLHandle, 'MaximizeWindow');
  MeasureText := GetProcAddress(aDLLHandle, 'MeasureText');
  MeasureTextEx := GetProcAddress(aDLLHandle, 'MeasureTextEx');
  MemAlloc := GetProcAddress(aDLLHandle, 'MemAlloc');
  MemFree := GetProcAddress(aDLLHandle, 'MemFree');
  MemRealloc := GetProcAddress(aDLLHandle, 'MemRealloc');
  MinimizeWindow := GetProcAddress(aDLLHandle, 'MinimizeWindow');
  Normalize := GetProcAddress(aDLLHandle, 'Normalize');
  OpenURL := GetProcAddress(aDLLHandle, 'OpenURL');
  PauseAudioStream := GetProcAddress(aDLLHandle, 'PauseAudioStream');
  PauseMusicStream := GetProcAddress(aDLLHandle, 'PauseMusicStream');
  PauseSound := GetProcAddress(aDLLHandle, 'PauseSound');
  PhysicsAddForce := GetProcAddress(aDLLHandle, 'PhysicsAddForce');
  PhysicsAddTorque := GetProcAddress(aDLLHandle, 'PhysicsAddTorque');
  PhysicsShatter := GetProcAddress(aDLLHandle, 'PhysicsShatter');
  PlayAudioStream := GetProcAddress(aDLLHandle, 'PlayAudioStream');
  PlayMusicStream := GetProcAddress(aDLLHandle, 'PlayMusicStream');
  PlaySound := GetProcAddress(aDLLHandle, 'PlaySound');
  plm_audio_create_with_buffer := GetProcAddress(aDLLHandle, 'plm_audio_create_with_buffer');
  plm_audio_decode := GetProcAddress(aDLLHandle, 'plm_audio_decode');
  plm_audio_destroy := GetProcAddress(aDLLHandle, 'plm_audio_destroy');
  plm_audio_get_samplerate := GetProcAddress(aDLLHandle, 'plm_audio_get_samplerate');
  plm_audio_get_time := GetProcAddress(aDLLHandle, 'plm_audio_get_time');
  plm_audio_has_ended := GetProcAddress(aDLLHandle, 'plm_audio_has_ended');
  plm_audio_has_header := GetProcAddress(aDLLHandle, 'plm_audio_has_header');
  plm_audio_rewind := GetProcAddress(aDLLHandle, 'plm_audio_rewind');
  plm_audio_set_time := GetProcAddress(aDLLHandle, 'plm_audio_set_time');
  plm_buffer_create_for_appending := GetProcAddress(aDLLHandle, 'plm_buffer_create_for_appending');
  plm_buffer_create_with_capacity := GetProcAddress(aDLLHandle, 'plm_buffer_create_with_capacity');
  plm_buffer_create_with_file := GetProcAddress(aDLLHandle, 'plm_buffer_create_with_file');
  plm_buffer_create_with_filename := GetProcAddress(aDLLHandle, 'plm_buffer_create_with_filename');
  plm_buffer_create_with_memory := GetProcAddress(aDLLHandle, 'plm_buffer_create_with_memory');
  plm_buffer_destroy := GetProcAddress(aDLLHandle, 'plm_buffer_destroy');
  plm_buffer_get_remaining := GetProcAddress(aDLLHandle, 'plm_buffer_get_remaining');
  plm_buffer_get_size := GetProcAddress(aDLLHandle, 'plm_buffer_get_size');
  plm_buffer_has_ended := GetProcAddress(aDLLHandle, 'plm_buffer_has_ended');
  plm_buffer_rewind := GetProcAddress(aDLLHandle, 'plm_buffer_rewind');
  plm_buffer_set_load_callback := GetProcAddress(aDLLHandle, 'plm_buffer_set_load_callback');
  plm_buffer_signal_end := GetProcAddress(aDLLHandle, 'plm_buffer_signal_end');
  plm_buffer_write := GetProcAddress(aDLLHandle, 'plm_buffer_write');
  plm_create_with_buffer := GetProcAddress(aDLLHandle, 'plm_create_with_buffer');
  plm_create_with_file := GetProcAddress(aDLLHandle, 'plm_create_with_file');
  plm_create_with_filename := GetProcAddress(aDLLHandle, 'plm_create_with_filename');
  plm_create_with_memory := GetProcAddress(aDLLHandle, 'plm_create_with_memory');
  plm_decode := GetProcAddress(aDLLHandle, 'plm_decode');
  plm_decode_audio := GetProcAddress(aDLLHandle, 'plm_decode_audio');
  plm_decode_video := GetProcAddress(aDLLHandle, 'plm_decode_video');
  plm_demux_create := GetProcAddress(aDLLHandle, 'plm_demux_create');
  plm_demux_decode := GetProcAddress(aDLLHandle, 'plm_demux_decode');
  plm_demux_destroy := GetProcAddress(aDLLHandle, 'plm_demux_destroy');
  plm_demux_get_duration := GetProcAddress(aDLLHandle, 'plm_demux_get_duration');
  plm_demux_get_num_audio_streams := GetProcAddress(aDLLHandle, 'plm_demux_get_num_audio_streams');
  plm_demux_get_num_video_streams := GetProcAddress(aDLLHandle, 'plm_demux_get_num_video_streams');
  plm_demux_get_start_time := GetProcAddress(aDLLHandle, 'plm_demux_get_start_time');
  plm_demux_has_ended := GetProcAddress(aDLLHandle, 'plm_demux_has_ended');
  plm_demux_has_headers := GetProcAddress(aDLLHandle, 'plm_demux_has_headers');
  plm_demux_rewind := GetProcAddress(aDLLHandle, 'plm_demux_rewind');
  plm_demux_seek := GetProcAddress(aDLLHandle, 'plm_demux_seek');
  plm_destroy := GetProcAddress(aDLLHandle, 'plm_destroy');
  plm_frame_to_abgr := GetProcAddress(aDLLHandle, 'plm_frame_to_abgr');
  plm_frame_to_argb := GetProcAddress(aDLLHandle, 'plm_frame_to_argb');
  plm_frame_to_bgr := GetProcAddress(aDLLHandle, 'plm_frame_to_bgr');
  plm_frame_to_bgra := GetProcAddress(aDLLHandle, 'plm_frame_to_bgra');
  plm_frame_to_rgb := GetProcAddress(aDLLHandle, 'plm_frame_to_rgb');
  plm_frame_to_rgba := GetProcAddress(aDLLHandle, 'plm_frame_to_rgba');
  plm_get_audio_enabled := GetProcAddress(aDLLHandle, 'plm_get_audio_enabled');
  plm_get_audio_lead_time := GetProcAddress(aDLLHandle, 'plm_get_audio_lead_time');
  plm_get_duration := GetProcAddress(aDLLHandle, 'plm_get_duration');
  plm_get_framerate := GetProcAddress(aDLLHandle, 'plm_get_framerate');
  plm_get_height := GetProcAddress(aDLLHandle, 'plm_get_height');
  plm_get_loop := GetProcAddress(aDLLHandle, 'plm_get_loop');
  plm_get_num_audio_streams := GetProcAddress(aDLLHandle, 'plm_get_num_audio_streams');
  plm_get_num_video_streams := GetProcAddress(aDLLHandle, 'plm_get_num_video_streams');
  plm_get_samplerate := GetProcAddress(aDLLHandle, 'plm_get_samplerate');
  plm_get_time := GetProcAddress(aDLLHandle, 'plm_get_time');
  plm_get_video_enabled := GetProcAddress(aDLLHandle, 'plm_get_video_enabled');
  plm_get_width := GetProcAddress(aDLLHandle, 'plm_get_width');
  plm_has_ended := GetProcAddress(aDLLHandle, 'plm_has_ended');
  plm_has_headers := GetProcAddress(aDLLHandle, 'plm_has_headers');
  plm_rewind := GetProcAddress(aDLLHandle, 'plm_rewind');
  plm_seek := GetProcAddress(aDLLHandle, 'plm_seek');
  plm_seek_frame := GetProcAddress(aDLLHandle, 'plm_seek_frame');
  plm_set_audio_decode_callback := GetProcAddress(aDLLHandle, 'plm_set_audio_decode_callback');
  plm_set_audio_enabled := GetProcAddress(aDLLHandle, 'plm_set_audio_enabled');
  plm_set_audio_lead_time := GetProcAddress(aDLLHandle, 'plm_set_audio_lead_time');
  plm_set_audio_stream := GetProcAddress(aDLLHandle, 'plm_set_audio_stream');
  plm_set_loop := GetProcAddress(aDLLHandle, 'plm_set_loop');
  plm_set_video_decode_callback := GetProcAddress(aDLLHandle, 'plm_set_video_decode_callback');
  plm_set_video_enabled := GetProcAddress(aDLLHandle, 'plm_set_video_enabled');
  plm_video_create_with_buffer := GetProcAddress(aDLLHandle, 'plm_video_create_with_buffer');
  plm_video_decode := GetProcAddress(aDLLHandle, 'plm_video_decode');
  plm_video_destroy := GetProcAddress(aDLLHandle, 'plm_video_destroy');
  plm_video_get_framerate := GetProcAddress(aDLLHandle, 'plm_video_get_framerate');
  plm_video_get_height := GetProcAddress(aDLLHandle, 'plm_video_get_height');
  plm_video_get_time := GetProcAddress(aDLLHandle, 'plm_video_get_time');
  plm_video_get_width := GetProcAddress(aDLLHandle, 'plm_video_get_width');
  plm_video_has_ended := GetProcAddress(aDLLHandle, 'plm_video_has_ended');
  plm_video_has_header := GetProcAddress(aDLLHandle, 'plm_video_has_header');
  plm_video_rewind := GetProcAddress(aDLLHandle, 'plm_video_rewind');
  plm_video_set_no_delay := GetProcAddress(aDLLHandle, 'plm_video_set_no_delay');
  plm_video_set_time := GetProcAddress(aDLLHandle, 'plm_video_set_time');
  PollInputEvents := GetProcAddress(aDLLHandle, 'PollInputEvents');
  QuaternionAdd := GetProcAddress(aDLLHandle, 'QuaternionAdd');
  QuaternionAddValue := GetProcAddress(aDLLHandle, 'QuaternionAddValue');
  QuaternionDivide := GetProcAddress(aDLLHandle, 'QuaternionDivide');
  QuaternionEquals := GetProcAddress(aDLLHandle, 'QuaternionEquals');
  QuaternionFromAxisAngle := GetProcAddress(aDLLHandle, 'QuaternionFromAxisAngle');
  QuaternionFromEuler := GetProcAddress(aDLLHandle, 'QuaternionFromEuler');
  QuaternionFromMatrix := GetProcAddress(aDLLHandle, 'QuaternionFromMatrix');
  QuaternionFromVector3ToVector3 := GetProcAddress(aDLLHandle, 'QuaternionFromVector3ToVector3');
  QuaternionIdentity := GetProcAddress(aDLLHandle, 'QuaternionIdentity');
  QuaternionInvert := GetProcAddress(aDLLHandle, 'QuaternionInvert');
  QuaternionLength := GetProcAddress(aDLLHandle, 'QuaternionLength');
  QuaternionLerp := GetProcAddress(aDLLHandle, 'QuaternionLerp');
  QuaternionMultiply := GetProcAddress(aDLLHandle, 'QuaternionMultiply');
  QuaternionNlerp := GetProcAddress(aDLLHandle, 'QuaternionNlerp');
  QuaternionNormalize := GetProcAddress(aDLLHandle, 'QuaternionNormalize');
  QuaternionScale := GetProcAddress(aDLLHandle, 'QuaternionScale');
  QuaternionSlerp := GetProcAddress(aDLLHandle, 'QuaternionSlerp');
  QuaternionSubtract := GetProcAddress(aDLLHandle, 'QuaternionSubtract');
  QuaternionSubtractValue := GetProcAddress(aDLLHandle, 'QuaternionSubtractValue');
  QuaternionToAxisAngle := GetProcAddress(aDLLHandle, 'QuaternionToAxisAngle');
  QuaternionToEuler := GetProcAddress(aDLLHandle, 'QuaternionToEuler');
  QuaternionToMatrix := GetProcAddress(aDLLHandle, 'QuaternionToMatrix');
  QuaternionTransform := GetProcAddress(aDLLHandle, 'QuaternionTransform');
  Remap := GetProcAddress(aDLLHandle, 'Remap');
  ResetPhysics := GetProcAddress(aDLLHandle, 'ResetPhysics');
  RestoreWindow := GetProcAddress(aDLLHandle, 'RestoreWindow');
  ResumeAudioStream := GetProcAddress(aDLLHandle, 'ResumeAudioStream');
  ResumeMusicStream := GetProcAddress(aDLLHandle, 'ResumeMusicStream');
  ResumeSound := GetProcAddress(aDLLHandle, 'ResumeSound');
  rlActiveDrawBuffers := GetProcAddress(aDLLHandle, 'rlActiveDrawBuffers');
  rlActiveTextureSlot := GetProcAddress(aDLLHandle, 'rlActiveTextureSlot');
  rlBegin := GetProcAddress(aDLLHandle, 'rlBegin');
  rlBindImageTexture := GetProcAddress(aDLLHandle, 'rlBindImageTexture');
  rlBindShaderBuffer := GetProcAddress(aDLLHandle, 'rlBindShaderBuffer');
  rlCheckErrors := GetProcAddress(aDLLHandle, 'rlCheckErrors');
  rlCheckRenderBatchLimit := GetProcAddress(aDLLHandle, 'rlCheckRenderBatchLimit');
  rlClearColor := GetProcAddress(aDLLHandle, 'rlClearColor');
  rlClearScreenBuffers := GetProcAddress(aDLLHandle, 'rlClearScreenBuffers');
  rlColor3f := GetProcAddress(aDLLHandle, 'rlColor3f');
  rlColor4f := GetProcAddress(aDLLHandle, 'rlColor4f');
  rlColor4ub := GetProcAddress(aDLLHandle, 'rlColor4ub');
  rlCompileShader := GetProcAddress(aDLLHandle, 'rlCompileShader');
  rlComputeShaderDispatch := GetProcAddress(aDLLHandle, 'rlComputeShaderDispatch');
  rlCopyShaderBuffer := GetProcAddress(aDLLHandle, 'rlCopyShaderBuffer');
  rlCubemapParameters := GetProcAddress(aDLLHandle, 'rlCubemapParameters');
  rlDisableBackfaceCulling := GetProcAddress(aDLLHandle, 'rlDisableBackfaceCulling');
  rlDisableColorBlend := GetProcAddress(aDLLHandle, 'rlDisableColorBlend');
  rlDisableDepthMask := GetProcAddress(aDLLHandle, 'rlDisableDepthMask');
  rlDisableDepthTest := GetProcAddress(aDLLHandle, 'rlDisableDepthTest');
  rlDisableFramebuffer := GetProcAddress(aDLLHandle, 'rlDisableFramebuffer');
  rlDisableScissorTest := GetProcAddress(aDLLHandle, 'rlDisableScissorTest');
  rlDisableShader := GetProcAddress(aDLLHandle, 'rlDisableShader');
  rlDisableSmoothLines := GetProcAddress(aDLLHandle, 'rlDisableSmoothLines');
  rlDisableStereoRender := GetProcAddress(aDLLHandle, 'rlDisableStereoRender');
  rlDisableTexture := GetProcAddress(aDLLHandle, 'rlDisableTexture');
  rlDisableTextureCubemap := GetProcAddress(aDLLHandle, 'rlDisableTextureCubemap');
  rlDisableVertexArray := GetProcAddress(aDLLHandle, 'rlDisableVertexArray');
  rlDisableVertexAttribute := GetProcAddress(aDLLHandle, 'rlDisableVertexAttribute');
  rlDisableVertexBuffer := GetProcAddress(aDLLHandle, 'rlDisableVertexBuffer');
  rlDisableVertexBufferElement := GetProcAddress(aDLLHandle, 'rlDisableVertexBufferElement');
  rlDisableWireMode := GetProcAddress(aDLLHandle, 'rlDisableWireMode');
  rlDrawRenderBatch := GetProcAddress(aDLLHandle, 'rlDrawRenderBatch');
  rlDrawRenderBatchActive := GetProcAddress(aDLLHandle, 'rlDrawRenderBatchActive');
  rlDrawVertexArray := GetProcAddress(aDLLHandle, 'rlDrawVertexArray');
  rlDrawVertexArrayElements := GetProcAddress(aDLLHandle, 'rlDrawVertexArrayElements');
  rlDrawVertexArrayElementsInstanced := GetProcAddress(aDLLHandle, 'rlDrawVertexArrayElementsInstanced');
  rlDrawVertexArrayInstanced := GetProcAddress(aDLLHandle, 'rlDrawVertexArrayInstanced');
  rlEnableBackfaceCulling := GetProcAddress(aDLLHandle, 'rlEnableBackfaceCulling');
  rlEnableColorBlend := GetProcAddress(aDLLHandle, 'rlEnableColorBlend');
  rlEnableDepthMask := GetProcAddress(aDLLHandle, 'rlEnableDepthMask');
  rlEnableDepthTest := GetProcAddress(aDLLHandle, 'rlEnableDepthTest');
  rlEnableFramebuffer := GetProcAddress(aDLLHandle, 'rlEnableFramebuffer');
  rlEnableScissorTest := GetProcAddress(aDLLHandle, 'rlEnableScissorTest');
  rlEnableShader := GetProcAddress(aDLLHandle, 'rlEnableShader');
  rlEnableSmoothLines := GetProcAddress(aDLLHandle, 'rlEnableSmoothLines');
  rlEnableStereoRender := GetProcAddress(aDLLHandle, 'rlEnableStereoRender');
  rlEnableTexture := GetProcAddress(aDLLHandle, 'rlEnableTexture');
  rlEnableTextureCubemap := GetProcAddress(aDLLHandle, 'rlEnableTextureCubemap');
  rlEnableVertexArray := GetProcAddress(aDLLHandle, 'rlEnableVertexArray');
  rlEnableVertexAttribute := GetProcAddress(aDLLHandle, 'rlEnableVertexAttribute');
  rlEnableVertexBuffer := GetProcAddress(aDLLHandle, 'rlEnableVertexBuffer');
  rlEnableVertexBufferElement := GetProcAddress(aDLLHandle, 'rlEnableVertexBufferElement');
  rlEnableWireMode := GetProcAddress(aDLLHandle, 'rlEnableWireMode');
  rlEnd := GetProcAddress(aDLLHandle, 'rlEnd');
  rlFramebufferAttach := GetProcAddress(aDLLHandle, 'rlFramebufferAttach');
  rlFramebufferComplete := GetProcAddress(aDLLHandle, 'rlFramebufferComplete');
  rlFrustum := GetProcAddress(aDLLHandle, 'rlFrustum');
  rlGenTextureMipmaps := GetProcAddress(aDLLHandle, 'rlGenTextureMipmaps');
  rlGetFramebufferHeight := GetProcAddress(aDLLHandle, 'rlGetFramebufferHeight');
  rlGetFramebufferWidth := GetProcAddress(aDLLHandle, 'rlGetFramebufferWidth');
  rlGetGlTextureFormats := GetProcAddress(aDLLHandle, 'rlGetGlTextureFormats');
  rlGetLineWidth := GetProcAddress(aDLLHandle, 'rlGetLineWidth');
  rlGetLocationAttrib := GetProcAddress(aDLLHandle, 'rlGetLocationAttrib');
  rlGetLocationUniform := GetProcAddress(aDLLHandle, 'rlGetLocationUniform');
  rlGetMatrixModelview := GetProcAddress(aDLLHandle, 'rlGetMatrixModelview');
  rlGetMatrixProjection := GetProcAddress(aDLLHandle, 'rlGetMatrixProjection');
  rlGetMatrixProjectionStereo := GetProcAddress(aDLLHandle, 'rlGetMatrixProjectionStereo');
  rlGetMatrixTransform := GetProcAddress(aDLLHandle, 'rlGetMatrixTransform');
  rlGetMatrixViewOffsetStereo := GetProcAddress(aDLLHandle, 'rlGetMatrixViewOffsetStereo');
  rlGetPixelFormatName := GetProcAddress(aDLLHandle, 'rlGetPixelFormatName');
  rlGetShaderBufferSize := GetProcAddress(aDLLHandle, 'rlGetShaderBufferSize');
  rlGetShaderIdDefault := GetProcAddress(aDLLHandle, 'rlGetShaderIdDefault');
  rlGetShaderLocsDefault := GetProcAddress(aDLLHandle, 'rlGetShaderLocsDefault');
  rlGetTextureIdDefault := GetProcAddress(aDLLHandle, 'rlGetTextureIdDefault');
  rlGetVersion := GetProcAddress(aDLLHandle, 'rlGetVersion');
  rlglClose := GetProcAddress(aDLLHandle, 'rlglClose');
  rlglInit := GetProcAddress(aDLLHandle, 'rlglInit');
  rlIsStereoRenderEnabled := GetProcAddress(aDLLHandle, 'rlIsStereoRenderEnabled');
  rlLoadComputeShaderProgram := GetProcAddress(aDLLHandle, 'rlLoadComputeShaderProgram');
  rlLoadDrawCube := GetProcAddress(aDLLHandle, 'rlLoadDrawCube');
  rlLoadDrawQuad := GetProcAddress(aDLLHandle, 'rlLoadDrawQuad');
  rlLoadExtensions := GetProcAddress(aDLLHandle, 'rlLoadExtensions');
  rlLoadFramebuffer := GetProcAddress(aDLLHandle, 'rlLoadFramebuffer');
  rlLoadIdentity := GetProcAddress(aDLLHandle, 'rlLoadIdentity');
  rlLoadRenderBatch := GetProcAddress(aDLLHandle, 'rlLoadRenderBatch');
  rlLoadShaderBuffer := GetProcAddress(aDLLHandle, 'rlLoadShaderBuffer');
  rlLoadShaderCode := GetProcAddress(aDLLHandle, 'rlLoadShaderCode');
  rlLoadShaderProgram := GetProcAddress(aDLLHandle, 'rlLoadShaderProgram');
  rlLoadTexture := GetProcAddress(aDLLHandle, 'rlLoadTexture');
  rlLoadTextureCubemap := GetProcAddress(aDLLHandle, 'rlLoadTextureCubemap');
  rlLoadTextureDepth := GetProcAddress(aDLLHandle, 'rlLoadTextureDepth');
  rlLoadVertexArray := GetProcAddress(aDLLHandle, 'rlLoadVertexArray');
  rlLoadVertexBuffer := GetProcAddress(aDLLHandle, 'rlLoadVertexBuffer');
  rlLoadVertexBufferElement := GetProcAddress(aDLLHandle, 'rlLoadVertexBufferElement');
  rlMatrixMode := GetProcAddress(aDLLHandle, 'rlMatrixMode');
  rlMultMatrixf := GetProcAddress(aDLLHandle, 'rlMultMatrixf');
  rlNormal3f := GetProcAddress(aDLLHandle, 'rlNormal3f');
  rlOrtho := GetProcAddress(aDLLHandle, 'rlOrtho');
  rlPopMatrix := GetProcAddress(aDLLHandle, 'rlPopMatrix');
  rlPushMatrix := GetProcAddress(aDLLHandle, 'rlPushMatrix');
  rlReadScreenPixels := GetProcAddress(aDLLHandle, 'rlReadScreenPixels');
  rlReadShaderBuffer := GetProcAddress(aDLLHandle, 'rlReadShaderBuffer');
  rlReadTexturePixels := GetProcAddress(aDLLHandle, 'rlReadTexturePixels');
  rlRotatef := GetProcAddress(aDLLHandle, 'rlRotatef');
  rlScalef := GetProcAddress(aDLLHandle, 'rlScalef');
  rlScissor := GetProcAddress(aDLLHandle, 'rlScissor');
  rlSetBlendFactors := GetProcAddress(aDLLHandle, 'rlSetBlendFactors');
  rlSetBlendFactorsSeparate := GetProcAddress(aDLLHandle, 'rlSetBlendFactorsSeparate');
  rlSetBlendMode := GetProcAddress(aDLLHandle, 'rlSetBlendMode');
  rlSetCullFace := GetProcAddress(aDLLHandle, 'rlSetCullFace');
  rlSetFramebufferHeight := GetProcAddress(aDLLHandle, 'rlSetFramebufferHeight');
  rlSetFramebufferWidth := GetProcAddress(aDLLHandle, 'rlSetFramebufferWidth');
  rlSetLineWidth := GetProcAddress(aDLLHandle, 'rlSetLineWidth');
  rlSetMatrixModelview := GetProcAddress(aDLLHandle, 'rlSetMatrixModelview');
  rlSetMatrixProjection := GetProcAddress(aDLLHandle, 'rlSetMatrixProjection');
  rlSetMatrixProjectionStereo := GetProcAddress(aDLLHandle, 'rlSetMatrixProjectionStereo');
  rlSetMatrixViewOffsetStereo := GetProcAddress(aDLLHandle, 'rlSetMatrixViewOffsetStereo');
  rlSetRenderBatchActive := GetProcAddress(aDLLHandle, 'rlSetRenderBatchActive');
  rlSetShader := GetProcAddress(aDLLHandle, 'rlSetShader');
  rlSetTexture := GetProcAddress(aDLLHandle, 'rlSetTexture');
  rlSetUniform := GetProcAddress(aDLLHandle, 'rlSetUniform');
  rlSetUniformMatrix := GetProcAddress(aDLLHandle, 'rlSetUniformMatrix');
  rlSetUniformSampler := GetProcAddress(aDLLHandle, 'rlSetUniformSampler');
  rlSetVertexAttribute := GetProcAddress(aDLLHandle, 'rlSetVertexAttribute');
  rlSetVertexAttributeDefault := GetProcAddress(aDLLHandle, 'rlSetVertexAttributeDefault');
  rlSetVertexAttributeDivisor := GetProcAddress(aDLLHandle, 'rlSetVertexAttributeDivisor');
  rlTexCoord2f := GetProcAddress(aDLLHandle, 'rlTexCoord2f');
  rlTextureParameters := GetProcAddress(aDLLHandle, 'rlTextureParameters');
  rlTranslatef := GetProcAddress(aDLLHandle, 'rlTranslatef');
  rlUnloadFramebuffer := GetProcAddress(aDLLHandle, 'rlUnloadFramebuffer');
  rlUnloadRenderBatch := GetProcAddress(aDLLHandle, 'rlUnloadRenderBatch');
  rlUnloadShaderBuffer := GetProcAddress(aDLLHandle, 'rlUnloadShaderBuffer');
  rlUnloadShaderProgram := GetProcAddress(aDLLHandle, 'rlUnloadShaderProgram');
  rlUnloadTexture := GetProcAddress(aDLLHandle, 'rlUnloadTexture');
  rlUnloadVertexArray := GetProcAddress(aDLLHandle, 'rlUnloadVertexArray');
  rlUnloadVertexBuffer := GetProcAddress(aDLLHandle, 'rlUnloadVertexBuffer');
  rlUpdateShaderBuffer := GetProcAddress(aDLLHandle, 'rlUpdateShaderBuffer');
  rlUpdateTexture := GetProcAddress(aDLLHandle, 'rlUpdateTexture');
  rlUpdateVertexBuffer := GetProcAddress(aDLLHandle, 'rlUpdateVertexBuffer');
  rlUpdateVertexBufferElements := GetProcAddress(aDLLHandle, 'rlUpdateVertexBufferElements');
  rlVertex2f := GetProcAddress(aDLLHandle, 'rlVertex2f');
  rlVertex2i := GetProcAddress(aDLLHandle, 'rlVertex2i');
  rlVertex3f := GetProcAddress(aDLLHandle, 'rlVertex3f');
  rlViewport := GetProcAddress(aDLLHandle, 'rlViewport');
  SaveFileData := GetProcAddress(aDLLHandle, 'SaveFileData');
  SaveFileText := GetProcAddress(aDLLHandle, 'SaveFileText');
  SeekMusicStream := GetProcAddress(aDLLHandle, 'SeekMusicStream');
  SetAudioStreamBufferSizeDefault := GetProcAddress(aDLLHandle, 'SetAudioStreamBufferSizeDefault');
  SetAudioStreamCallback := GetProcAddress(aDLLHandle, 'SetAudioStreamCallback');
  SetAudioStreamPan := GetProcAddress(aDLLHandle, 'SetAudioStreamPan');
  SetAudioStreamPitch := GetProcAddress(aDLLHandle, 'SetAudioStreamPitch');
  SetAudioStreamVolume := GetProcAddress(aDLLHandle, 'SetAudioStreamVolume');
  SetClipboardText := GetProcAddress(aDLLHandle, 'SetClipboardText');
  SetConfigFlags := GetProcAddress(aDLLHandle, 'SetConfigFlags');
  SetExitKey := GetProcAddress(aDLLHandle, 'SetExitKey');
  SetGamepadMappings := GetProcAddress(aDLLHandle, 'SetGamepadMappings');
  SetGesturesEnabled := GetProcAddress(aDLLHandle, 'SetGesturesEnabled');
  SetLoadFileDataCallback := GetProcAddress(aDLLHandle, 'SetLoadFileDataCallback');
  SetLoadFileTextCallback := GetProcAddress(aDLLHandle, 'SetLoadFileTextCallback');
  SetMasterVolume := GetProcAddress(aDLLHandle, 'SetMasterVolume');
  SetMaterialTexture := GetProcAddress(aDLLHandle, 'SetMaterialTexture');
  SetModelMeshMaterial := GetProcAddress(aDLLHandle, 'SetModelMeshMaterial');
  SetMouseCursor := GetProcAddress(aDLLHandle, 'SetMouseCursor');
  SetMouseOffset := GetProcAddress(aDLLHandle, 'SetMouseOffset');
  SetMousePosition := GetProcAddress(aDLLHandle, 'SetMousePosition');
  SetMouseScale := GetProcAddress(aDLLHandle, 'SetMouseScale');
  SetMusicPan := GetProcAddress(aDLLHandle, 'SetMusicPan');
  SetMusicPitch := GetProcAddress(aDLLHandle, 'SetMusicPitch');
  SetMusicVolume := GetProcAddress(aDLLHandle, 'SetMusicVolume');
  SetPhysicsBodyRotation := GetProcAddress(aDLLHandle, 'SetPhysicsBodyRotation');
  SetPhysicsGravity := GetProcAddress(aDLLHandle, 'SetPhysicsGravity');
  SetPhysicsTimeStep := GetProcAddress(aDLLHandle, 'SetPhysicsTimeStep');
  SetPixelColor := GetProcAddress(aDLLHandle, 'SetPixelColor');
  SetRandomSeed := GetProcAddress(aDLLHandle, 'SetRandomSeed');
  SetSaveFileDataCallback := GetProcAddress(aDLLHandle, 'SetSaveFileDataCallback');
  SetSaveFileTextCallback := GetProcAddress(aDLLHandle, 'SetSaveFileTextCallback');
  SetShaderValue := GetProcAddress(aDLLHandle, 'SetShaderValue');
  SetShaderValueMatrix := GetProcAddress(aDLLHandle, 'SetShaderValueMatrix');
  SetShaderValueTexture := GetProcAddress(aDLLHandle, 'SetShaderValueTexture');
  SetShaderValueV := GetProcAddress(aDLLHandle, 'SetShaderValueV');
  SetShapesTexture := GetProcAddress(aDLLHandle, 'SetShapesTexture');
  SetSoundPan := GetProcAddress(aDLLHandle, 'SetSoundPan');
  SetSoundPitch := GetProcAddress(aDLLHandle, 'SetSoundPitch');
  SetSoundVolume := GetProcAddress(aDLLHandle, 'SetSoundVolume');
  SetTargetFPS := GetProcAddress(aDLLHandle, 'SetTargetFPS');
  SetTextureFilter := GetProcAddress(aDLLHandle, 'SetTextureFilter');
  SetTextureWrap := GetProcAddress(aDLLHandle, 'SetTextureWrap');
  SetTraceLogCallback := GetProcAddress(aDLLHandle, 'SetTraceLogCallback');
  SetTraceLogLevel := GetProcAddress(aDLLHandle, 'SetTraceLogLevel');
  SetWindowIcon := GetProcAddress(aDLLHandle, 'SetWindowIcon');
  SetWindowIcons := GetProcAddress(aDLLHandle, 'SetWindowIcons');
  SetWindowMinSize := GetProcAddress(aDLLHandle, 'SetWindowMinSize');
  SetWindowMonitor := GetProcAddress(aDLLHandle, 'SetWindowMonitor');
  SetWindowOpacity := GetProcAddress(aDLLHandle, 'SetWindowOpacity');
  SetWindowPosition := GetProcAddress(aDLLHandle, 'SetWindowPosition');
  SetWindowSize := GetProcAddress(aDLLHandle, 'SetWindowSize');
  SetWindowState := GetProcAddress(aDLLHandle, 'SetWindowState');
  SetWindowTitle := GetProcAddress(aDLLHandle, 'SetWindowTitle');
  ShowCursor := GetProcAddress(aDLLHandle, 'ShowCursor');
  StopAudioStream := GetProcAddress(aDLLHandle, 'StopAudioStream');
  StopMusicStream := GetProcAddress(aDLLHandle, 'StopMusicStream');
  StopSound := GetProcAddress(aDLLHandle, 'StopSound');
  SwapScreenBuffer := GetProcAddress(aDLLHandle, 'SwapScreenBuffer');
  TakeScreenshot := GetProcAddress(aDLLHandle, 'TakeScreenshot');
  TextAppend := GetProcAddress(aDLLHandle, 'TextAppend');
  TextCopy := GetProcAddress(aDLLHandle, 'TextCopy');
  TextFindIndex := GetProcAddress(aDLLHandle, 'TextFindIndex');
  TextFormat := GetProcAddress(aDLLHandle, 'TextFormat');
  TextInsert := GetProcAddress(aDLLHandle, 'TextInsert');
  TextIsEqual := GetProcAddress(aDLLHandle, 'TextIsEqual');
  TextJoin := GetProcAddress(aDLLHandle, 'TextJoin');
  TextLength := GetProcAddress(aDLLHandle, 'TextLength');
  TextReplace := GetProcAddress(aDLLHandle, 'TextReplace');
  TextSplit := GetProcAddress(aDLLHandle, 'TextSplit');
  TextSubtext := GetProcAddress(aDLLHandle, 'TextSubtext');
  TextToInteger := GetProcAddress(aDLLHandle, 'TextToInteger');
  TextToLower := GetProcAddress(aDLLHandle, 'TextToLower');
  TextToPascal := GetProcAddress(aDLLHandle, 'TextToPascal');
  TextToUpper := GetProcAddress(aDLLHandle, 'TextToUpper');
  ToggleFullscreen := GetProcAddress(aDLLHandle, 'ToggleFullscreen');
  TraceLog := GetProcAddress(aDLLHandle, 'TraceLog');
  UnloadAudioStream := GetProcAddress(aDLLHandle, 'UnloadAudioStream');
  UnloadCodepoints := GetProcAddress(aDLLHandle, 'UnloadCodepoints');
  UnloadDirectoryFiles := GetProcAddress(aDLLHandle, 'UnloadDirectoryFiles');
  UnloadDroppedFiles := GetProcAddress(aDLLHandle, 'UnloadDroppedFiles');
  UnloadFileData := GetProcAddress(aDLLHandle, 'UnloadFileData');
  UnloadFileText := GetProcAddress(aDLLHandle, 'UnloadFileText');
  UnloadFont := GetProcAddress(aDLLHandle, 'UnloadFont');
  UnloadFontData := GetProcAddress(aDLLHandle, 'UnloadFontData');
  UnloadImage := GetProcAddress(aDLLHandle, 'UnloadImage');
  UnloadImageColors := GetProcAddress(aDLLHandle, 'UnloadImageColors');
  UnloadImagePalette := GetProcAddress(aDLLHandle, 'UnloadImagePalette');
  UnloadMaterial := GetProcAddress(aDLLHandle, 'UnloadMaterial');
  UnloadMesh := GetProcAddress(aDLLHandle, 'UnloadMesh');
  UnloadModel := GetProcAddress(aDLLHandle, 'UnloadModel');
  UnloadModelAnimation := GetProcAddress(aDLLHandle, 'UnloadModelAnimation');
  UnloadModelAnimations := GetProcAddress(aDLLHandle, 'UnloadModelAnimations');
  UnloadMusicStream := GetProcAddress(aDLLHandle, 'UnloadMusicStream');
  UnloadRenderTexture := GetProcAddress(aDLLHandle, 'UnloadRenderTexture');
  UnloadShader := GetProcAddress(aDLLHandle, 'UnloadShader');
  UnloadSound := GetProcAddress(aDLLHandle, 'UnloadSound');
  UnloadTexture := GetProcAddress(aDLLHandle, 'UnloadTexture');
  UnloadUTF8 := GetProcAddress(aDLLHandle, 'UnloadUTF8');
  UnloadVrStereoConfig := GetProcAddress(aDLLHandle, 'UnloadVrStereoConfig');
  UnloadWave := GetProcAddress(aDLLHandle, 'UnloadWave');
  UnloadWaveSamples := GetProcAddress(aDLLHandle, 'UnloadWaveSamples');
  UpdateAudioStream := GetProcAddress(aDLLHandle, 'UpdateAudioStream');
  UpdateCamera := GetProcAddress(aDLLHandle, 'UpdateCamera');
  UpdateCameraPro := GetProcAddress(aDLLHandle, 'UpdateCameraPro');
  UpdateMeshBuffer := GetProcAddress(aDLLHandle, 'UpdateMeshBuffer');
  UpdateModelAnimation := GetProcAddress(aDLLHandle, 'UpdateModelAnimation');
  UpdateMusicStream := GetProcAddress(aDLLHandle, 'UpdateMusicStream');
  UpdatePhysics := GetProcAddress(aDLLHandle, 'UpdatePhysics');
  UpdateSound := GetProcAddress(aDLLHandle, 'UpdateSound');
  UpdateTexture := GetProcAddress(aDLLHandle, 'UpdateTexture');
  UpdateTextureRec := GetProcAddress(aDLLHandle, 'UpdateTextureRec');
  UploadMesh := GetProcAddress(aDLLHandle, 'UploadMesh');
  Vector2Add := GetProcAddress(aDLLHandle, 'Vector2Add');
  Vector2AddValue := GetProcAddress(aDLLHandle, 'Vector2AddValue');
  Vector2Angle := GetProcAddress(aDLLHandle, 'Vector2Angle');
  Vector2Clamp := GetProcAddress(aDLLHandle, 'Vector2Clamp');
  Vector2ClampValue := GetProcAddress(aDLLHandle, 'Vector2ClampValue');
  Vector2Distance := GetProcAddress(aDLLHandle, 'Vector2Distance');
  Vector2DistanceSqr := GetProcAddress(aDLLHandle, 'Vector2DistanceSqr');
  Vector2Divide := GetProcAddress(aDLLHandle, 'Vector2Divide');
  Vector2DotProduct := GetProcAddress(aDLLHandle, 'Vector2DotProduct');
  Vector2Equals := GetProcAddress(aDLLHandle, 'Vector2Equals');
  Vector2Invert := GetProcAddress(aDLLHandle, 'Vector2Invert');
  Vector2Length := GetProcAddress(aDLLHandle, 'Vector2Length');
  Vector2LengthSqr := GetProcAddress(aDLLHandle, 'Vector2LengthSqr');
  Vector2Lerp := GetProcAddress(aDLLHandle, 'Vector2Lerp');
  Vector2LineAngle := GetProcAddress(aDLLHandle, 'Vector2LineAngle');
  Vector2MoveTowards := GetProcAddress(aDLLHandle, 'Vector2MoveTowards');
  Vector2Multiply := GetProcAddress(aDLLHandle, 'Vector2Multiply');
  Vector2Negate := GetProcAddress(aDLLHandle, 'Vector2Negate');
  Vector2Normalize := GetProcAddress(aDLLHandle, 'Vector2Normalize');
  Vector2One := GetProcAddress(aDLLHandle, 'Vector2One');
  Vector2Reflect := GetProcAddress(aDLLHandle, 'Vector2Reflect');
  Vector2Rotate := GetProcAddress(aDLLHandle, 'Vector2Rotate');
  Vector2Scale := GetProcAddress(aDLLHandle, 'Vector2Scale');
  Vector2Subtract := GetProcAddress(aDLLHandle, 'Vector2Subtract');
  Vector2SubtractValue := GetProcAddress(aDLLHandle, 'Vector2SubtractValue');
  Vector2Transform := GetProcAddress(aDLLHandle, 'Vector2Transform');
  Vector2Zero := GetProcAddress(aDLLHandle, 'Vector2Zero');
  Vector3Add := GetProcAddress(aDLLHandle, 'Vector3Add');
  Vector3AddValue := GetProcAddress(aDLLHandle, 'Vector3AddValue');
  Vector3Angle := GetProcAddress(aDLLHandle, 'Vector3Angle');
  Vector3Barycenter := GetProcAddress(aDLLHandle, 'Vector3Barycenter');
  Vector3Clamp := GetProcAddress(aDLLHandle, 'Vector3Clamp');
  Vector3ClampValue := GetProcAddress(aDLLHandle, 'Vector3ClampValue');
  Vector3CrossProduct := GetProcAddress(aDLLHandle, 'Vector3CrossProduct');
  Vector3Distance := GetProcAddress(aDLLHandle, 'Vector3Distance');
  Vector3DistanceSqr := GetProcAddress(aDLLHandle, 'Vector3DistanceSqr');
  Vector3Divide := GetProcAddress(aDLLHandle, 'Vector3Divide');
  Vector3DotProduct := GetProcAddress(aDLLHandle, 'Vector3DotProduct');
  Vector3Equals := GetProcAddress(aDLLHandle, 'Vector3Equals');
  Vector3Invert := GetProcAddress(aDLLHandle, 'Vector3Invert');
  Vector3Length := GetProcAddress(aDLLHandle, 'Vector3Length');
  Vector3LengthSqr := GetProcAddress(aDLLHandle, 'Vector3LengthSqr');
  Vector3Lerp := GetProcAddress(aDLLHandle, 'Vector3Lerp');
  Vector3Max := GetProcAddress(aDLLHandle, 'Vector3Max');
  Vector3Min := GetProcAddress(aDLLHandle, 'Vector3Min');
  Vector3Multiply := GetProcAddress(aDLLHandle, 'Vector3Multiply');
  Vector3Negate := GetProcAddress(aDLLHandle, 'Vector3Negate');
  Vector3Normalize := GetProcAddress(aDLLHandle, 'Vector3Normalize');
  Vector3One := GetProcAddress(aDLLHandle, 'Vector3One');
  Vector3OrthoNormalize := GetProcAddress(aDLLHandle, 'Vector3OrthoNormalize');
  Vector3Perpendicular := GetProcAddress(aDLLHandle, 'Vector3Perpendicular');
  Vector3Reflect := GetProcAddress(aDLLHandle, 'Vector3Reflect');
  Vector3Refract := GetProcAddress(aDLLHandle, 'Vector3Refract');
  Vector3RotateByAxisAngle := GetProcAddress(aDLLHandle, 'Vector3RotateByAxisAngle');
  Vector3RotateByQuaternion := GetProcAddress(aDLLHandle, 'Vector3RotateByQuaternion');
  Vector3Scale := GetProcAddress(aDLLHandle, 'Vector3Scale');
  Vector3Subtract := GetProcAddress(aDLLHandle, 'Vector3Subtract');
  Vector3SubtractValue := GetProcAddress(aDLLHandle, 'Vector3SubtractValue');
  Vector3ToFloatV := GetProcAddress(aDLLHandle, 'Vector3ToFloatV');
  Vector3Transform := GetProcAddress(aDLLHandle, 'Vector3Transform');
  Vector3Unproject := GetProcAddress(aDLLHandle, 'Vector3Unproject');
  Vector3Zero := GetProcAddress(aDLLHandle, 'Vector3Zero');
  WaitTime := GetProcAddress(aDLLHandle, 'WaitTime');
  WaveCopy := GetProcAddress(aDLLHandle, 'WaveCopy');
  WaveCrop := GetProcAddress(aDLLHandle, 'WaveCrop');
  WaveFormat := GetProcAddress(aDLLHandle, 'WaveFormat');
  WindowShouldClose := GetProcAddress(aDLLHandle, 'WindowShouldClose');
  Wrap := GetProcAddress(aDLLHandle, 'Wrap');
{$ENDREGION}
end;

var
  DllHandle: THandle = 0;
  DllFilename: string = '';

function GetTempPath: string;
var
  LTmp: array[0..MAX_PATH] of Char;
  LLen: Integer;
begin
  SetLastError(ERROR_SUCCESS);

  LLen := Windows.GetTempPath(MAX_PATH, LTmp);
  if LLen <> 0 then
  begin
    LLen := GetLongPathName(LTmp, nil, 0);
    SetLength(Result, LLen - 1);
    GetLongPathName(LTmp, PChar(Result), LLen);
  end
  else
    Result := '';
end;

function GetTempGUIDFileName: string;
var
  LGuid: TGUID;
begin
  Result := '';
  if CreateGUID(LGuid) = S_OK then
  begin
    Result := GUIDToString(LGuid);
    Result := Copy(Result, 2, Length(Result) - 1 - 1);
    Result := ReplaceStr(Result, '-', '');
    Result := LowerCase(Result);
    Result := GetTempPath + Result + '.tmp';
  end;
end;

procedure AbortDLL;
begin
  if DLLHandle <> 0 then
  begin
    FreeLibrary(DllHandle);
    DllHandle := 0;
  end;

  if SysUtils.FileExists(DllFilename) then
    SysUtils.DeleteFile(DllFilename);

  Halt;
end;

procedure LoadDLL;
const
  cDllResName = 'a370e5231edc40bf965a58337993b19c';
var
  LResStream: TResourceStream;
begin
  if DllHandle <> 0 then Exit;
  if not Boolean((FindResource(HInstance, PChar(cDllResName), RT_RCDATA) <> 0)) then AbortDLL;
  LResStream := TResourceStream.Create(HInstance, cDLLResName, RT_RCDATA);
  try
    LResStream.Position := 0;
    DllFilename := GetTempGUIDFilename;
    LResStream.SaveToFile(DllFilename);
    if not SysUtils.FileExists(DllFilename) then Abort;
    DllHandle := LoadLibraryW(PChar(DllFilename));
    if DLLHandle = 0 then Abort;

  finally
    LResStream.Free;
  end;
  if DllHandle = 0 then Exit;
  GetExports(DllHandle);
end;

procedure UnloadDLL;
begin
  if DllHandle = 0 then Exit;
  FreeLibrary(DllHandle);
  DeleteFile(DllFilename);
  DllHandle := 0
end;

initialization
  ReportMemoryLeaksOnShutdown := True;
  LoadDLL;

finalization
  UnloadDLL;

end.
