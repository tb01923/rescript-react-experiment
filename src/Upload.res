open FileReader
open ImageResize
open Js.Promise



let getFirstFileWithEvent = event => ReactEvent.Form.target(event)["files"][0]

@react.component
let make = () => {
    let k = x => (_ => x)
    let (resizeDataUrl, setResizeDataUrl) = React.useState(k(""))
    let (dataUrl, setDataUrl) = React.useState(k(""))
    let setStateWithIdPromise = hook => obj => {
        hook(_ => obj)
        resolve(obj)
    }
    // let resizePeromise = newDataUrl => resize(newDataUrl) -> resolve
    let setDataUrlStatePromise = setStateWithIdPromise(setDataUrl)
    let setResizeDataUrlStatePromise = setStateWithIdPromise(setResizeDataUrl)

    let onFileOnChange = event =>
        event ->
            getFirstFileWithEvent ->
            fileToDataUrl ->
            then_(setDataUrlStatePromise, _) ->
            then_(resizePromise, _) ->
            then_(setResizeDataUrlStatePromise, _) ->
            ignore

    <div>
        <input type_="file" onChange=onFileOnChange/>
        <br/>
        <img src=resizeDataUrl/>
        <hr/>
        <img src=dataUrl/>
    </div>
}