use std::io::{self, BufRead};
use std::collections::BinaryHeap;

fn str_to_int(x: String) -> i32 {
    match x.parse::<i32>() {
	Ok(ok) => return ok,
	Err(_e) => return -1
    }
}

fn sum_top_n(n: i32) -> i32 {
    let mut heap = BinaryHeap::new();
    let mut sum = 0;
    let mut total = 0;
    for num in io::stdin().lock().lines().map(|l| str_to_int(l.unwrap())) {
	if num >= 0 {
	    sum += num;
	} else {
	    heap.push(sum);
	    sum = 0;
	}
    }
    for _ in 0..n {
	total = total + heap.pop().unwrap();
    }
    return total;
}

fn max_cal() -> i32 {
    let mut sum = 0;
    let mut maxsum = 0;
    for num in io::stdin().lock().lines().map(|l| str_to_int(l.unwrap())) {
	if num >= 0 {
	    sum += num;
	} else {
	    maxsum = if sum > maxsum {sum} else {maxsum};
	    sum = 0;
	}
    }
    return maxsum;
}

fn main() {
    // part 1
    // println!("{}", max_cal());
    // part 2
    println!("{}", sum_top_n(3));
}
