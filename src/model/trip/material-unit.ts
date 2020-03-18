export enum MaterialUnit {
    KILO = "Kg",
    CUBIC_METER = "M3",
}

export function findMaterialUnitByValue(value: String): MaterialUnit {
    const keys = Object.keys(MaterialUnit);
    for (let k of keys) {
        if (MaterialUnit[k] === value)
            return <MaterialUnit>k;
    }
}

