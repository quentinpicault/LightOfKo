shader_type canvas_item;

uniform sampler2D world_1_viewport;
uniform sampler2D world_2_viewport;
uniform sampler2D mask_texture;

void fragment() {
    vec4 color1 = texture(world_1_viewport, SCREEN_UV);
    vec4 color2 = texture(world_2_viewport, SCREEN_UV);
    float mask_value = texture(mask_texture, UV).r;
    COLOR = mix(color2, color1, mask_value);
}