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

use alloy_primitives::{keccak256, B256};
use alloy_primitives::hex::FromHex;
use alloy_signer_wallet::LocalWallet as LocalSigner;
use alloy_signer::Signer;

// -- Main Function cAll 

pub fn w1_main() {
    let title = "~ Get v r s from private key ~";
    println!("{}", title.yellow().on_blue());
}


// --- Sub Functions ---

fn w1_vrs() {
    

}