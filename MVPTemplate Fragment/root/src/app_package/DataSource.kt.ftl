package ${packageName}.data.source.${folderName}

import ${packageName}.data.model.${className}

import rx.Single

internal interface ${className}DataSource {

    fun get${className}(organization: String): Single<List<${className}>>

    fun save${className}(data : List<${className}>)

    fun clear${className}()

    fun isEmpty(): Boolean

}

