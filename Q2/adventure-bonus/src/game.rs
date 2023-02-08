use pyo3::{pyfunction, PyResult};

use crate::structs::Node;
use crate::util;

fn build_tree() -> Node {
    let root = Node::new(
        "Welcome",
        "This is the root of the game",
        Some(vec![
            Node::new("Result 1", "", Some(vec![
                Node::new("1", "", Some(vec![
                    Node::new("10", "", None),
                    Node::new("11", "", None),
                ])),
                Node::new("2", "", None),
                Node::new("3", "", None),
            ])),
            Node::new("Result 2", "", Some(vec![
                Node::new("4", "", Some(vec![
                    Node::new("10", "", None),
                    Node::new("11", "", None),
                ])),
                Node::new("5", "", None),
                Node::new("6", "", None),
            ])),
            Node::new("Result 3", "", Some(vec![
                Node::new("7", "", Some(vec![
                    Node::new("10", "", None),
                    Node::new("11", "", None),
                ])),
                Node::new("8", "", None),
                Node::new("9", "", None),
            ])),
        ]),
    );

    root
}

/// Main Runner for the game
#[pyfunction]
pub fn run() -> PyResult<()> {
    let root = build_tree();

    let mut node = &root;

    while node.has_children() {
        node.print();

        let children = &node.children;


        let mut index: usize = usize::MAX;
        let mut c = util::input("Please choose an option.");
        loop {
            match &c {
                Ok(n) => index = n.parse::<usize>().unwrap(),
                Err(_) => {}
            }
            if index > 1 && index <= children.len() {
                index -= 1;
                break;
            }
            c = util::input("Please choose a valid option!");
        }

        node = &(&node.children)[index];

        println!("You chose \"{}\"!", node.title);
    }
    Ok(())
}
