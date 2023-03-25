use std::env::args;

// fn main() {
//     println!("Hello World!");
// }
use chatgpt::{prelude::*, types::CompletionResponse};

#[tokio::main]
async fn main() -> Result<()> {
    // Getting the API key here
    let key = args().nth(1).unwrap();

    let client = ChatGPT::new(key)?;

    let response: CompletionResponse = client
        .send_message("Describe in five words the Rust programming language.")
        .await?;

    println!("Response: {}", response.message().content);

    Ok(())
}
