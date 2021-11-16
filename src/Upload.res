let k = x => (_ => x)
let setState = stateHook => (newVal => stateHook(_ => newVal))
let getFirstFileWithEvent = event => ReactEvent.Form.target(event)["files"][0]

@react.component
let make = () => {
    open FileReader
    open ImageResize

    let (resizeDataUrl, setResizeDataUrl) = React.useState(k(""))
    let (dataUrl, setDataUrl) = React.useState(k(""))

    let setDataUrlState = setState(setDataUrl)
    let setResizeDataUrlState = setState(setResizeDataUrl)

    let onDataUrl = newDataUrl => {
        setDataUrlState(newDataUrl)
        resize(newDataUrl, setResizeDataUrlState)
    }

    let onFileOnChange = event =>
        event ->
            getFirstFileWithEvent ->
            fileToDataUrl(onDataUrl)

    <div>
        <input type_="file" onChange=onFileOnChange/>
        <br/>
        <img src=resizeDataUrl/>
        <hr/>
        <img src=dataUrl/>
    </div>
}