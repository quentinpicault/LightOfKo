shader_type canvas_item;

uniform sampler2D light_world_viewport;
uniform sampler2D dark_world_viewport;
uniform sampler2D mask_texture;
uniform float mix_amount : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    vec4 color1 = texture(light_world_viewport, SCREEN_UV);
    vec4 color2 = texture(dark_world_viewport, SCREEN_UV);
    float mask_val = texture(mask_texture, UV).r;

    vec4 combined = mix(color2, color1, mask_val);

    COLOR = mix(color1, combined, mix_amount);
}