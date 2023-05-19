//! # Room Adventure
//!
//! Hayden Pott
//!
//! This is a game or something, idrk

use std::collections::{HashMap, HashSet};
use std::fmt::{Debug, Display};
use std::io::{stdin, stdout, Write};

/// Represents an in the room
#[derive(Clone)]
enum Item {
    Normal(&'static str, &'static str),
    Grabbable(&'static str),
}

impl Display for Item {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        // Just print the name
        write!(
            f,
            "{}",
            match self {
                Self::Normal(name, _) => name,
                Self::Grabbable(name) => name,
            }
        )
    }
}

impl Debug for Item {
    // Just use the Display format
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self)
    }
}

/// Represents the direction of a door
#[derive(Debug, Clone, PartialEq, Eq, Hash)]
enum Direction {
    North,
    South,
    East,
    West,
    Other(String),
}

impl From<&str> for Direction {
    fn from(value: &str) -> Self {
        match value.to_lowercase().trim() {
            "north" => Self::North,
            "south" => Self::South,
            "east" => Self::East,
            "west" => Self::West,
            other => Self::Other(other.into()),
        }
    }
}

/// Represents a room
#[derive(Debug, Clone, Default)]
struct Room {
    items: HashMap<String, Item>,
    exits: HashMap<Direction, String>,
    deaths: HashSet<Direction>,
    name: String,
}

impl Room {
    fn new(name: String) -> Self {
        Self {
            items: Default::default(),
            exits: Default::default(),
            deaths: Default::default(),
            name,
        }
    }

    fn add_item(&mut self, item: Item) {
        // Figure out the name based on the enum
        let name = match item {
            Item::Normal(n, _) => n,
            Item::Grabbable(n) => n,
        }
        .into();

        // add the item
        self.items.insert(name, item);
    }

    fn add_exit(&mut self, dir: Direction, room: &str) {
        self.exits.insert(dir, room.into());
    }

    fn add_death(&mut self, dir: Direction) {
        self.deaths.insert(dir);
    }
}

impl Display for Room {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{}\nExits: {:?}\nItems: {:?}\nGrabbable Items: {:?}",
            self.name, // The name of hte room
            self.exits // Exit directions + Deaths directions
                .keys()
                .chain(self.deaths.iter())
                .collect::<Vec<_>>(),
            self.items // Items mapped to their names (excluding grabbables)
                .values()
                .filter_map(|item| match item {
                    Item::Normal(name, _) => Some(*name),
                    Item::Grabbable(_) => None,
                })
                .collect::<Vec<&str>>(),
            self.items // Items mapped to their names (excluding normals)
                .values()
                .filter_map(|item| match item {
                    Item::Normal(_, _) => None,
                    Item::Grabbable(name) => Some(*name),
                })
                .collect::<Vec<&str>>(),
        )
    }
}

/// Represents a user command
#[derive(Debug, Clone)]
enum Command {
    Go(String),
    Look(String),
    Take(String),
    Quit,
}

impl Command {
    /// Added better command parsing
    fn parse(cmd: &str) -> Option<Self> {
        let (cmd, rest) = cmd.trim().split_once(" ")?;
        let rest = rest.into();

        // comparse the command (lowercase) to the options, otherwise none
        match &*cmd.to_lowercase() {
            "go" | "cd" => Some(Self::Go(rest)),
            "look" | "ls" | "ll" => Some(Self::Look(rest)),
            "take" => Some(Self::Take(rest)),
            "q" | "exit" | "bye" | "quit" => Some(Self::Quit),
            _ => None,
        }
    }
}

/// Represents the game
#[derive(Debug, Clone)]
struct Game {
    /// The room which the player is currently in
    current_room: Option<String>,
    /// The rooms
    rooms: HashMap<String, Room>,
    /// The player's inventory
    inventory: Vec<Item>,
}

impl Game {
    fn new() -> Self {
        Self {
            current_room: Some("room1".into()),
            rooms: Self::gen_rooms(),
            inventory: Default::default(),
        }
    }

    fn print_status(&self) {
        println!(
            "Room: {}\nInventory: {:?}",
            self.rooms[&self.current_room.clone().unwrap()], // This shouldn't throw if we ensure
            // that self.current_room != None
            self.inventory
                .iter()
                .map(|item| format!("{:?}", item))
                .collect::<Vec<_>>(),
        );
        print!("> ");
        stdout().flush().unwrap(); // flush because `print!` doesn't
    }

    fn start(&mut self) {
        self.print_status();
        for line in stdin().lines() {
            println!();
            let line = line.expect("Invalid stdin");
            let cmd = Command::parse(&line);

            // this shouldn't run, but it's backup
            if self.current_room.is_none() {
                println!("Du bist tot ☠️");
                return;
            }

            // I _hate_ that this has to be an owned String
            let response: String;
            if let Some(cmd) = cmd {
                let room = self.rooms.get_mut(&self.current_room.clone().unwrap());

                // exit now, so that we can assume the room exists
                if let Command::Quit = cmd {
                    println!("Thank you for playing!");
                    return;
                }

                let room = room.unwrap();

                match cmd {
                    Command::Go(cmd) => {
                        if let Some(room) = room.exits.get(&Direction::from(&*cmd)) {
                            // If it's an exit
                            self.current_room = Some(room.into());
                            response = "Room changed".into();
                        } else if room.deaths.contains(&Direction::from(&*cmd)) {
                            // If it's a death room
                            self.current_room = None;
                            response = "Room changed".into();
                        } else {
                            response = "Invalid exit".into();
                        }
                    }
                    Command::Look(cmd) => {
                        if let Some(Item::Normal(name, desc)) =
                            room.items.get(&cmd).map(|n| n.clone())
                        {
                            // The item exists, so describe it
                            response = format!("{}: {}", name, desc);
                        } else {
                            response = "Item Not Found".into();
                        }
                    }
                    Command::Take(cmd) => {
                        if let Some(Item::Grabbable(name)) = room.items.get(&cmd).map(|n| n.clone())
                        {
                            // Item is there, so take it
                            self.inventory.push(Item::Grabbable(name));
                            room.items.remove(name);
                            response = format!("Took {}", name);
                        } else {
                            response = "Item Not Found".into();
                        }
                    }
                    Command::Quit => {
                        unreachable!("Handled above")
                    }
                }
            } else {
                response = "Invalid input.".into();
            }
            // Print the response
            println!("{}\n", response);
            if self.current_room.is_none() {
                println!("Du bist tot ☠️");
                return;
            }
            self.print_status();
        }
    }

    fn gen_rooms() -> HashMap<String, Room> {
        let mut rooms = HashMap::new();

        // Unfortunately, Rust's borrow checker is not a big fan of graphs without funky shit, so
        // I did a minor work around, where rather than having edges directly between the rooms,
        // each room is labelled in some way; "room1", "room2", etc and each exit maps to a room
        // name, like:
        //     East => room2
        //     South => room3
        //     ...
        rooms.insert("room1".into(), Room::new("Room 1".into()));
        rooms.insert("room2".into(), Room::new("Room 2".into()));
        rooms.insert("room3".into(), Room::new("Room 3".into()));
        rooms.insert("room4".into(), Room::new("Room 4".into()));

        let room1 = rooms
            .get_mut("room1")
            .expect("If this is None, then some very funky shit is happening");

        room1.add_exit(Direction::East, "room2");
        room1.add_exit(Direction::South, "room3");

        room1.add_item(Item::Grabbable("key"));
        room1.add_item(Item::Normal(
            "chair",
            "It is made of wicker and no one is sitting on it.",
        ));
        room1.add_item(Item::Normal(
            "table",
            "It is made of oak. A golden key rests on it.",
        ));

        let room2 = rooms
            .get_mut("room2")
            .expect("If this is None, then some very funky shit is happening");

        room2.add_exit(Direction::West, "room1");
        room2.add_exit(Direction::South, "room4");

        room2.add_item(Item::Normal(
            "rug",
            "It is nice and Indian.  It also needs to be vacuumed.",
        ));
        room2.add_item(Item::Normal("fireplace", "It is full of ashes."));

        let room3 = rooms
            .get_mut("room3")
            .expect("If this is None, then some very funky shit is happening");

        room3.add_exit(Direction::North, "room1");
        room3.add_exit(Direction::East, "room4");
        room3.add_item(Item::Grabbable("book"));

        room3.add_item(Item::Normal("book shelf", "It is empty. Go figure."));
        room3.add_item(Item::Normal("statue", "There is nothing special about it."));
        room3.add_item(Item::Normal(
            "desk",
            "The statue is resting on it. So is a book.",
        ));

        let room4 = rooms
            .get_mut("room4")
            .expect("If this is None, then some very funky shit is happening");

        room4.add_exit(Direction::North, "room2");
        room4.add_exit(Direction::West, "room3");
        room4.add_death(Direction::South);

        room4.add_item(Item::Grabbable("knife")); // Added
        room4.add_item(Item::Grabbable("cutting board")); // Added
        room4.add_item(Item::Grabbable("wooden spoon")); // Added
        room4.add_item(Item::Normal(
            "sink",
            "A simple sink, used for washing stuff...",
        )); // Added
        room4.add_item(Item::Normal(
            "stovetop",
            "Still warm to the touch, someone was here recently",
        )); // Added

        rooms
    }
}

fn main() {
    let mut game = Game::new();
    game.start();
}
