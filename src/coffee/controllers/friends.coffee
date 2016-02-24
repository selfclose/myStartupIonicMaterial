app.controller('FriendsCtrl', ($scope, $stateParams, $timeout, ionicMaterialInk, ionicMaterialMotion) ->
# Set Header
    $scope.$parent.showHeader()
    $scope.$parent.clearFabs()
    $scope.$parent.setHeaderFab 'left'
    # Delay expansion
    $timeout (->
        $scope.isExpanded = true
        $scope.$parent.setExpanded true
        return
    ), 300
    # Set Motion
    ionicMaterialMotion.fadeSlideInRight()
    # Set Ink
    ionicMaterialInk.displayEffect()
    return
)
