@val @scope(("window")) external document : Dom.document = "document";
@send external _createElement : (Dom.document,  string) => Dom.element = "createElement";

@send external createElement : (Dom.document,  string) => Dom.element = "createElement"


let createElement = elementName => {
    createElement(document, elementName)
}
