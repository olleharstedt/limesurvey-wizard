module Header = {
    @react.component
    let make = () => {
        <h1> {React.string("Hello Eddy!")} </h1>
    }
}

Js.log("Mooo!");

exception NoRoot

// Dom access can actually fail. ReScript
// is really explicit about handling edge cases!
switch(ReactDOM.querySelector("#root")){
    | Some(root) => ReactDOM.render(<Header/>, root)
    | None => raise(NoRoot)
}

