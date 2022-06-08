type wizardGlobalData = {
    exitUrl: string
}

// This is generated in PHP
@val external wizardGlobalData: wizardGlobalData = "wizardGlobalData"

module Jquery = {
    type t
    @module external jQuery: string => t = "jquery"
}

module Wizard = {
    type page = 
        | Start_page
        | Survey_title

    type state = {
        page: page
    }

    let closeButtonOriginal =
        <button type_="button" className="close">
            <i className="fa fa-close"></i>
        </button>

    // TODO: Needed workaround for data-* attributes. :(
    let closeButton = React.cloneElement(
        closeButtonOriginal,
        {"data-toggle": "tooltip", "title": "Close wizard", "data-placement": "left"}
    )

    /*
    let moo = Fetch.fetch("/api/hellos/1")
    |> Js.Promise.then_(Fetch.Response.text)
    |> Js.Promise.then_(text => print_endline(text) |> Js.Promise.resolve)
    */

    module Fetch = {
        type response
        @send external json: response => Js.Promise.t<'a> = "json"
        @val external fetch: string => Js.Promise.t<response> = "fetch"
    }

    type todo = {id: string, title: string}

    let apiUrl = "https://jsonplaceholder.typicode.com/todos/1"

    let fetchTodos = (_): Js.Promise.t<todo> => {
        Fetch.fetch(apiUrl) |> Js_promise.then_(Fetch.json)
    }

    @react.component
    let make = () => {
        // state value and setState function
        let (state, setState) = React.useState(_ => {page: Start_page})

        let client = ReactQuery.Provider.createClient()

        let queryResult = ReactQuery.useQuery(
                ReactQuery.queryOptions(
                    ~queryFn=fetchTodos,
                    ~queryKey="todos",
                    ~refetchOnWindowFocus=ReactQuery.refetchOnWindowFocus(#bool(false)),
                    ()
                    )
                )

        switch queryResult {
            | {data: Some(todo), isLoading: false, isError: false} => print_endline(todo.title)
            | _ => print_endline("moo")
        }

        let onClick = evt => {
            ReactEvent.Mouse.preventDefault(evt)
            /*
            Js.Promise.(
                Fetch.fetch("/api/hellos/1")
                |> then_(Fetch.Response.text)
                |> then_(text => print_endline(text) |> resolve)
            )
            */
            //let value = ReactEvent.Mouse.target(evt)["value"]
            setState(_ => {page: Survey_title})
        }

        let page = switch state.page {
            | Start_page => <div className="startpage">
                    <p>{React.string(`Hi! 👋`)}</p>
                    <p>{React.string("Welcome to the LimeSurvey Wizard, that will guide you through the basics of survey creation.")}</p>
                    <p>{React.string("You will learn how to:")}</p>
                    <ul>
                        <li>{React.string("Create a new survey")}</li>
                        <li>{React.string("Add new questions")}</li>
                        <li>{React.string("Choose between question types")}</li>
                        <li>{React.string("Activate and publish the survey")}</li>
                        <li>{React.string("Check the responses from your participants")}</li>
                    </ul>
                    <button
                        onClick={evt => setState(_ => {page: Survey_title})}
                        className="startbutton btn btn-default"
                    >
                        {React.string("Start")}
                    </button>
                </div>
            | Survey_title => <form>
                    <p>{React.string("Please enter the title of your survey. This can be changed later.")}</p>
                    <div className="form-group">
                        /*<label>{React.string("Survey title:")}</label>*/
                        <input className="form-control" type_="text" />
                    </div>
                    <div>
                        <a
                            onClick={evt => setState(_ => {page: Start_page})}
                            className="previous"
                            role="button"
                        >
                            {React.string("Previous")}
                        </a>
                        <button onClick className="btn btn-default next">{React.string("Next")}</button>
                    </div>
                </form>
        }

        <div id="wizard-root" className="text-center">
            <ReactQuery.Provider client>
                <div></div>
            </ReactQuery.Provider>
            <h1 id="wizard-header">{React.string("LimeSurvey Wizard")}</h1>
            closeButton
            <div id="wizard-inputs">
                page
            </div>
            /*<a href={wizardGlobalData.exitUrl} className="btn btn-default">{React.string("Exit to LimeSurvey application")}</a>*/
        </div>
    }
}

exception NoRoot

switch ReactDOM.querySelector("#root") {
    | Some(root) => ReactDOM.render(<Wizard/>, root)
    | None => raise(NoRoot)
}
