// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Curry = require("rescript/lib/js/curry.js");
var React = require("react");
var ReactDom = require("react-dom");
var ReactQuery = require("react-query");
var Caml_exceptions = require("rescript/lib/js/caml_exceptions.js");

var Fetch = {};

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

var queryResult = ReactQuery.useQuery({});

function Test$Wizard(Props) {
  var match = React.useState(function () {
        return {
                page: /* Start_page */0
              };
      });
  var setState = match[1];
  var onClick = function (evt) {
    evt.preventDefault();
    return Curry._1(setState, (function (param) {
                  return {
                          page: /* Survey_title */1
                        };
                }));
  };
  var match$1 = match[0].page;
  var page = match$1 ? React.createElement("form", undefined, React.createElement("p", undefined, "Please enter the title of your survey. This can be changed later."), React.createElement("div", {
              className: "form-group"
            }, React.createElement("input", {
                  className: "form-control",
                  type: "text"
                })), React.createElement("div", undefined, React.createElement("a", {
                  className: "previous",
                  role: "button",
                  onClick: (function (evt) {
                      return Curry._1(setState, (function (param) {
                                    return {
                                            page: /* Start_page */0
                                          };
                                  }));
                    })
                }, "Previous"), React.createElement("button", {
                  className: "btn btn-default next",
                  onClick: onClick
                }, "Next"))) : React.createElement("div", {
          className: "startpage"
        }, React.createElement("p", undefined, "Hi! 👋"), React.createElement("p", undefined, "Welcome to the LimeSurvey Wizard, that will guide you through the basics of survey creation."), React.createElement("p", undefined, "You will learn how to:"), React.createElement("ul", undefined, React.createElement("li", undefined, "Create a new survey"), React.createElement("li", undefined, "Add new questions"), React.createElement("li", undefined, "Choose between question types"), React.createElement("li", undefined, "Activate and publish the survey"), React.createElement("li", undefined, "Check the responses from your participants")), React.createElement("button", {
              className: "startbutton btn btn-default",
              onClick: (function (evt) {
                  return Curry._1(setState, (function (param) {
                                return {
                                        page: /* Survey_title */1
                                      };
                              }));
                })
            }, "Start"));
  return React.createElement("div", {
              className: "text-center",
              id: "wizard-root"
            }, React.createElement("h1", {
                  id: "wizard-header"
                }, "LimeSurvey Wizard"), closeButton, React.createElement("div", {
                  id: "wizard-inputs"
                }, page));
}

var Wizard = {
  closeButtonOriginal: closeButtonOriginal,
  closeButton: closeButton,
  queryResult: queryResult,
  make: Test$Wizard
};

var NoRoot = /* @__PURE__ */Caml_exceptions.create("Test.NoRoot");

var root = document.querySelector("#root");

if (root == null) {
  throw {
        RE_EXN_ID: NoRoot,
        Error: new Error()
      };
}

ReactDom.render(React.createElement(Test$Wizard, {}), root);

exports.Fetch = Fetch;
exports.Wizard = Wizard;
exports.NoRoot = NoRoot;
/* closeButtonOriginal Not a pure module */
