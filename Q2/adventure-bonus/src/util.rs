use std::io;

pub(crate) fn input(prompt: &str) -> io::Result<String> {
    let out = &mut String::new();
    println!("{}", prompt);
    print!("> ");

    match io::stdin().read_line(out) {
        Ok(_) => Ok(out.trim_end().to_string()),
        Err(error) => Err(error)
    }
}

pub fn input_char(prompt: &str) -> char {
    while let r = input(prompt) {
        if r.is_ok() {
            let c = r.unwrap().to_lowercase().chars().next();
            if c.is_some() {
                return c.unwrap();
            }
        }
    }
    '0'
}
