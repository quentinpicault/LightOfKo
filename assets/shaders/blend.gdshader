shader_type canvas_item;

uniform sampler2D world_1_viewport;
uniform sampler2D world_2_viewport;
uniform sampler2D mask_texture;
uniform float blend_amount : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    vec4 color1 = texture(world_1_viewport, SCREEN_UV);
    vec4 color2 = texture(world_2_viewport, SCREEN_UV);
    float mask_val = texture(mask_texture, UV).r;

    vec4 combined = mix(color2, color1, mask_val);

    COLOR = mix(color1, combined, blend_amount);
}