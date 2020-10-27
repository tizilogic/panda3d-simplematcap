#version 120

uniform sampler2D p3d_Texture0;
uniform sampler2D matcap;

varying vec3 vtx_pos;
varying vec4 vtx_color;
varying vec3 normal;
varying vec2 texcoord;
varying vec3 light;


void main() {
    vec4 base_color = vtx_color * texture2D(p3d_Texture0, texcoord);
    vec3 n = normalize(normal);
    vec3 v = normalize(-vtx_pos.xyz);
    n = normalize(light + n + v);
    vec2 muv = n.xy * 0.5f + 0.5f;
    vec4 matcap_color = texture2D(matcap, vec2(1.0f - muv.x, muv.y));

    gl_FragColor = base_color * (matcap_color * 2.0f);
}