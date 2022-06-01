type wizardGlobalData = {
    exitUrl: string
}

@val external wizardGlobalData: wizardGlobalData = "wizardGlobalData"

module Wizard = {

    let variant = "text"
    let className = "btn btn-default"
    let theme = Mui.Theme.create({
        open Mui.ThemeOptions
        make()
    })

    /*
    @react.component
    let make = () => {
        <div>
            <h1> {React.string("Hello Eddy!")}
                <Mui.Typography>
                    {"Some example text"->React.string}
                </Mui.Typography>
            </h1>
            <Mui.Button className variant=#text>{React.string("Button")}</Mui.Button>
        </div>
    }
    */

    let divStyle = ReactDOM.Style.make(
        ~width="100%",
        ~height="100%",
        ~position="fixed",
        ~left="0",
        ~top="0",
        ~backgroundColor="white",
        ~zIndex="9999",
        ()
    )

    @react.component
    let make = () => {
        <div style=divStyle>
            <h1>{React.string("Wizard")}</h1>
            <button className="btn btn-default">{React.string("Previous")}</button>
            <button className="btn btn-default">{React.string("Next")}</button>
            <a href={wizardGlobalData.exitUrl} className="btn btn-default">{React.string("Exit to LimeSurvey application")}</a>
        </div>
    }
}

Js.log("Mooo?");

exception NoRoot

// Dom access can actually fail. ReScript
// is really explicit about handling edge cases!
switch(ReactDOM.querySelector("#root")){
    | Some(root) => ReactDOM.render(<Wizard/>, root)
    | None => raise(NoRoot)
}

