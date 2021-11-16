        type t ;

        // unsafe casts to be used internal to this module
        external asImage : Dom.element => t = "%identity"
        external asDomElement : t => Dom.element = "%identity"

        // jsinterop for this type (MyImage.t)
        @set external setSrc: (t, string) => unit = "src"
        @get external getSrc: t => string = "src"
        @get external getWidth: t => int = "width"
        @get external getHeight: t => int = "height"
        @send external addLoadEventListener : (t, @as("load") _, Dom.event => unit) => unit = "addEventListener";

        let createImage = () =>
            MyDom.createElement("img") -> asImage

        // overloaded helper method to support fluid interface
        let setSrc : (t, string) => t = (image, src) => {
            setSrc(image, src)
            image
        }

        let addOnLoad = (element: t, eventHandler) => {
            addLoadEventListener(element, eventHandler)
            element
        }
