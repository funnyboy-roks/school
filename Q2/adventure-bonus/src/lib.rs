use pyo3::prelude::*;

mod structs;
mod game;
mod util;

use game::run;

/// A Python module implemented in Rust.
#[pymodule]
fn adventure_bonus(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(run, m)?)?;
    Ok(())
}
