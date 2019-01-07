// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage

//= require_tree .

// $(document).on("turbolinks:load", function() {
// 	$('#example').DataTable();
// 	//translateTable();
// //Funciones:
// function translateTable() {
//   		//Cantidad de filas
//   		en_text= $("#example_length label").html();
// 		//Palabras a cambiar:
// 		es_text= en_text.replace("Show", "Mostrar");
// 		es_text= es_text.replace("entries", " filas");
// 		$("#example_length label").html(es_text);

// 		//Formulario
// 		en_text = $("#example_filter label").html();
// 		//Palabras a cambiar:
// 		es_text = en_text.replace("Search", "Buscar");
// 		$("#example_filter label").html(es_text);
// 	}
// });

$(document).ready(function () {
	$('#example').DataTable();
	//translateTable();
//Funciones:
function translateTable() {
  		//Cantidad de filas
  		en_text= $("#example_length label").html();
		//Palabras a cambiar:
		es_text= en_text.replace("Show", "Mostrar");
		es_text= es_text.replace("entries", " filas");
		$("#example_length label").html(es_text);

		//Formulario
		en_text = $("#example_filter label").html();
		//Palabras a cambiar:
		es_text = en_text.replace("Search", "Buscar");
		$("#example_filter label").html(es_text);
	}

});

