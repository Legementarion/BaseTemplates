package ${packageName}.api.services

import ${packageName}.api.ApiSettings
import ${packageName}.data.model.${className}

import retrofit2.http.GET
import retrofit2.http.Path
import rx.Single

interface GithubService {

    @GET(ApiSettings.ORGANIZATION_REPOS)
    fun get${className}Repos(
            @Path(ApiSettings.PATH_ORGANIZATION) organizationName: String): Single<List<${className}>>

}
