export enum PhoneType {
    FIJO = "Fijo",
    CELULAR = "Celular",
    NO_ESPECIFICADO = "Sin definir"
}

export function findTypeByValue(value: String): PhoneType {
    const keys = Object.keys(PhoneType);
    for (let k of keys) {
        if (PhoneType[k] === value)
            return <PhoneType>k;
    }
}

