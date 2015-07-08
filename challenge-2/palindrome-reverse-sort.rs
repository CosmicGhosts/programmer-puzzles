use std::io::{BufRead, BufReader};
use std::fs::File;
use std::path::Path;
use std::collections::HashMap;
use std::env;

fn main() {
    let path_arg = env::args().nth(1).unwrap();
    let path = Path::new(&path_arg);
    let file = File::open(&path).unwrap();
    let buffer = BufReader::new(file);
    buffer
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
    let stripped_string = strip_whitespace(&string);
    let sorted_string = sort_string(&stripped_string);
    return reverse(&sorted_string);
}

fn sort_string(string: &String) -> String {
    let mut characters: Vec<char> = string
        .chars()
        .collect();
    characters.sort();
    return characters
        .into_iter()
        .collect();
}

fn strip_whitespace(string: &String) -> String {
    return string
        .chars()
        .filter(|&c| c != ' ')
        .collect::<std::string::String>();
}

fn get_status<'a>(boolean: bool) -> &'a str {
    let mut response_map = HashMap::new();
    response_map.insert(true, "YES");
    response_map.insert(false, "NO");
    return response_map.get(&boolean).unwrap()
}

fn is_palindrome(string: &String) -> bool {
  let reversed = reverse(&string);
  return string == &reversed;
}

fn reverse(string: &String) -> String {
    return string
        .chars()
        .rev()
        .collect();
}
