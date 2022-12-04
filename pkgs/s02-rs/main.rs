
use std::io::{self, BufRead};

fn get_score(opponent: u32, player: u32) -> u32 {
    return ((1+opponent) % 3 == player) as u32 * 6 + (opponent == player) as u32 * 3;
}

fn part1() -> u32 {
    let mut tot_score = 0;
    for chars in io::stdin().lock().lines() {
	let char_vec: Vec<char> = chars.unwrap().chars().collect();
	let opponent = char_vec[0] as u32 - 'A' as u32;
	let player = char_vec[2] as u32 - 'X' as u32;
	tot_score = tot_score + get_score(opponent, player) + player + 1;
    }
    return tot_score;
}

fn getmove(opponent: u32, outcome: u32) -> u32 {
    return (opponent + outcome + 3 - 1) % 3;
}

fn part2() -> u32 {
    let mut tot_score = 0;
    for chars in io::stdin().lock().lines() {
	let char_vec: Vec<char> = chars.unwrap().chars().collect();
	let opponent = char_vec[0] as u32 - 'A' as u32;
	let outcome = char_vec[2] as u32 - 'X' as u32;
	let player = getmove(opponent, outcome);
	tot_score = tot_score + get_score(opponent, player) + player + 1;
    }
    return tot_score;
}

fn main() {
    // part 1
    // println!("{}",part2());
    // part 2
    println!("{}",part2());
}

