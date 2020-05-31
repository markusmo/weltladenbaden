(function (angular, undefined) {
'use strict';

    var module = angular.module('weltladen.image.modal', ['ngAnimate', 'ngSanitize', 'ui.bootstrap']);
    module.controller('ModalViewImageController', ['$uibModal', '$document', function ($uibModal, $document) {
        var $ctrl = this;
        $ctrl.open = function (size, imgUrl) {
            var parentElem = angular.element($document[0].querySelector('.modal-view'));
            $ctrl.imgUrl = imgUrl;
            var instance = $uibModal.open({
                ariaLabelledBy: 'modal-title',
                ariaDescribedBy: 'modal-body',
                templateUrl: 'modal-image-view.html',
                controller: 'ModalImageViewControllerInstance',
                controllerAs: '$ctrl',
                size: size,
                appendTo: parentElem,
                resolve: {
                    imgUrl: function(){
                        return $ctrl.imgUrl;
                    }
                }
            });

            instance.result.then(function (selectedItem) {
                $ctrl.selected = selectedItem;
            }, function () {
                //do nothing
            });
        };
    }]);
    module.controller('ModalImageViewControllerInstance', ['$uibModalInstance', 'imgUrl', function ($uibModalInstance, imgUrl) {
        var $ctrl = this;
        $ctrl.imgUrl = imgUrl;
        $ctrl.close = function () {
            $uibModalInstance.dismiss('cancel');
        };
    }]);
})(window.angular);