sprW = sprite_get_width(sprite_index) * 2;
sprH = sprite_get_height(sprite_index) * 2;
cam = view_camera[0];
vx = camera_get_view_x(cam);
vy = camera_get_view_y(cam);
vw = camera_get_view_width(cam);
vh = camera_get_view_height(cam);
startX = floor(vx / sprW) * sprW;
startY = floor(vy / sprH) * sprH;

for (var xx = startX; xx < vx + vw + sprW; xx += sprW) {
    
    for (var yy = startY; yy < vy + vh + sprH; yy += sprH) {
        
        draw_sprite_ext(sprite_index, image_index, xx, yy, 2, 2, 0, c_white, 0.5);
        
    }
}