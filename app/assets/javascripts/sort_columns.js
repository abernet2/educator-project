$(document).ready(function(){
	var students = $('.student-row');

	$('.number-sort').on('click', function(event){
		event.preventDefault();
		var columnHead = $(this).find('.sort_link');
		var sortColumn = $(this).attr('id');
		if (columnHead.hasClass('sort-desc') == false){
			kill_sort_classes();
			students = sort_desc(students, sortColumn);
			students.detach().appendTo('.table');
			add_desc(columnHead);
		} else {
			kill_sort_classes();
			students = sort_asc(students, sortColumn);
			add_asc(columnHead);
		}
	});

	$('.name-sort').on('click', function(event){
		event.preventDefault();
		var columnHead = $(this).find('.sort_link');
		var sortColumn = $(this).attr('id');
		if (columnHead.hasClass('sort-desc') == false){
			kill_sort_classes();
			students = sort_asc(students, sortColumn);
			add_desc(columnHead);
		} else {
			kill_sort_classes();
			students = sort_desc(students, sortColumn);
			add_asc(columnHead);
		}
	});

	function kill_sort_classes(){
		$('.sort-desc').removeClass('sort-desc');
		$('.sort-asc').removeClass('sort-asc');
	}

	function add_desc(columnHead){
		students.detach().appendTo('.table');
		columnHead.addClass("sort-desc");
	}

	function add_asc(columnHead){
		students.detach().appendTo('.table');
		columnHead.addClass("sort-asc");
	}

	function sort_desc(students, sortColumn){
		sorted = students.sort(function(a,b) {
			var c = $('#' + a.getAttribute('id') + ' .' + sortColumn).text(),
				d = $('#' + b.getAttribute('id') + ' .' + sortColumn).text();
			return sort(d,c);
		});
		return sorted
	}

	function sort_asc(students, sortColumn){
		sorted = students.sort(function(a,b) {
			var c = $('#' + a.getAttribute('id') + ' .' + sortColumn).text(),
				d = $('#' + b.getAttribute('id') + ' .' + sortColumn).text();
			return sort(c,d);
		});
		return sorted
	}

	function sort(item1, item2){
			if (parseInt(item1) && parseInt(item2)){ 
				item1 = +item1;
				item2 = +item2;
			};
		return item1 < item2 ? -1 : 1;
	};

});