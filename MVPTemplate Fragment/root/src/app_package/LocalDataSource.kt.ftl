package ${packageName}.data.source.${folderName}

import ${packageName}.data.model.${className}
import ${packageName}.data.source.base.BaseLocalDataSource
import io.realm.Sort
import rx.Observable
import rx.Single


internal class ${className}LocalDataSource : BaseLocalDataSource(), ${className}DataSource {

    override fun get${className}(organization: String): Single<List<${className}>> {
        return Observable.just(realm.where<${className}>(${className}::class.java)
                .findAllSorted("name", Sort.ASCENDING) as List<${className}>).toSingle()
    }

    override fun save${className}(data: List<${className}>) {
        realm.executeTransaction { realm -> realm.copyToRealmOrUpdate(data) }
    }

    override fun clear${className}() {
        realm.executeTransaction { realm -> realm.delete(${className}::class.java) }
    }

    override fun isEmpty(): Boolean = realm.where<${className}>(${className}::class.java).count() > 0

}
