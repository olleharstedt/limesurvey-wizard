// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var React = require("react");
var ReactDom = require("react-dom");
var Caml_exceptions = require("rescript/lib/js/caml_exceptions.js");
var Styles = require("@material-ui/core/styles");

var theme = Styles.createTheme({});

function Test$Wizard(Props) {
  return React.createElement("div", {
              className: "text-center",
              id: "wizard-root"
            }, React.createElement("h1", undefined, "LimeSurvey Wizard"), React.createElement("div", {
                  id: "wizard-inputs"
                }, React.createElement("form", undefined, React.createElement("div", {
                          className: "form-group"
                        }, React.createElement("label", undefined, "Survey title:"), React.createElement("input", {
                              className: "form-control",
                              type: "text"
                            })))), React.createElement("div", {
                  id: "wizard-buttons"
                }, React.createElement("a", undefined, "Previous"), React.createElement("button", {
                      className: "btn btn-default"
                    }, "Next")));
}

var Wizard = {
  variant: "text",
  className: "btn btn-default",
  theme: theme,
  make: Test$Wizard
};

console.log("Mooo?");

var NoRoot = /* @__PURE__ */Caml_exceptions.create("Test.NoRoot");

var root = document.querySelector("#root");

if (root == null) {
  throw {
        RE_EXN_ID: NoRoot,
        Error: new Error()
      };
}

ReactDom.render(React.createElement(Test$Wizard, {}), root);

exports.Wizard = Wizard;
exports.NoRoot = NoRoot;
/* theme Not a pure module */
