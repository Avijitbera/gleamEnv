import argv
import envoy
import gleam/io
import gleam/result

pub fn main() {
  case argv.load().arguments {
    ["get", name] -> get(name)
    _ -> io.print("Usage: vars get <name>")
  }
}

fn format_pair(name: String, value: String) -> String {
  name <> "=" <> value
}

fn get(name: String) -> Nil {
  let value = envoy.get(name) |> result.unwrap("")
  io.println(format_pair(name, value))
}
