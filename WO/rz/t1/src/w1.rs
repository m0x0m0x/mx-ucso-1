/*
This rust file is to calculate the v r s from the private key provided
*/

#![allow(unused)]
#![allow(dead_code)]
#![allow(unused_imports)]
#![allow(unused_variables)]
use ethers::core::types::{H256, U256}; // Hash and number types
use ethers::prelude::{LocalWallet, Signature, Signer}; // Core ethers types
use hex;
use std::str::FromStr;
use thiserror::Error;
use yansi::Paint; // For colored output

#[derive(Debug, Error)]
enum SimpleSignError {
    #[error("Invalid private key hex: {0}")]
    InvalidHex(#[from] hex::FromHexError),
    #[error("Failed to create wallet from private key: {0}")]
    WalletError(String), // Catch ethers specific wallet errors
    #[error("Failed to sign hash: {0}")]
    SigningError(String), // Catch ethers specific signing errors
}

// -- Main Function cAll

pub fn w1_main() {
    let title = "~ Get v r s from private key ~";
    println!("{}", title.yellow().on_blue());
    w1_vrs();
}

#[tokio::main]
async fn w1_vrs() -> Result<(), SimpleSignError> {
    println!("--- Simple v, r, s Derivation using ethers-rs ---");

    // --- IMPORTANT SECURITY WARNING ---
    // Replace with your actual private key ONLY for local testing.
    // NEVER hardcode real private keys in production code. Use secure methods.
    let private_key_hex = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"; // Anvil/Hardhat default

    // --- Message Hash to Sign ---
    // This should be the 32-byte hash of the actual data you want to sign
    // (e.g., a transaction hash, Keccak256 of a message).
    // For this example, we'll create a dummy hash from a string.
    let message_hash_bytes: [u8; 32] = H256::from_str(
        "0x4d439293a938ff9bef7ddd550d30980e980c8e966886ee43997f4a0a9d54c306", // Example hash
    )
    .expect("Invalid hash string")
    .into(); // Convert H256 string to [u8; 32]
    let message_hash = H256::from(message_hash_bytes); // Create H256 from bytes

    println!("Private Key (prefix): {}...", &private_key_hex[0..10].blue());
    println!("Message Hash to Sign: {:?}", message_hash.blue());

    // 1. Create Wallet from Private Key
    // Use `from_str` which handles hex decoding (including "0x" prefix)
    let wallet = LocalWallet::from_str(private_key_hex)
        .map_err(|e| SimpleSignError::WalletError(e.to_string()))?;

    println!("Derived Wallet Address: {:?}", wallet.address());

    // 2. Sign the Hash
    // Use `sign_hash` when you already have the 32-byte hash.
    let signature: Signature = wallet
        .sign_hash(message_hash)
        .map_err(|e| SimpleSignError::SigningError(e.to_string()))?;

    // 3. Extract v, r, s
    let r: U256 = signature.r;
    let s: U256 = signature.s;
    // `signature.v` in ethers-rs (for sign_hash) is typically 27 or 28.
    // The "parity" bit (0 or 1) is derived from this.
    let v_raw: u64 = signature.v;
    let v_parity: u64 = signature.v % 2; // Simple way for 27/28
    // Or more robustly: v_parity = v_raw - 27;

    println!("\n--- Signature Components ---");
    println!("v (raw EIP-155/legacy): {}", v_raw); // Usually 27 or 28 for sign_hash
    println!("v (parity bit):         {}", v_parity); // 0 or 1
    println!("r: {}", r); // U256 Display impl formats nicely
    println!("s: {}", s);

    // Optional: Verify (always a good idea)
    match signature.verify(message_hash, wallet.address()) {
        Ok(()) => println!("\nSignature Verified Successfully!"),
        Err(e) => eprintln!("\nSignature Verification Failed: {}", e),
    }

    Ok(())
}
