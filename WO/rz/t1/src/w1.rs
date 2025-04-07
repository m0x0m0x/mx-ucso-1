/*
This rust file is to calculate the v r s from the private key provided
*/

#![allow(unused)]
#![allow(dead_code)]
#![allow(unused_imports)]
#![allow(unused_variables)]

// --- Imports ---
use crate::ut::print_with_synthwave_gradient;
use yansi::Paint;

use alloy_primitives::{keccak256, B256, U256};
use alloy_signer::SignerSync;
use alloy_signer::local::LocalSigner;

// -- Main Function cAll 

pub fn w1_main() {
    let title = "~ Get v r s from private key ~";
    println!("{}", title.yellow().on_blue());
}


// --- Sub Functions ---

fn w1_vrs() {
    // Private key (32 bytes)
    let wallet: LocalWallet = "4c0883a69102937d6231471b5dbb6204fe5129617082797a6f110b6436e4b8e7"
        .parse()
        .unwrap();

    // Hash the message (keccak256 of raw bytes)
    let message = b"hello world";
    let message_hash: B256 = keccak256(message);

    // Sign the message hash
    let sig = wallet.sign_hash(message_hash).unwrap();

    // Extract v, r, s
    let v = sig.v;
    let r = sig.r;
    let s = sig.s;

    println!("r: 0x{:x}", r);
    println!("s: 0x{:x}", s);
    println!("v: {}", v); // 27 or 28
}