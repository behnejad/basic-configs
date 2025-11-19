buildscript {
    repositories {
        maven {
            url "http://a.com/repository/maven-proxy/"
            allowInsecureProtocol = true
        }
//        mavenCentral()
//        google()
//        maven { url 'https://developer.huawei.com/repo/' }
    }
}

repositories {
//    google()
    maven {
        url "http://a.com/repository/google-maven/"
        allowInsecureProtocol = true
    }
}
