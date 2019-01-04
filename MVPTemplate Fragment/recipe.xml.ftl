<?xml version="1.0"?>
<recipe>

	 <#if includeLayout>
        <instantiate from="res/layout/activity_blank.xml.ftl"
                       to="${escapeXmlAttribute(resOut)}/layout/activity_${classToResource(className)}.xml" />

        <open file="${escapeXmlAttribute(resOut)}/layout/activity_${classToResource(className)}.xml" />
    </#if>



	<instantiate from="src/app_package/MvpViewFragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/flow/${folderName}/${className}Fragment.kt" />

	<instantiate from="src/app_package/Contract.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/flow/${folderName}/${className}Contract.kt" />    
    <instantiate from="src/app_package/Presenter.kt.ftl" 
                   to="${escapeXmlAttribute(srcOut)}/flow/${folderName}/${className}Presenter.kt" />

	<#if includeRepositoryClasses>
		<instantiate from="src/app_package/DataSource.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/data/source/${folderName}/${className}DataSource.kt" />
		<instantiate from="src/app_package/LocalDataSource.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/data/source/${folderName}/${className}LocalDataSource.kt" />
		<instantiate from="src/app_package/RemoteDataSource.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/data/source/${folderName}/${className}RemoteDataSource.kt" />
		<instantiate from="src/app_package/Repository.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/data/source/${folderName}/${className}Repository.kt" /> 
		<instantiate from="src/app_package/Model.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/data/model/${className}.kt" />
	 </#if>

	<#if includeBasClasses>
		<instantiate from="src/app_package/base/BaseActivity.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/base/BaseActivity.kt" />
		<instantiate from="src/app_package/base/BaseDialogFragment.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/base/BaseDialogFragment.kt" />
		<instantiate from="src/app_package/base/BaseFragment.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/base/BaseFragment.kt" />
		<instantiate from="src/app_package/base/BasePresenter.kt.ftl"
		               to="${escapeXmlAttribute(srcOut)}/base/BasePresenter.kt" />
		<instantiate from="src/app_package/base/BasePresenterImplementation.kt.ftl"
						       to="${escapeXmlAttribute(srcOut)}/base/BasePresenterImplementation.kt" />
		<instantiate from="src/app_package/base/BaseView.kt.ftl"
						       to="${escapeXmlAttribute(srcOut)}/base/BaseView.kt" />
		<instantiate from="src/app_package/base/SharedPrefManager.java.ftl"
						       to="${escapeXmlAttribute(srcOut)}/manager/SharedPrefManager.java" />
		<instantiate from="src/app_package/base/Manager.java.ftl"
						       to="${escapeXmlAttribute(srcOut)}/interfaces/Manager.java" />
		<instantiate from="src/app_package/base/CachedValue.java.ftl"
						       to="${escapeXmlAttribute(srcOut)}/util/CachedValue.java" />
		<instantiate from="src/app_package/base/ProgressDialogFragment.kt.ftl"
						       to="${escapeXmlAttribute(srcOut)}/dialog/ProgressDialogFragment.kt" />
		<merge from="res/values/strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />
		<merge from="res/values/dimens.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />

		<instantiate from="src/app_package/base/BaseDataSource.kt.ftl"
									   to="${escapeXmlAttribute(srcOut)}/data/source/base/BaseDataSource.kt" />
		<instantiate from="src/app_package/base/BaseLocalDataSource.kt.ftl"
									   to="${escapeXmlAttribute(srcOut)}/data/source/base/BaseLocalDataSource.kt" />
		<instantiate from="src/app_package/base/BaseRemoteDataSource.kt.ftl"
									   to="${escapeXmlAttribute(srcOut)}/data/source/base/BaseRemoteDataSource.kt" />
		<instantiate from="src/app_package/base/ApiSettings.kt.ftl"
											   to="${escapeXmlAttribute(srcOut)}/api/ApiSettings.kt" />
		<instantiate from="src/app_package/base/GithubService.kt.ftl"
									   to="${escapeXmlAttribute(srcOut)}/api/services/GithubService.kt" />
	</#if>

	<merge from="AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

	
 
    <open file="${srcOut}/${className}Presenter.java"/>
</recipe>
