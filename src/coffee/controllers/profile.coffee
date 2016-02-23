app.controller('ProfileCtrl', ($scope, $stateParams, $timeout, ionicMaterialMotion, ionicMaterialInk) ->
# Set Header
    $scope.$parent.showHeader()
    $scope.$parent.clearFabs()
    $scope.isExpanded = false
    $scope.$parent.setExpanded false
    $scope.$parent.setHeaderFab false
    # Set Motion
    $timeout (->
        ionicMaterialMotion.slideUp selector: '.slide-up'
        return
    ), 300
    $timeout (->
        ionicMaterialMotion.fadeSlideInRight startVelocity: 3000
        return
    ), 700
    # Set Ink
    ionicMaterialInk.displayEffect()
    return
)
