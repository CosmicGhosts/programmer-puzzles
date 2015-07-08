use std::io::{BufRead, BufReader};
use std::fs::File;
use std::path::Path;
use std::collections::HashMap;
use std::env;

fn main() {
    let path_arg = env::args().nth(1).unwrap();
    let path = Path::new(&path_arg);
    let file = BufReader::new(File::open(&path).unwrap());
    file
        .lines()
        .map(|line| line.unwrap())
        .map(|string| format_string(string))
        .map(|string| println!("{}", string))
        .collect::<Vec<()>>();
}

fn format_string(string: String) -> String {
    let palindrome = is_palindrome(&string);
    let status = get_status(palindrome);
    let reversed_sorted = reverse_sort(&string);
    return format!("{} | {}", status, reversed_sorted);
}

fn reverse_sort(string: &String) -> String {
    return reverse(&strip_whitespace(&string));
}

fn strip_whitespace(string: &String) -> String {
    let x: String = string
        .chars()
        .filter(|&c| c != ' ')
        .collect();
    return x;
}

fn get_status(boolean: bool) -> String {
    let mut response_map = HashMap::new();
    response_map.insert(true, "YES");
    response_map.insert(false, "NO");
    return response_map.get(&boolean).unwrap().to_string()
}

fn is_palindrome(string: &String) -> bool {
  let reversed = reverse(&string);
  return string == &reversed;
}

fn reverse(string: &String) -> String {
    let characters = string.chars().rev().collect();
    return characters;
}
