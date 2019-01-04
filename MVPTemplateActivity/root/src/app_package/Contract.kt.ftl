package ${packageName}.flow.${folderName}

<#if includeRepositoryClasses>
import ${packageName}.data.model.${className}
</#if>

class ${className}Contract {

    internal interface Presenter : BasePresenter {

	<#if includeRepositoryClasses>
		fun init${className}()

        fun fetch${className}()

        fun on${className}Clicked(data : ${className})
	</#if>

}

    interface View : BaseView {}

}
