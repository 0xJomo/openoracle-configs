- # AVS Operator Registration Tool User Guide

  This tool is designed to assist you in the registration process for AVS operators. It provides two main functions:

   1. **Generate Message for Signing:** Creates a message for the operator to sign, including a random number and expiration time.
   2. **Generate Registration Transaction for Signing:** Creates an AVS registration transaction based on the operator's address and signature.

  ## How to Use

   1. **Run the Program:** Execute the script in your terminal.

   2. **Choose a Function:** You will be presented with the following options in the command line interface:
      ```
      What would you like to do?
      
      [1] Use holesky network
      [2] Use mainnet network
      [3] exit
      ```

      - Select `[1]` to proceed to the next step using the Holesky network.
      - Select `[2]` to proceed to the next step using the mainnet network.
      - Select `[3]` to exit.
      
      ```
      What would you like to do?
      
      [1] Create a message ready for signing
      [2] Create a registration avs transaction ready for signing
      [3] back to main menu
      ```

      - Select `[1]` to generate a message for signing.
      - Select `[2]` to generate a registration transaction for signing.
      - Select `[3]` to back to main menu.

  ## Function Details

  ### 1. Generate Message for Signing

   1. **Enter Operator Address:** You will be prompted to enter the Ethereum address of the operator.

   2. **Message Generation:** The program will generate a JSON-formatted message containing the following fields:

      - `salt`: A random number to prevent replay attacks.
      - `expiry`: The expiration time (Unix timestamp) of the signature.
      - `msg`: A hexadecimal encoded string that the operator needs to sign.

      Example:

      JSON

      ```
      {
          "salt": "0xe6c0ceafdf693caf38a5cffac4cfb5c75c63fc48f7745901083f1e96b68b3ffd",
          "expiry": 1721103484,
          "msg": "0x7d636e92734d4bd8aab85c38ebcff94294867447530a572a9ed635ac9df14540"
      }
      ```

   3. **Sign the Message:** You need to use the operator's private key to sign the `msg` field and add the signature to the message.

  ### 2. Generate Registration Transaction for Signing
    Please ensure the `bls` file exists in the same directory as the executable file, with the following directory structure for `bls`:
    
    ```
    ├── bls
    │   ├── keys
    │   │   └── 1.bls.key.json
    │   └── password.txt
    ├── openlayer_reg-linux
    ├── openlayer_reg-macos
    └── openlayer_reg-win.exe
    ```
   1. **Enter Operator Address:** You will be prompted to enter the Ethereum address of the operator.
   2. **Enter Operator Singer Address:** You will be prompted to enter the Ethereum address of the operator signer.
   3. **Enter Signed Message:** A text editor will open. Paste the signed message (including `salt`, `expiry`, and `signature`) into the editor. The message should be in valid JSON format, for example:

      JSON

      ```
      {
          "salt": "0xe6c0ceafdf693caf38a5cffac4cfb5c75c63fc48f7745901083f1e96b68b3ffd",
          "expiry": 1721103484,
          "signature": "0x9a3542e4f3cd047bd5c78826c21027bff3fcc82e1563bc7c0b8739159b072eb6"
      }
      ```

      The `salt` and `expiry` values should be the same as in the message generated in step 1. The `signature` field is the result of signing the `msg` field from the original message with the operator's private key.

   4. **Transaction Generation:** The program will verify the validity of the signature and generate an AVS registration transaction containing the operator's address and signature information.

  ## Important Notes

   - **Signature Verification:** Ensure that you use the operator's private key to correctly sign the message; otherwise, the transaction will fail validation.
   - **Transaction Submission:** After generating the registration transaction, you need to submit it to the network to complete the operator registration.