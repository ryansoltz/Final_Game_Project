if (instance_exists(follow)) {
    xTo = follow.x;
    yTo = follow.y;
}

x += (xTo - x) / cam_followspeed;
y += (yTo - y) / cam_followspeed;


camera_set_view_pos(cam, x - width_half, y - height_half);