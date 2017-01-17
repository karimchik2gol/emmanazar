angular
	.module('main', [])
	.controller('MainCtrl', ['$scope', "$log", '$http', function($scope, $log, $http) {
		$scope.sortName = 'num';
		$scope.sortDirection = false; // ASC

		$http({
				method: 'GET',
				url: '/apartments.json'
			})
			.then(function(response) {
				$scope.apartments = response.data;
				$log.info($scope.apartments);
			});

		$scope.sortData = function(columnName) {
			$scope.sortDirection = ($scope.sortName == columnName) ? !$scope.sortDirection : false;
			$scope.sortName = columnName;
		}


		$scope.mySearch = function(item) { 
			if($scope.searchBy == undefined) {
				return true;
			}
			else {
				title = $scope.searchBy.title || '';
				upvotes = $scope.searchBy.upvotes;
				if(upvotes && upvotes.replace(/\s+/g, "").length == 0) { upvotes = null }
				if(item.title.indexOf(title.toLowerCase()) != -1 && (!upvotes || item.upvotes == upvotes)) {
					return true;
				}
			}

			return false;
		}
	}]);
