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

use alloy_primitives::{keccak256, B256, hex::FromHex};
use alloy_signer::Signer;
use alloy_signer_wallet::LocalWallet;

// -- Main Function cAll 

pub fn w1_main() {
    let title = "~ Get v r s from private key ~";
    println!("{}", title.yellow().on_blue());
}


// --- Sub Functions ---

fn w1_vrs() {
    
    let private_key_hex = "0xe3185425e6ff3e7ab38157c726623225942eb666f3b5fcc321c21f574084ec85";
    let private_key = B256::from_hex(private_key_hex).unwrap();

    // Create wallet from private key
    let wallet = LocalWallet::from_bytes(private_key).unwrap();

    // Hash message
    let message = b"hello world";
    let message_hash = keccak256(message);

    // Sign the hash
    let sig = wallet.sign_hash_sync(message_hash).unwrap();

    println!("r: 0x{:x}", sig.r);
    println!("s: 0x{:x}", sig.s);
    println!("v: {}", sig.v);

}