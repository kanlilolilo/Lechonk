if (state == "fadein") {
    alpha += fade_speed;
    if (alpha >= 1) {
        alpha = 1;
        state = "fadeout";
        alarm[0] = 200;
    }
}

if (state == "fadeout") {
    alpha -= fade_speed; // Fade out
    if (alpha <= 0) {
        alpha = 0;
        room_goto(TitleScreen); // Ga naar de volgende room
    }
}
