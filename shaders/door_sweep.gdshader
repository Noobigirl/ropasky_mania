shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    float edge_left = (1.0 - progress) * 0.5;
    float edge_right = 1.0 - edge_left;

    if (UV.x < edge_left || UV.x > edge_right) {
        discard; // outside the open area
    } else {
        COLOR = texture(TEXTURE, UV);
    }
}
