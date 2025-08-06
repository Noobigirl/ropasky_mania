shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;
uniform bool reverse = true;

void fragment() {
    float edge_left = (1.0 - progress) * 0.5;

    if (UV.x > progress) {
		if (!reverse){
		 discard; // outside the open area
		}
    }
	 else if (reverse){
		discard;
	}
}
