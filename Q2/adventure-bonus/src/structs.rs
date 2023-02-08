use std::fmt::{Debug, Display, Formatter};

#[derive(Debug)]
pub struct Node {
    pub title: String,
    description: String,
    pub children: Vec<Node>,
}

impl Node {
    pub fn new(title: &str, description: &str, children: Option<Vec<Node>>) -> Self {
        Self {
            title: String::from(title),
            description: String::from(description),
            children: children.unwrap_or(vec![]),
        }
    }

    pub fn add_child(&mut self, child: Node) {
        self.children.push(child)
    }

    pub fn print(&self) {
        println!(" === {} === ", self.title);
        println!("{}", self.description);
        for (i, child) in (&self.children).iter().enumerate() {
            println!("  [{}] {}", i + 1, child);
        }
    }

    pub fn has_children(&self) -> bool {
        !(&self.children).is_empty()
    }
}

impl Display for Node {
    fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.title)
    }
}

// impl Debug for Node {
//     fn fmt(&self, f: &mut Formatter<'_>) -> std::fmt::Result {
//         write!(f, "Node[{} -> {:?}]", self.title, self.children)
//     }
// }

