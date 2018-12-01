use std::fs::File;
use std::io::{BufRead, BufReader, Error, ErrorKind, Read};

fn read<R: Read>(io: R) -> Result<Vec<i64>, Error> {
    let br = BufReader::new(io);
    br.lines()
        .map(|line| line.and_then(|v| v.parse().map_err(|e| Error::new(ErrorKind::InvalidData, e))))
        .collect()
}


fn main() -> Result<(), Error> {
    let vec = read(File::open("input.txt")?)?;

    let vector_iterator = vec.iter();

    let mut current = 0;
    
    for val in vector_iterator {
        let sum = val + current;
        println!("{}", sum);
        current = sum;
    }

    Ok(())
}