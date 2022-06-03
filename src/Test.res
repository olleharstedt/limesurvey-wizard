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

    /*
    let divStyle = ReactDOM.Style.make(
        ()
    )
    */

    /*
    let h1Style = ReactDOM.Style.make(
        ()
    )
    */

    @react.component
    let make = () => {
        <div id="wizard-root" className="text-center">
            <h1 id="wizard-header">{React.string("LimeSurvey Wizard")}</h1>
            <div id="wizard-inputs">
                <form>
                    <div className="form-group">
                        <label>{React.string("Survey title:")}</label>
                        <input className="form-control" type_="text" />
                    </div>
                </form>
            </div>
            <div id="wizard-buttons">
                <a>{React.string("Previous")}</a>
                <button className="btn btn-default">{React.string("Next")}</button>
            </div>
            /*<a href={wizardGlobalData.exitUrl} className="btn btn-default">{React.string("Exit to LimeSurvey application")}</a>*/
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

