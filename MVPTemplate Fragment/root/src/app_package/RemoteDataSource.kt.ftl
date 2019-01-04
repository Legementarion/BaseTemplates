package ${packageName}.data.source.${folderName}

import ${packageName}.data.model.${className}
import ${packageName}.data.source.base.BaseRemoteDataSource
import rx.Single


internal class ${className}RemoteDataSource : BaseRemoteDataSource(), ${className}DataSource {

    override fun get${className}(organization: String): Single<List<${className}>> {
        return //TODO please, add your repository

    }

    override fun save${className}(data: List<${className}>) {

    }

    override fun clear${className}() {

    }

    override fun isEmpty(): Boolean = false
}
