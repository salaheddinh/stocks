package com.salaheddin.stocks

import com.salaheddin.stocks.data.di.NetworkModule
import com.salaheddin.stocks.data.di.RepositoryModule
import com.salaheddin.stocks.handler.di.HandlerModule
import io.flutter.app.FlutterApplication
import org.koin.core.context.GlobalContext

class App: FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        GlobalContext.startKoin {
            modules(
                listOf(
                    NetworkModule,
                    RepositoryModule,
                    HandlerModule
                )
            )
        }
    }
}