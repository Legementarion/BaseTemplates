package ${packageName}.flow.${folderName}

import android.content.Context
import android.os.Bundle
import android.view.View
import ${packageName}.R
import kotlinx.android.synthetic.main.activity_${classToResource(className)}.*

class ${className}Fragment : BaseFragment<${className}Presenter>(), ${className}Contract.View {

    override val presenter: ${className}Presenter = ${className}Presenter()
    override val layoutResourceId: Int = R.layout.fragment_${classToResource(className)}

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
		<#if includeRepositoryClasses>
		presenter.init${className}()
		</#if>
    }

    override fun getContext(): Context {
        return this@${className}Fragment
    }
}
