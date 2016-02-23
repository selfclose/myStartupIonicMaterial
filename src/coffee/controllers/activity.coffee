app.controller('ActivityCtrl', ($scope, $stateParams, $timeout, ionicMaterialMotion, ionicMaterialInk) ->
    $scope.$parent.showHeader()
    $scope.$parent.clearFabs()
    $scope.isExpanded = true
    $scope.$parent.setExpanded true
    $scope.$parent.setHeaderFab 'right'
    $timeout (->
        ionicMaterialMotion.fadeSlideIn selector: '.animate-fade-slide-in .item'
        return
    ), 200
    # Activate ink for controller
    ionicMaterialInk.displayEffect()
    return
)
