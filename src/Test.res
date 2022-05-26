module Header = {

    let variant = "text"
    let className = "btn"

    @react.component
    let make = () => {
        <h1> {React.string("Hello Eddy!")}
            <Mui.Typography>
                {"Some example text"->React.string}
            </Mui.Typography>
            <Mui.Button className variant=#text>{React.string("Button")}</Mui.Button>
        </h1>
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

