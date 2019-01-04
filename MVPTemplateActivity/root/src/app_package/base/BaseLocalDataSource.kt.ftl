package ${packageName}.data.source.base

import io.realm.Realm
import io.realm.RealmConfiguration
import io.realm.exceptions.RealmMigrationNeededException
import java.util.*
import kotlin.properties.ReadOnlyProperty
import kotlin.reflect.KProperty

/**
 * Created by irinagalata on 12/1/16.
 */

abstract class BaseLocalDataSource : BaseDataSource {

    /**
     * Keep in mind if you create reference to instance of Realm
     * you always need to check isClosed() before usage and you
     * can try to access from incorrect thread.
     * That's why had better to use this instance of Realm.
     * @see ThreadLocalRealmDelegate
     *
     * @return instance of Realm for current thread
     */
    val realm by ThreadLocalRealmDelegate()

    companion object {
        @JvmStatic
        private val THREAD_LOCAL_REALM = ThreadLocal<Realm?>()
        @JvmStatic
        private val REALMS_LIST = HashSet<Realm?>()
    }

    override fun init() {

    }

    fun closeCurrentThreadRealm() {
        val realm = THREAD_LOCAL_REALM.get()
        if (realm != null
                && realm.isClosed.not()
                && realm.isInTransaction.not()) {
            realm.close()
            REALMS_LIST.remove(realm)
        }
        THREAD_LOCAL_REALM.set(null)
    }

    fun closeAllThreadsRealms() {
        REALMS_LIST
                .filter { it?.isClosed?.not() ?: false }
                .forEach { it?.close() }
        THREAD_LOCAL_REALM.remove()
    }

    override fun clear() {

    }

    private class ThreadLocalRealmDelegate : ReadOnlyProperty<Any?, Realm> {

        override fun getValue(thisRef: Any?, property: KProperty<*>): Realm {
            var realm = THREAD_LOCAL_REALM.get()
            if (realm == null || realm.isClosed) {
                realm = getRealmInstance()
                THREAD_LOCAL_REALM.set(realm)
            }
            REALMS_LIST.add(realm)
            return realm
        }

        private fun getRealmInstance(): Realm {
            try {
                return Realm.getDefaultInstance()
            } catch (exception: RealmMigrationNeededException) {
                Realm.deleteRealm(RealmConfiguration.Builder().build())
                return Realm.getDefaultInstance()
            }
        }
    }

}

