package ${packageName}.base

interface BasePresenter {

    fun attachView(view: BaseView)

    fun detachView()

}

