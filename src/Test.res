@react.component
let make = () => {
    <div> {React.string("Hello World")} </div>
}

Js.log("hej");

exception NoRoot

// Dom access can actually fail. ReScript
// is really explicit about handling edge cases!
switch(ReactDOM.querySelector("#root")){
    | Some(root) => ReactDOM.render(<div> {React.string("Hello Andrea")} </div>, root)
    | None => raise(NoRoot)
}
