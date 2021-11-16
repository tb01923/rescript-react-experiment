type t

// unsafe casts to be used internal to this module
external asContext2d : Dom.element => t = "%identity"

// jsinterop for this type (MyContext2d.t)
@send external createImageData : (t, ~width: float, ~height: float) => unit = "createImageData"
@send external _drawImage : (t, MyImage.t, float, float, float, float) => unit = "drawImage"
@set external setWidth: (t, float) => unit = "width"
@set external setHeight: (t, float) => unit = "height"

// helper method to support fluid interface
let setWidth = (context: t, i: float) => {
    setWidth(context, i)
    context
}
let setHeight = (context: t, i: float) => {
    setHeight(context, i)
    context
}

let default = (d, opt) =>
    switch opt {
        | Some(x) => x
        | None => 0.0
    }

//let drawImage = (context: t, image: MyImage.t, ~dx: option<float> =?, ~dy: option<float> =?, ~width: float, ~height: float) => {
let drawImage = (context: t, image: MyImage.t, ~dx=0.0, ~dy=0.0, ~width, ~height) => {
    //_drawImage(context, image, default(0.0, dx), default(0.0, dy), width, height)
    _drawImage(context, image, dx, dy, width, height)
    context
}

let createImageData = (context: t, ~width, ~height) => {
    createImageData(context, ~width=width, ~height=height)
    context
}