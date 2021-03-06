#version 120

uniform mat4 p3d_ModelViewProjectionMatrix;
uniform mat4 p3d_ModelViewMatrix;
uniform mat3 p3d_NormalMatrix;
uniform mat4 p3d_ModelMatrixInverse;
uniform vec3 light_dir;

attribute vec4 p3d_Vertex;
attribute vec3 p3d_Normal;
attribute vec2 p3d_MultiTexCoord0;
attribute vec4 p3d_Color;

varying vec3 vtx_pos;
varying vec4 vtx_color;
varying vec3 normal;
varying vec2 texcoord;
varying vec3 light;


void main() {
    vec4 vtx_pos4 = p3d_ModelViewMatrix * p3d_Vertex;
    vtx_pos = vec3(vtx_pos4) / vtx_pos4.w;
    light = normalize(p3d_NormalMatrix * (p3d_ModelMatrixInverse * vec4(normalize(light_dir), 0.0f)).xyz);
    normal = normalize(p3d_NormalMatrix * p3d_Normal);
    texcoord = p3d_MultiTexCoord0;
    vtx_color = p3d_Color;

    gl_Position = p3d_ModelViewProjectionMatrix * p3d_Vertex;
}
