fn main() {
    let mut sum = 0;
    for i in 1..1000 {
        sum += if i % 3 == 0 || i % 5 == 0 { i } else { 0 };
    }
    println!("{}", sum);
}
