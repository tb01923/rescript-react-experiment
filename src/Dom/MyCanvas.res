type t

external asCanvas : Dom.element => t = "%identity"
external asDomElement : t => Dom.element = "%identity"
@send external toDataURL : t => string = "toDataURL"
@send external getContext2d : (t, @as("2d") _) => MyCanvasContext2d.t = "getContext";
@set external setWidth: (t, float) => unit = "width"
@set external setHeight: (t, float) => unit = "height"

let createCanvas : (unit => t) = () => {
    let canvasElement = MyDom.createElement("canvas")
    asCanvas(canvasElement)
}


// helper method to support fluid interface
let setWidth = (canvas: t, i: float) => {
    setWidth(canvas, i)
    canvas
}

let setHeight = (canvas: t, i: float) => {
    setHeight(canvas, i)
    canvas
}


let getContext2d : (t => MyCanvasContext2d.t) = canvas => {
    getContext2d(canvas)
}
