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

    let closeButtonOriginal =
        <button type_="button" className="close">
            <i className="fa fa-close"></i>
        </button>

    // TODO: Needed workaround for data-* attributes. :(
    let closeButton = React.cloneElement(
        closeButtonOriginal,
        {"data-toggle": "tooltip", "title": "Close wizard", "data-placement": "left"}
    )

    @react.component
    let make = () => {
        // state value and setState function
        let (count, setCount) = React.useState(_ => 0)

        let onClick = evt => {
            ReactEvent.Mouse.preventDefault(evt)
            //let value = ReactEvent.Mouse.target(evt)["value"]
            setCount(prev => prev + 1)
        }

        <div id="wizard-root" className="text-center">
            <h1 id="wizard-header">{React.string("LimeSurvey Wizard")}</h1>
            closeButton
            <div id="wizard-inputs">
                <form>
                    <div className="form-group">
                        <label>{React.string("Survey title:")}</label>
                        <input className="form-control" type_="" value={Belt.Int.toString(count)} />
                    </div>
                </form>
            </div>
            <div id="wizard-buttons">
                <a>{React.string("Previous")}</a>
                <button onClick className="btn btn-default">{React.string("Next")}</button>
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

