app.config ($stateProvider, $urlRouterProvider, $ionicConfigProvider) ->
# Turn off caching for demo simplicity's sake
    $ionicConfigProvider.views.maxCache 0

    ###
    // Turn off back button text
    $ionicConfigProvider.backButton.previousTitleText(false);
    ###

    $stateProvider.state('app',
        url: '/app'
        abstract: true
        templateUrl: 'templates/menu.html'
        controller: 'AppCtrl').state('app.activity',
        url: '/activity'
        views:
            'menuContent':
                templateUrl: 'templates/activity.html'
                controller: 'ActivityCtrl'
            'fabContent':
                template: '<button id="fab-activity" class="button button-fab button-fab-top-right expanded button-energized-900 flap"><i class="icon ion-paper-airplane"></i></button>'
                controller: ($timeout) ->
                    $timeout (->
                        document.getElementById('fab-activity').classList.toggle 'on'
                        return
                    ), 200
                    return
    ).state('app.friends',
        url: '/friends'
        views:
            'menuContent':
                templateUrl: 'templates/friends.html'
                controller: 'FriendsCtrl'
            'fabContent':
                template: '<button id="fab-friends" class="button button-fab button-fab-top-left expanded button-energized-900 spin"><i class="icon ion-chatbubbles"></i></button>'
                controller: ($timeout) ->
                    $timeout (->
                        document.getElementById('fab-friends').classList.toggle 'on'
                        return
                    ), 900
                    return
    ).state('app.gallery',
        url: '/gallery'
        views:
            'menuContent':
                templateUrl: 'templates/gallery.html'
                controller: 'GalleryCtrl'
            'fabContent':
                template: '<button id="fab-gallery" class="button button-fab button-fab-top-right expanded button-energized-900 drop"><i class="icon ion-heart"></i></button>'
                controller: ($timeout) ->
                    $timeout (->
                        document.getElementById('fab-gallery').classList.toggle 'on'
                        return
                    ), 600
                    return
    ).state('app.login',
        url: '/login'
        views:
            'menuContent':
                templateUrl: 'templates/login.html'
                controller: 'LoginCtrl'
            'fabContent': template: '').state 'app.profile',
        url: '/profile'
        views:
            'menuContent':
                templateUrl: 'templates/profile.html'
                controller: 'ProfileCtrl'
            'fabContent':
                template: '<button id="fab-profile" class="button button-fab button-fab-bottom-right button-energized-900"><i class="icon ion-plus"></i></button>'
                controller: ($timeout) ->

                    ###$timeout(function () {
                        document.getElementById('fab-profile').classList.toggle('on');
                    }, 800);
                    ###

                    return
    # if none of the above states are matched, use this as the fallback
    $urlRouterProvider.otherwise '/app/login'
    return
