type fileReader
type file = {"name": string, "lastModified": int, "size": int, "type__": string}

@new external createFileReader: unit => fileReader = "FileReader"

@bs.send
external readAsDataURL: (fileReader, file) => unit = "readAsDataURL"

let handleRead: (fileReader, (. string)=> unit, (. _) => unit) => unit = %raw(`
    function (reader, resolve, reject) {
      reader.onload = function (e) {
        resolve(e.target.result);
      }
      reader.onerror = () => reject(reader.error)
    }
`)

let fileToDataUrl = (file: file) =>
    Js.Promise.make((~resolve, ~reject) => {
        let reader = createFileReader()
        handleRead(reader, resolve, reject)
        readAsDataURL(reader, file)
    })