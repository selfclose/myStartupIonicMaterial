app.controller('LoginCtrl', ($scope, $timeout, $stateParams, ionicMaterialInk) ->
    $scope.$parent.clearFabs()
    $timeout (->
        $scope.$parent.hideHeader()
        return
    ), 0
    ionicMaterialInk.displayEffect()
    return
)
.controller('AppCtrl', ($scope, $ionicModal, $ionicPopover, $timeout) ->
# Form data for the login modal
    $scope.loginData = {}
    $scope.isExpanded = false
    $scope.hasHeaderFabLeft = false
    $scope.hasHeaderFabRight = false
    navIcons = document.getElementsByClassName('ion-navicon')
    i = 0
    while i < navIcons.length
        navIcons.addEventListener 'click', ->
            @classList.toggle 'active'
            return
        i++
    #//////////////////////////////////////
    # Layout Methods
    #//////////////////////////////////////

    $scope.hideNavBar = ->
        document.getElementsByTagName('ion-nav-bar')[0].style.display = 'none'
        return

    $scope.showNavBar = ->
        document.getElementsByTagName('ion-nav-bar')[0].style.display = 'block'
        return

    $scope.noHeader = ->
        `var i`
        content = document.getElementsByTagName('ion-content')
        i = 0
        while i < content.length
            if content[i].classList.contains('has-header')
                content[i].classList.toggle 'has-header'
            i++
        return

    $scope.setExpanded = (bool) ->
        $scope.isExpanded = bool
        return

    $scope.setHeaderFab = (location) ->
        hasHeaderFabLeft = false
        hasHeaderFabRight = false
        switch location
            when 'left'
                hasHeaderFabLeft = true
            when 'right'
                hasHeaderFabRight = true
        $scope.hasHeaderFabLeft = hasHeaderFabLeft
        $scope.hasHeaderFabRight = hasHeaderFabRight
        return

    $scope.hasHeader = ->
        `var i`
        content = document.getElementsByTagName('ion-content')
        i = 0
        while i < content.length
            if !content[i].classList.contains('has-header')
                content[i].classList.toggle 'has-header'
            i++
        return

    $scope.hideHeader = ->
        $scope.hideNavBar()
        $scope.noHeader()
        return

    $scope.showHeader = ->
        $scope.showNavBar()
        $scope.hasHeader()
        return

    $scope.clearFabs = ->
        fabs = document.getElementsByClassName('button-fab')
        if fabs.length and fabs.length > 1
            fabs[0].remove()
        return

    return
)
