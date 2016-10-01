// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//=# require turbolinks
//= require bootstrap
//= require_tree .

$(function(){
	$('#decision_favorable_probability').on('input',function(){
		$('#decision_unfavorable_probability').val(100 - $(this).val())
	})

	$('#decision_unfavorable_probability').on('input',function(){
		$('#decision_favorable_probability').val(100 - $(this).val())
	})

	$('.decision-tree-btn').on('click', function(){
		$('#problems').empty();
		$.ajax({
			type: 'get',
			url: '/users/10/problems',
			success: function(response){
				var problems_decisions = response.filter(function(problem){
					return problem.category == 'Decision Tree Tool'
				})
				var decisions = problems_decisions.forEach(function(decision){
					var decisionTitle = decision.title;
					var decisionDescription = decision.description;
					$('#problems').append($('<h5>').text(decisionTitle));
					$('#problems').append($('<h5>').text(decisionDescription));
					$('#problems').append($('<a class="btn btn-primary btn-xs" href="/users/'+decision.user_id+'/problems/'+decision.id+'/form_decision">Analyze</a>'));
					$('#problems').append($('<a class="btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/users/'+decision.user_id+'/problems/'+decision.id+'">Delete</a>'));
				})
			},
			error: function(error){
				console.log(error);
			}
		})
	});

	$('.break-even-btn').on('click', function(){
		$('#problems').empty();
		$.ajax({
			type: 'get',
			url: '/users/10/problems',
			success: function(response){
				var problems_break_even = response.filter(function(problem){
					return problem.category == 'Break Even Analysis'
				})

				var break_evens = problems_break_even.forEach(function(break_even){
					var breakEvenTitle = break_even.title;
					var breakEvenDescription = break_even.description;
					$('#problems').append($('<h5>').text(breakEvenTitle));
					$('#problems').append($('<h5>').text(breakEvenDescription));
					$('#problems').append($('<a class="btn btn-primary btn-xs" href="/users/' + break_even.user_id + '/problems/' + break_even.id + '/break_evens/new">Analyze</a>'));
					$('#problems').append($('<a class="btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/users/' + break_even.user_id + '/problems/' + break_even.id + '">Delete</a>'));
				})

			},
			error: function(error){
				console.log(error);
			}
		})
	});

	$('.crossover-btn').on('click', function(){
		$('#problems').empty();
		$.ajax({
			type: 'get',
			url: '/users/10/problems',
			success: function(response){
				var problems_crossover = response.filter(function(problem){
					return problem.category == 'Crossover Analysis'
				})

				var crossovers = problems_crossover.forEach(function(crossover){
					crossoverTitle = crossover.title;
					crossoverDescription = crossover.description;
					$('#problems').append($('<h5>').text(crossoverTitle));
					$('#problems').append($('<h5>').text(crossoverDescription));
					$('#problems').append($('<a class="btn btn-primary btn-xs" href="/users/'+crossover.user_id+'/problems/'+crossover.id+'/form_crossover">Analyze</a>'));
					$('#problems').append($('<a class="btn btn-primary btn-xs" data-confirm="Are you sure?" data-method="delete" href="/users/' + crossover.user_id + '/problems/' + crossover.id + '">Delete</a>'));					
				})
			},
			error: function(error){
				console.log(error);
			}			
		})
	});
})