// reversed
var text_lines = [
    "Shylily (all rights reserved) used for non-commercial use & more credited in credits.",
    "Kharua & FryVenture team for Soviet Union and more.",
    "LeChonk FAN ClubTM - Meow, Rvspijker, TRT_ndv19, and Skittlelover69",
    "LeChonk FAN Club",
];

var text_font = coderscrux;
var text_color = c_white;
var margin = 10;
var line_spacing = 24;
var x_pos = margin;
var y_pos = room_height - line_spacing; //idk it just works

draw_set_font(text_font);
draw_set_color(text_color);
for (var i = 0; i < array_length(text_lines); i++) {
    draw_text(x_pos, y_pos - (i * line_spacing), text_lines[i]);
}
