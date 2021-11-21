open FileReader
open ImageResize
open Promise

type action =
    NewFile({originalDataUrl: string, resizedDataUrl: string})

type state = {
    originalDataUrl: string,
    resizedDataUrl: string
}

let reducer = (_, action) => {
    switch action {
        | NewFile({originalDataUrl, resizedDataUrl}) => {originalDataUrl, resizedDataUrl}
    }
}

let initialState = {originalDataUrl: "", resizedDataUrl: ""}
let getFirstFileFromEvent = event => ReactEvent.Form.target(event)["files"][0]

@react.component
let make = () => {

    let (state, dispatch) = React.useReducer(reducer, initialState)
    let asNewFileAction = ({originalDataUrl, resizedDataUrl}) =>
        NewFile({originalDataUrl: originalDataUrl, resizedDataUrl: resizedDataUrl})

    let resizeAndKeepOriginalDataUrl =  originalDataUrl =>
        originalDataUrl ->
            resizePromise ->
            thenResolve(resizedDataUrl => {{originalDataUrl, resizedDataUrl}})

    let onFileChange = e =>
        e ->
            getFirstFileFromEvent ->
            fileToDataUrl ->
            then(resizeAndKeepOriginalDataUrl) ->
            thenResolve(asNewFileAction) ->
            thenResolve(dispatch) ->
            ignore

    <div>
        <input type_="file" onChange=onFileChange/>
        <br/>
        <img src=state.resizedDataUrl/>
        <hr/>
        <img src=state.originalDataUrl/>
    </div>
}