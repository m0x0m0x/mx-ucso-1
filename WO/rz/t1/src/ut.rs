// main utiities file
#![allow(dead_code)]

use cfonts::{Fonts, Options, say};
use std::process::Command;
use yansi::Paint;

// Main gradient function
pub fn print_with_synthwave_gradient(text: String) {
    // Define the fire gradient colors
    let synth = vec![
        String::from("#FF00FF"), // Neon Pink
        String::from("#8A2BE2"), // Blue Violet
        String::from("#00FFFF"), // Cyan
        String::from("#FF1493"), // Deep Pink
        String::from("#9400D3"), // Dark Violet
    ];

    say(Options {
        text,
        font: Fonts::FontTiny,
        gradient: synth,
        independent_gradient: false,
        transition_gradient: true,
        spaceless: true,
        ..Options::default()
    });
}

pub fn header(text: &str) {
    let line = "~".repeat(20);
    println!("{} \n {} \n{}", line.blue(), text.blue(), line.blue());
}

// Function to clear console
pub fn clear_console() {
    Command::new("clear")
        .status()
        .expect("Failed to clear console");
}

// Draws a divider with an input character
pub fn divy(s: &str) {
    let line = s.repeat(20);
    println!("{}", line);
}