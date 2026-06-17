#ifdef GL_ES
precision mediump float;
#endif
varying vec4 v_color;
uniform sampler2D u_texture;
uniform vec2 u_resolution;
uniform vec2 u_lightPos;
uniform float u_lightRadius;

void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution;
    vec4 color = texture2D(u_texture, uv);
    vec2 lightDir = u_lightPos - gl_FragCoord.xy;
    float dist = length(lightDir);
    float intensity = max(0.0, 1.0 - dist / u_lightRadius);
    vec3 lightColor = vec3(1.0, 0.9, 0.7) * intensity;
    gl_FragColor = vec4(color.rgb + lightColor, 1.0);
}
