(function (angular, undefined) {
'use strict';

    var module = angular.module('myShop');
    module.controller('ModalViewImageController', ['$scope','$uibModal', '$document', function ($scope, $uibModal, $document) {
        
        $scope.open = function (size) {
            var parentElem = angular.element($document[0].querySelector('.modal-view'));
            var instance = $uibModal.open({
                ariaLabelledBy: 'modal-title',
                ariaDescribedBy: 'modal-body',
                templateUrl: 'modal-image-view.html',
                controller: 'ModalInstanceCtrl',
                size: size,
                appendTo: parentElem,
                resolve: {
                    context: function() {
                        return $scope.context;
                    }
                }
            });

            instance.result.then(function(resolve){
                resolve;
            }, function(reject){
                reject;
            });
        };
    }]);
    module.controller('ModalInstanceCtrl', ['$scope','$uibModalInstance', function ($scope, $uibModalInstance) {

        $scope.close = function () {
            $uibModalInstance.close();
        };
    }]);
})(window.angular);