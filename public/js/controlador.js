






//####### initizalizacion de la parte grafica
var $ = go.GraphObject.make;
var myDiagram =
  $(go.Diagram, "myDiagramDiv",
    {
      initialContentAlignment: go.Spot.Center, // center Diagram contents
      "undoManager.isEnabled": true, // enable Ctrl-Z to undo and Ctrl-Y to redo
      layout: $(go.TreeLayout, // specify a Diagram.layout that arranges trees
                { angle: 0, layerSpacing: 100 })
    });

myDiagram.nodeTemplate =
  $(go.Node, "Vertical",
    // the entire node will have a light-blue background
    { background: "#44CCFF" },
  
    $(go.TextBlock,
      "Default Text",  // the initial value for TextBlock.text
      // some room around the text, a larger font, and a white stroke:
      { margin: 12, stroke: "white", font: "bold 16px sans-serif" },
      // TextBlock.text is data bound to the "name" attribute of the model data
      new go.Binding("text", "name",)),
    { // second arg will be this GraphObject, which in this case is the Node itself:
      click: function(e, node) {
      marcarClasesAprobadas(e,node);
      }

  }


  );

myDiagram.linkTemplate =
  $(go.Link,
    { routing: go.Link.AvoidsNodes, corner: 5 },
  $(go.Shape, { strokeWidth: 3, stroke: "#555" }),
  $(go.Shape, { toArrow: "Triangle", fill: 'blue', scale:2 ,stroke: null }),

    ); // the link shape


function marcarClasesAprobadas(e,node){
  node.background="#ea7c7c";
  node.data.estado="aprobada";
  //console.log(node.data.estado);
}








function agregarClases(clases){

    var nodeDataArray=[];
    for (var i =0; i<clases.length ; i++) {
       nodeDataArray.push((JSON.parse('{"key":'+clases[i].IdClase+',"name":"'+clases[i].nombre+'"}')));
      
    }
     myDiagram.startTransaction("Agregando clases");
     myDiagram.model.addNodeDataCollection(nodeDataArray);
     myDiagram.commitTransaction("Agregadas con exito");
   
  }
function agregarRequisitos(requisitos){
   
   var linkDataArray=[];

   for (var i =0; i<requisitos.length ; i++) {
    if(requisitos[i].idclase!=null&&requisitos[i].requisito!=null){  
       linkDataArray.push((JSON.parse('{"from":'+requisitos[i].requisito+', "to":'+requisitos[i].idclase+'}') ));
    }
      
    }
    //console.log(linkDataArray);
     myDiagram.startTransaction("Agregando links clases");
     myDiagram.model.addLinkDataCollection(linkDataArray);
     myDiagram.commitTransaction("Agregadas con exito");
}

function limpiarGrafico(){
   myDiagram.clear();

}


///#########jquery antes de la visualizacion
jQuery(document).ready(function ($) {



$("#slcPlanEstudio").click(function(){
  limpiarGrafico()
  obtenerClases();
});

  
function obtenerClases(){
  var nodeDataArrays=[];
  var linkDataArrays=[];
  var parametro ="codigoPlanEstudio="+$("#slcPlanEstudio").val();
  //console.log(parametro);

  $.ajax({
     
      url:"/obtenerClases",
      //Tambien se puede utilizar el siguiente patron:
      //url:"/mensajes/"+$("#slc-usuario").val()+"/"+codigoContacto,
      data:parametro,
      method:"GET",
      dataType:"json",
      success:function(respuesta){
        //console.log(respuesta)
       agregarClases(respuesta);


      },
      error:function(err){
        console.log(err);
      } 
    });

 $.ajax({
     
      url:"/obtenerRequisitos",
      //Tambien se puede utilizar el siguiente patron:
      //url:"/mensajes/"+$("#slc-usuario").val()+"/"+codigoContacto,
      data:parametro,
      method:"GET",
      dataType:"json",
      success:function(respuesta){
        //console.log(respuesta)
        agregarRequisitos(respuesta);


      },
      error:function(err){
        console.log(err);
      } 
    });


 
}


$("#btnClasesApro").click(function(){
 var clasesCalcular=[];
   myDiagram.nodes.each(function(n){ 
    if (n.data.estado != "aprobada") {
      //console.log("nombre: "+n.data.name+" id:"+n.data.key);
      clasesCalcular.push(JSON.parse('{"key":'+n.data.key+', "name":"'+n.data.name+'"}'));
      myDiagram.startTransaction("Cambio de color");
      n.background="#00E03F";
       myDiagram.commitTransaction("Con exito");
     
}
  });
   //console.log(clasesCalcular);
   console.log(clasesCalcular);

  

});


function CalculandoSiguienteClases(clasesCandidatas){



}

$("#btnLimpiar").click(function(){
limpiarGrafico();

});




});











