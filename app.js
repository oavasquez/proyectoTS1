var express=require("express");
var app = express();
var mysql=require("mysql");


var conexion = mysql.createConnection({
	host:"localhost",
	user:"root",
	password:"",
	database:"bdCalculoClases"
});


app.use(express.static("public"));



app.get("/obtenerRequisitos",function(peticion,respuesta){
	//console.log(peticion.query.codigoPlanEstudio);
	conexion.query(
			'SELECT F.IdClase as idclase, F.nombre as nombre, F.peso as peso ,D.IdClaseRequisito as requisito '+ 
			'FROM ClasesXRequisito as D '+
			'INNER JOIN '+
			'(SELECT A.IdPlanEstudio, C.IdClase AS IdClase, C.Nombre AS nombre, C.Peso as peso '+
			'FROM PlanEstudioXClases AS A '+
			'INNER JOIN TblPlanEstudio AS B '+
			'ON(A.IdPlanEstudio=B.IdPlanEstudio) '+
			'INNER JOIN TblClases AS C '+
			'ON(A.IdClases=C.IdClase) '+
			'WHERE B.IdPlanEstudio=?) AS F '+
			'ON(F.IdClase= D.IdClase AND F.IdPlanEstudio=D.IdPlanEstudio)',
			[peticion.query.codigoPlanEstudio],
			function(err, filas, campos){
				respuesta.send(JSON.stringify(filas));
			}
		);

	
});


app.get("/obtenerClases",function(peticion,respuesta){
	//console.log(peticion.query.codigoPlanEstudio);
	conexion.query(
			'SELECT C.IdClase AS IdClase, C.Nombre AS nombre, C.Peso as peso '+
			'FROM PlanEstudioXClases AS A '+
			'INNER JOIN TblPlanEstudio AS B '+
			'ON(A.IdPlanEstudio=B.IdPlanEstudio) '+
			'INNER JOIN TblClases AS C '+
			'ON(A.IdClases=C.IdClase) '+
			'WHERE B.IdPlanEstudio=? ',
			[peticion.query.codigoPlanEstudio],
			function(err, filas, campos){
				respuesta.send(JSON.stringify(filas));
			}
		);

	
});


app.listen(3000,function(){
	console.log("Servidor inicializado en el puerto 3000")

});