shader_type canvas_item;

uniform sampler2D viewport_texture;
uniform float softness : hint_range(0.0, 0.5) = 0.1;

void fragment() {
    float dist = distance(UV, vec2(0.5));
    float alpha = 1.0 - smoothstep(0.5 - softness, 0.5, dist);
    vec2 screen_pos = SCREEN_UV;
    vec4 color = texture(viewport_texture, screen_pos); 
    color.a *= alpha;
    COLOR = color;
}