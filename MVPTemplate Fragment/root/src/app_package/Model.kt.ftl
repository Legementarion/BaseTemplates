package ${packageName}.data.model

import com.google.gson.annotations.SerializedName
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey

open class ${className}(@PrimaryKey @SerializedName("id") open var id: Long = 0) : RealmObject()
