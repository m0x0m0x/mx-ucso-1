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

use alloy_primitives::{hex::FromHex, Signature, B256};
use alloy_signer::Signer;
use alloy_signer_local::LocalWallet;

// -- Main Function cAll

pub fn w1_main() {
    let title = "~ Get v r s from private key ~";
    println!("{}", title.yellow().on_blue());
    w1_vrs()
}

// --- Sub Functions ---

fn w1_vrs() -> Result<(), Box<dyn std::error::Error>> {
    // Initialize the signer with your private key
    let private_key = "your_private_key_here"; // Replace with your actual private key
    let private_key_bytes = B256::from_hex(private_key).expect("Invalid hex");
    let signer = LocalWallet::from_bytes(&private_key_bytes).expect("Invalid private key");

    // The message to sign
    let message = b"hello";

    // Sign the message
    let signature = signer.sign_message_sync(message)?;

    // Extract r and s values
    let r = signature.r;
    let s = signature.s;

    // Determine the recovery id (v value)
    let v = signature.v().to_byte();

    println!("r: {:?}", r);
    println!("s: {:?}", s);
    println!("v: {:?}", v);

    Ok(())
}