#version 440

#include "global.glsl"

layout(binding = 0) uniform sampler2D cam_color;
layout(binding = 1) uniform sampler2D cam_depth;

out vec4 color;

void main(void) {
	vec2 uv = gl_FragCoord.xy / win_dims;
	// Y-flip for textures
	uv.y = 1.0 - uv.y;
	float depth = texture(cam_depth, uv).x;
	if (isinf(depth) || isnan(depth)) {
		discard;
	}
	color = texture(cam_color, uv);
}

