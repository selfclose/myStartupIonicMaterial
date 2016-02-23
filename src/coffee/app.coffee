### global angular, document, window ###
'use strict'

app = angular.module('starter', [
    'ionic'
    'ionic-material'
    'ionMdInput'
])

app.run(($ionicPlatform) ->
    $ionicPlatform.ready ->
# Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
# for form inputs)
        if window.cordova and window.cordova.plugins.Keyboard
            cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
        if window.StatusBar
# org.apache.cordova.statusbar required
            StatusBar.styleDefault()
        return
    return
)
