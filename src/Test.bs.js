// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var React = require("react");
var ReactDom = require("react-dom");
var Caml_exceptions = require("rescript/lib/js/caml_exceptions.js");
var Core = require("@material-ui/core");

var className = "btn";

function Test$Header(Props) {
  return React.createElement("h1", undefined, "Hello Eddy!", React.createElement(Core.Typography, {
                  children: "Some example text"
                }), React.createElement(Core.CssBaseline, {}), React.createElement(Core.Button, {
                  children: "Button",
                  className: className,
                  variant: "text"
                }));
}

var Header = {
  variant: "text",
  className: className,
  make: Test$Header
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

ReactDom.render(React.createElement(Test$Header, {}), root);

exports.Header = Header;
exports.NoRoot = NoRoot;
/*  Not a pure module */
