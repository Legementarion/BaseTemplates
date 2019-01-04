package ${packageName}.data.source.${folderName}

import ${packageName}.data.model.${className}
import ${packageName}.interfaces.Manager
import rx.Observable
import rx.Single
import rx.android.schedulers.AndroidSchedulers


class ${className}Repository() : Manager {

    private val mLocalSource: ${className}LocalDataSource = ${className}LocalDataSource().apply {
        init()
    }
    private val mRemoteSource: ${className}RemoteDataSource = ${className}RemoteDataSource().apply {
        init()
    }

    fun get${className}(organization: String, local: Boolean): Observable<List<${className}>> {
        if (!mLocalSource.isEmpty() && local) {
            return mLocalSource.get${className}(organization).concatWith(getRemote${className}(organization))
        }
        return getRemote${className}(organization).toObservable()
    }

    private fun getRemote${className}(organization: String): Single<List<${className}>> {
        return mRemoteSource.get${className}(organization)
                .doOnSuccess { data -> save${className}(data) }
                .observeOn(AndroidSchedulers.mainThread())
    }

    private fun save${className}(data: List<${className}>) {
        mLocalSource.save${className}(data)
    }

    fun clear${className}() {
        mLocalSource.clear${className}()
    }

    override fun clear() {
        clear${className}()
        mLocalSource.clear()
    }

}
