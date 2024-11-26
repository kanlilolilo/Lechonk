// Use built-in current_time to get the system time in milliseconds and convert it to seconds
var time_seconds = current_time / 1000;  // Convert milliseconds to seconds

// Define the rectangle dimensions
var x1 = 0;
var y1 = 700;
var x2 = room_width;
var y2 = 760;

// Define the colors as RGB values (use make_color_rgb for specific RGB colors)
var color1 = make_color_rgb(223, 113, 38);  // DF7126
var color2 = make_color_rgb(99, 155, 255);  // 639BFF
var color3 = make_color_rgb(106, 190, 48);  // 6ABE30

// Normalize the time to create a looping progress variable (0 to 1)
var progress = (time_seconds / 6) % 1;  // Loops every 6 seconds (adjust this for speed)

// Interpolation logic to smoothly transition through all three colors
if (progress < 0.33) {
    // Transition from color1 (DF7126) to color2 (639BFF)
    var p = progress / 0.33;
    var r = (1 - p) * 223 + p * 99;  // Red interpolation
    var g = (1 - p) * 113 + p * 155; // Green interpolation
    var b = (1 - p) * 38 + p * 255;  // Blue interpolation
} else if (progress < 0.66) {
    // Transition from color2 (639BFF) to color3 (6ABE30)
    var p = (progress - 0.33) / 0.33;
    var r = (1 - p) * 99 + p * 106;  // Red interpolation
    var g = (1 - p) * 155 + p * 190; // Green interpolation
    var b = (1 - p) * 255 + p * 48;  // Blue interpolation
} else {
    // Transition from color3 (6ABE30) to color1 (DF7126)
    var p = (progress - 0.66) / 0.34;
    var r = (1 - p) * 106 + p * 223;  // Red interpolation
    var g = (1 - p) * 190 + p * 113; // Green interpolation
    var b = (1 - p) * 48 + p * 38;   // Blue interpolation
}

// Calculate the animated gradient color
var anim_color = make_color_rgb(r, g, b);

// Draw the gradient rectangle
draw_rectangle_color(x1, y1, x2, y2, anim_color, anim_color, anim_color, anim_color, false);

// Draw a black rectangle covering everything below y2
draw_set_color(c_black);  // Set color to black
draw_rectangle(x1, y2, x2, room_height, false);  // Draw black rectangle from y2 to the bottom of the room

// Set the font to 'coderscrux'
draw_set_font(coderscrux);

// Set all text color to white
draw_set_color(c_white);

// Calculate the position to center the "PRESS ANY BUTTON" text
var text = "Press any button...";
var text_width = string_width(text);
var text_height = string_height(text);

// Center the text within the rectangle
var text_x = (room_width - text_width) / 2;
var text_y = (y1 + y2 - text_height) / 2 + 3;

// Draw the "PRESS ANY BUTTON" text in the center of the rectangle
draw_text(text_x, text_y, text);

// Draw "lechonk fan club" in the bottom left of the black area
var fan_club_text = "LeChonk FAN ClubTM";
var fan_club_text_width = string_width(fan_club_text);
var fan_club_text_height = string_height(fan_club_text);

// Positioning it in the bottom left corner with padding
var fan_club_text_x = x1 + 10;  // 10 pixels from the left
var fan_club_text_y = room_height - fan_club_text_height - 10;  // 10 pixels from the bottom

// Draw the "lechonk fan club" text
draw_text(fan_club_text_x, fan_club_text_y, fan_club_text);
