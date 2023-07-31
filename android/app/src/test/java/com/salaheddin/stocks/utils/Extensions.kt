package com.salaheddin.stocks.utils

import com.google.gson.Gson
import java.lang.reflect.Type

fun <T> String.jsonToWord(typeToken: Type): T {
    val gson = Gson()
    return gson.fromJson(this, typeToken)
}