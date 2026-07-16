#version 440

// 1. INPUTS FROM VERTEX SHADER
// In Qt 6, you must explicitly declare the input location for coordinates.
layout(location = 0) in vec2 qt_TexCoord0;

// 2. OUTPUT TO SCREEN
layout(location = 0) out vec4 fragColor;

// 3. UNIFORM BLOCK (Must be binding 0)
// The names here MUST match your 'property' names in QML.
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
    vec4 topC;
    vec4 bottomC;
    vec4 gridColor;
    float gridSize;
} ubuf; // naming the block instance 'ubuf' is a best practice

void main() {
    // Explicitly use vec2 for the coordinate
    vec2 uv = qt_TexCoord0;

    // 1. Background Radial Gradient
    float dist = length(uv - vec2(0.5));
    vec4 background = mix(ubuf.topC, ubuf.bottomC, smoothstep(0.0, 0.8, dist));

    // 2. Grid Logic (Fixing potential type-conversion issues)
    // We ensure gridSize is used as a vec2 for the division to avoid the 'temp float' error
    vec2 gridUV = uv / vec2(ubuf.gridSize);
    vec2 gridLines = abs(fract(gridUV - 0.5) - 0.5) / fwidth(gridUV);
    float line = min(gridLines.x, gridLines.y);
    
    // Grid line thickness (1.2 pixels wide)
    float gridMask = 1.0 - smoothstep(0.0, 1.2, line);

    // 3. Final Composition
    // Fade the grid out towards the edges so it disappears into the vignette
    float edgeFade = 1.0 - smoothstep(0.2, 0.6, dist);
    vec4 finalGrid = ubuf.gridColor * gridMask * 0.3 * edgeFade;

    fragColor = (background + finalGrid) * ubuf.qt_Opacity;
}