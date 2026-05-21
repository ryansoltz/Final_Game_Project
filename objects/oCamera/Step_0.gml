if (instance_exists(follow)) {
    xTo = follow.x;
    yTo = follow.y;
}

x = x + (xTo - x) / cam_followspeed;
y = y + (yTo - y) / cam_followspeed;


camera_set_view_pos(cam, round(x - width_half), round(y - height_half));