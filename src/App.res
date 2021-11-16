@module external _css: unit = "./App.css"
@module("./logo.svg") external logo: string = "default"

@react.component
let make = () =>
  <div className="App">
      <div>
        <Upload />
      </div>
  </div>