#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec4 topC;
    vec4 bottomC;
    vec4 gridColor;
    float gridSize;
    float aspectRatio;
} ubuf;

void main() {
    vec2 uv = qt_TexCoord0;

    float dist = length(uv - vec2(0.5));
    vec4 background = mix(ubuf.topC, ubuf.bottomC, smoothstep(0.0, 1.2, dist));

    vec2 gridUV = vec2(uv.x * ubuf.aspectRatio, uv.y) / vec2(ubuf.gridSize);
    vec2 gridLines = abs(fract(gridUV - 0.5) - 0.5) / fwidth(gridUV);
    float line = min(gridLines.x, gridLines.y);

    float gridMask = 1.0 - smoothstep(0.0, 1.0, line);

    float edgeFade = 1.0 - smoothstep(0.15, 0.55, dist);
    vec4 finalGrid = ubuf.gridColor * gridMask * 0.18 * edgeFade;

    fragColor = (background + finalGrid) * ubuf.qt_Opacity;
}