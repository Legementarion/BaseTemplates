package ${packageName}.flow.${folderName}

import android.content.Context
import android.os.Bundle
import android.view.View
import ${packageName}.R
import kotlinx.android.synthetic.main.activity_${classToResource(className)}.*

class ${className}Activity : BaseActivity<${className}Presenter>(), ${className}Contract.View {

    override val presenter: ${className}Presenter = ${className}Presenter()
    override val layoutResourceId: Int = R.layout.activity_${classToResource(className)}

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
		<#if includeRepositoryClasses>
		presenter.init${className}()
		</#if>
    }

    override fun showProgress() {
        progressBar.visibility = View.VISIBLE
    }

    override fun hideProgress() {
        progressBar.visibility = View.GONE
    }

    override fun getContext(): Context {
        return this@${className}Activity
    }
}
