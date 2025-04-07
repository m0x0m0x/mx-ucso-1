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
use alloy_signer_wallet::wallet::LocalWallet;

// -- Main Function cAll 

pub fn w1_main() {
    let title = "~ Get v r s from private key ~";
    println!("{}", title.yellow().on_blue());
    w1_vrs()
}


// --- Sub Functions ---

fn w1_vrs() {
     // Initialize the signer with your private key
     let private_key = "0xe3185425e6ff3e7ab38157c726623225942eb666f3b5fcc321c21f574084ec85"; // Replace with your actual private key
     let signer = PrivateKeySigner::from_bytes(&hex::decode(private_key)?).expect("Invalid private key");
 
     // The message to sign
     let message = b"hello";
 
     // Sign the message
     let signature: Signature = signer.sign_message_sync(message)?;
 
     // Extract r and s values
     let r = signature.r();
     let s = signature.s();
 
     // Determine the recovery id (v value)
     let v = signature.recovery_id().map(|id| id.to_byte()).unwrap_or(0);
 
     println!("r: {:?}", r);
     println!("s: {:?}", s);
     println!("v: {:?}", v);
 
     Ok(())
 }

}