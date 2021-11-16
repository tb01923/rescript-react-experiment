open MyImage
open Dimensions

let getResizeDimensions = (maxH, maxW, imgH, imgW) : floatD => {
    let ratio : float =
        if (imgW > maxW) {
           maxW /. imgW;
        }
        else if (imgH > maxH) {
           maxH /. imgH;
        } else {
            1.0
        }

    { height: imgH *. ratio, width: imgW *. ratio }
}

let onImageLoad = (image, continue) => _ => {
    open MyCanvas
    module Context = MyCanvasContext2d

    let canvas = createCanvas()
    let canvasContext = getContext2d(canvas)

    let dimensions =
        getResizeDimensions(
            600.0,
            600.0,
            getHeight(image) -> Belt.Int.toFloat,
            getWidth(image) -> Belt.Int.toFloat)

    canvas ->
        setHeight(dimensions.height) ->
        setWidth(dimensions.width) ->
        ignore

    canvasContext ->
        //Context.createImageData(~height=dimensions.height, ~width=dimensions.width) ->
        Context.drawImage(image, ~dx=0.0, ~dy=0.0, ~width=dimensions.width, ~height=dimensions.height) ->
        ignore

    let resizedDataUrl = toDataURL(canvas)
    continue(resizedDataUrl)
}

let resize = (dataUrl, continue) => {
    let image = createImage()

    image ->
        addOnLoad(onImageLoad(image, continue)) ->
        setSrc(dataUrl) ->
        ignore
}
