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
        let (text, setText) = React.useState(_ => "");

        let onChange = evt => {
            ReactEvent.Form.preventDefault(evt)
            let value = ReactEvent.Form.target(evt)["value"]
            setText(_prev => value);
        }

        <div id="wizard-root" className="text-center">
            <h1 id="wizard-header">{React.string("LimeSurvey Wizard")}</h1>
            closeButton
            <div id="wizard-inputs">
                <form>
                    <div className="form-group">
                        <label>{React.string("Survey title:")}</label>
                        <input className="form-control" type_="text" value=text />
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

