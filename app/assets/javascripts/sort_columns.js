$(document).ready(function(){
	var students = $('.student-row');

	$('.sort_link').on('click', function(event){
		event.preventDefault();
		var columnHead = $(this);
		var sortColumn = $(this).parent().attr('id');
		if (columnHead.hasClass('sort-desc') == false){
			student_desc(students, sortColumn, columnHead);
		} else {
			student_asc(students, sortColumn, columnHead);
		}
	});

	function student_desc(students, sortColumn, columnHead){
		$('.sort-desc').removeClass('sort-desc');
		$('.sort-asc').removeClass('sort-asc');
		students = sort_desc(students, sortColumn);
		students.detach().appendTo('.table');
		columnHead.addClass("sort-desc");
	}

	function student_asc(students, sortColumn, columnHead){
		$('.sort-desc').removeClass('sort-desc');
		$('.sort-asc').removeClass('sort-asc');
		students = sort_asc(students, sortColumn);
		students.detach().appendTo('.table');
		columnHead.addClass("sort-asc");
	}

	function sort_desc(students, sortColumn){
		sorted = students.sort(function(a,b) {
			var c = $('#' + a.getAttribute('id') + ' .' + sortColumn).text(),
				d = $('#' + b.getAttribute('id') + ' .' + sortColumn).text();
			return d - c;
		});
		return sorted
	}

	function sort_asc(students, sortColumn){
		sorted = students.sort(function(a,b) {
			var c = $('#' + a.getAttribute('id') + ' .' + sortColumn).text(),
				d = $('#' + b.getAttribute('id') + ' .' + sortColumn).text();
			return c - d;
		});
		return sorted
	}

	// $('#name-sort').on('click', function(event){
	// 	event.preventDefault();
	// 	students.sort(function(a,b) {
	// 		var c = $('#' + a.getAttribute('id') + ' .student-name').text(),
	// 			d = $('#' + b.getAttribute('id') + ' .student-name').text();
	// 		return d - c;
	// 	});
	// 	students.detach().appendTo('.table');
	// });

});