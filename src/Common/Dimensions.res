
type floatD = {
    height: float,
    width: float
}

type intD = {
    height: int,
    width: int
}

let toIntD = (a: floatD) : intD => {
    {
        height: Belt.Float.toInt(a.height),
        width: Belt.Float.toInt(a.width)
    }
}

let toFloatD = (a: intD) : floatD => {
    {
        height: Belt.Int.toFloat(a.height),
        width: Belt.Int.toFloat(a.width)
    }
}