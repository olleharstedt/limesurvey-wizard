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

    type page = 
        | Start_page
        | Survey_title

    type state = {
        page: page
    }

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
        let (state, setState) = React.useState(_ => {page: Start_page})

        let onClick = evt => {
            ReactEvent.Mouse.preventDefault(evt)
            //let value = ReactEvent.Mouse.target(evt)["value"]
            setState(_ => {page: Survey_title})
        }

        let page = switch state.page {
            | Start_page => <div>
                    <p className="introduction">{React.string("Hi! 👋")}</p>
                    <p className="introduction">{React.string("Welcome to the LimeSurvey Wizard, that will guide you through the basics of survey creation.")}</p>
                </div>
            | Survey_title => <form>
                    <div className="form-group">
                        <label>{React.string("Survey title:")}</label>
                        <input className="form-control" type_="text" />
                    </div>
                    <a className="previous">{React.string("Previous")}</a>
                    <button onClick className="btn btn-default next">{React.string("Next")}</button>
                </form>
        }

        <div id="wizard-root" className="text-center">
            <h1 id="wizard-header">{React.string("LimeSurvey Wizard")}</h1>
            closeButton
            <div id="wizard-inputs">
                page
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

