// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var React = require("react");
var ReactDom = require("react-dom");
var Caml_exceptions = require("rescript/lib/js/caml_exceptions.js");

function Test(Props) {
  return React.createElement("div", undefined, "Hello World");
}

console.log("hej");

var NoRoot = /* @__PURE__ */Caml_exceptions.create("Test.NoRoot");

var root = document.querySelector("#root");

if (root == null) {
  throw {
        RE_EXN_ID: NoRoot,
        Error: new Error()
      };
}

ReactDom.render(React.createElement("div", undefined, "Hello Andrea"), root);

var make = Test;

exports.make = make;
exports.NoRoot = NoRoot;
/*  Not a pure module */