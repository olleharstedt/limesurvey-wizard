// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("rescript/lib/js/curry.js");
var React = require("react");
var ReactDom = require("react-dom");
var Caml_exceptions = require("rescript/lib/js/caml_exceptions.js");
var Styles = require("@material-ui/core/styles");

var theme = Styles.createTheme({});

var closeButtonOriginal = React.createElement("button", {
      className: "close",
      type: "button"
    }, React.createElement("i", {
          className: "fa fa-close"
        }));

var closeButton = React.cloneElement(closeButtonOriginal, {
      "data-toggle": "tooltip",
      title: "Close wizard",
      "data-placement": "left"
    });

function Test$Wizard(Props) {
  var match = React.useState(function () {
        return 0;
      });
  var setCount = match[1];
  var onClick = function (evt) {
    evt.preventDefault();
    return Curry._1(setCount, (function (prev) {
                  return prev + 1 | 0;
                }));
  };
  return React.createElement("div", {
              className: "text-center",
              id: "wizard-root"
            }, React.createElement("h1", {
                  id: "wizard-header"
                }, "LimeSurvey Wizard"), closeButton, React.createElement("div", {
                  id: "wizard-inputs"
                }, React.createElement("form", undefined, React.createElement("div", {
                          className: "form-group"
                        }, React.createElement("label", undefined, "Survey title:"), React.createElement("input", {
                              className: "form-control",
                              type: "",
                              value: String(match[0])
                            })))), React.createElement("div", {
                  id: "wizard-buttons"
                }, React.createElement("a", undefined, "Previous"), React.createElement("button", {
                      className: "btn btn-default",
                      onClick: onClick
                    }, "Next")));
}

var Wizard = {
  variant: "text",
  className: "btn btn-default",
  theme: theme,
  closeButtonOriginal: closeButtonOriginal,
  closeButton: closeButton,
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
