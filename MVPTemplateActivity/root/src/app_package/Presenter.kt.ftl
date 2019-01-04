package ${packageName}.flow.${folderName}


<#if includeRepositoryClasses>
import ${packageName}.data.source.${folderName}.${className}Repository
import ${packageName}.data.model.${className}
</#if>

class ${className}Presenter : BasePresenterImplementation<${className}Contract.View>(), ${className}Contract.Presenter {

<#if includeRepositoryClasses>

	private val ORGANIZATION_NAME = "Yalantis"
    private val m${className}: ${className}Repository = ${className}Repository()

    override fun init${className}() {
        fetch${className}(true)
    }

    override fun fetch${className}() {
        mView?.showProgress()
        fetch${className}(false)
    }

    private fun fetch${className}(local: Boolean) {
        addSubscription(m${className}.get${className}(ORGANIZATION_NAME, local).subscribe({ data ->
            mView?.hideProgress()
        }, { throwable ->
            mView?.hideProgress()
            mView?.showError(throwable.message)
        }))
    }

    override fun on${className}Clicked(data: ${className}) {
    }

    override fun detachView() {
        super.detachView()
        m${className}.clear()
    }

</#if>

}
