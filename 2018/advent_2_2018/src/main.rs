use std::io::prelude::*;
use std::io::BufReader;
use std::fs::File;
use std::path::Path;

fn lines_from_file<P>(filename: P) -> Vec<String>
where
    P: AsRef<Path>,
{
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
        .map(|l| l.expect("Could not parse line"))
        .collect()
}



fn main() {
    let mut two_count = 0;
    let mut three_count = 0;
    let mut final_two_count = 0;
    let mut final_three_count = 0;
    let lines = lines_from_file("input.txt");
    for line in lines {
        let count = line.matches("a").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("b").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("c").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("d").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("e").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("f").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("g").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("h").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("i").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("j").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("k").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("l").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("m").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("n").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("o").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("p").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("q").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("r").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("s").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("t").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("u").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("v").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("w").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("x").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("y").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }
        let count = line.matches("z").count();
        println!("{:?}", line);
        println!("{}", count);
        if count == 2 {
            two_count += 1
        }
        if count == 3 {
            three_count += 1
        }

    if two_count > 0 {
        final_two_count += 1;
    }

    if three_count > 0 {
        final_three_count += 1;
    }

    two_count = 0;
    three_count = 0;

    }


    println!("{}", final_two_count);
    println!("{}", final_three_count);

    let total = final_two_count * final_three_count;

    println!("{}", total);
}