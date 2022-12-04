use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
	let mut sum = 0;
	let mut maxsum = 0;
	for line in stdin.lock().lines() {
		let test = line.unwrap().parse::<i32>();
		match test {
	    	Ok(ok) => sum += ok,
	    	Err(e) => {
				maxsum = if sum > maxsum {sum} else {maxsum};
				sum = 0;
			}
		}
	}
	println!("{}", maxsum);
}
