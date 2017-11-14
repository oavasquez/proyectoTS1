
//####### initizalizacion de la parte grafica
var $ = go.GraphObject.make;
var myDiagram =
  $(go.Diagram, "myDiagramDiv",
    {
      initialContentAlignment: go.Spot.Center, // center Diagram contents
      scale: 0.5,
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
  




  myDiagram.startTransaction("Agregando clases");
  node.background="#ea7c7c";
  node.data.estado="aprobada";
   myDiagram.commitTransaction("Agregadas con exito");
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



     myDiagram.nodes.each(function(n){ 

      for(var i=0;i<clases.length;i++){
        if(n.data.key==clases[i].IdClase){
          n.data.UV=clases[i].UV;
          n.data.peso=clases[i].peso;
          break;
        }



      }

      myDiagram.startTransaction("Agregando clases");
      n.data.estado="";
      myDiagram.commitTransaction("Agregadas con exito");


    });
   
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



///#########jquery antes de la visualizacion
jQuery(document).ready(function ($) {

function limpiarGrafico(){
   myDiagram.clear();
  obtenerClases();}


  $("#slcPlanEstudio").click(function(){
    limpiarGrafico()
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
         //console.log(respuesta);

          /*
         for (var i=0;i<respuesta.length;i++){
         $("#tblClases").append(
                            '<tr id=tr-'+respuesta[i].IdClase+'>'+
                            '<td id=td-peso-'+respuesta[i].IdClase+'>'+respuesta[i].peso+'</td>'+
                            '<td id=td-UV-'+respuesta[i].IdClase+'>'+respuesta[i].UV+'</td>'+
                            '</tr>'
          );
         }
          */


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

     myDiagram.nodes.each(function(n){ 


      if(n.findTreeParentLink()==null && n.data.estado!="aprobada"){

         myDiagram.startTransaction("Agregando clases");
         n.background="#fc9f2d";
         n.data.estado="recomendado";
         myDiagram.commitTransaction("Agregadas con exito");


      }


      if(n.data.estado=="aprobada"){
        

        var it = n.findTreeChildrenNodes();
    
        while(it.next()){
                  var child = it.value;


                   if(child.data.estado!="aprobada"){

                  var father = child.findNodesInto();
                   while(father.next()){
                    var patern=father.value;

                     //console.log("hijo: "+child.data.name+" padre: "+patern.data.name);
                     if (patern.data.estado=="aprobada"){

                      myDiagram.startTransaction("Agregando clases");
                      child.background="#fc9f2d";
                      child.data.estado="recomendado";
                      myDiagram.commitTransaction("Agregadas con exito");


                     }else{
                      myDiagram.startTransaction("Agregando clases");
                      child.data.estado="";
                      child.background="#44CCFF";
                      myDiagram.commitTransaction("Agregadas con exito");
                      break;

                      }  

                    }
                  }
               }

        }

    });
     //console.log(clasesCalcular);
     //console.log(clasesCalcular);

        calcularUV();
    

  });


  $("#btnRecomendar").click(function(){
    var clasesRecomendadas=[];
    var pesoTotal=0;
    var dificultad=parseInt($("#txtDificultad").val());
    var UVtotal=parseInt($("#txtCantUV").val());
    var CantClases=parseInt($("#txtCantidadClases").val());
    var comparadorDificultad=0;
    var clasesSelecionadas=[]
    var contUV=0;
    var contPesos=0;



    myDiagram.nodes.each(function(n){ 

      if(n.data.estado=="recomendado"){
        //console.log(n.data.key+" "+n.data.name+" "+n.data.estado);
         clasesRecomendadas.push(JSON.parse('{"clase":'+n.data.key+', "UV" :'+n.data.UV+', "peso" : '+n.data.peso+'}') );
         pesoTotal=pesoTotal+n.data.peso;
      }

    });



    //console.log(clasesRecomendadas);
    //console.log((pesoTotal*(dificultad))/100);
    comparadorDificultad=(pesoTotal*(dificultad))/100;
    //console.log(UVtotal);

    for(var i =0;i<clasesRecomendadas.length;i++){
      if(clasesSelecionadas.length<=CantClases){
         
         console.log(comparadorDificultad+" "+pesoTotal/2)
         console.log(contUV+" "+UVtotal)
        if(comparadorDificultad>(pesoTotal/2)&&contUV<=UVtotal){
          
       

          clasesRecomendadas.forEach(function(elem,index,object){
            console.log(elem);
            if(elem.peso>5&&contUV<=UVtotal&&contPesos<=comparadorDificultad){

            clasesSelecionadas.push(elem);
            contUV=contUV+elem.UV;
            contPesos=contPesos+elem.peso
            object.splice(index, 1);

            
            }

          });

          
          if (contUV<=UVtotal&&contPesos<=comparadorDificultad) {

            clasesRecomendadas.forEach(function(elem,index,object){
            if(elem.peso<5&&contUV+elem.UV<=UVtotal&&contPesos+contPesos<=comparadorDificultad){
              console.log(elem);
            clasesSelecionadas.push(elem);
            contUV=contUV+elem.UV;
            contPesos=contPesos+elem.peso
            object.splice(index, 1);

            }

          });


          }

          }

        if(comparadorDificultad<(pesoTotal/2)&&contUV<=UVtotal){
          clasesRecomendadas.forEach(function(elem,index,object){
            if(elem.peso<5&&contUV<=UVtotal){
              console.log(elem);
            clasesSelecionadas.push(elem);
            contUV=contUV+elem.UV;
            object.splice(index, 1);

            }

          });

          }





        }


      }

    







    //for (var i=0;i<CantClases;i++){
      //var nodo=myDiagram.model.findNodeDataForKey(4);
    
      console.log(clasesSelecionadas);
    for (var i=0;i<clasesSelecionadas.length;i++){


          //console.log(clasesRecomendadas[i].clase);
      myDiagram.nodes.each(function(n){ 

          //console.log(n.data.key);
        if(n.data.key==clasesSelecionadas[i].clase){
          myDiagram.startTransaction("Agregando clases");
          n.background="#40EF52"
          myDiagram.commitTransaction("Agregadas con exito");
          

        }



      
       });
      
      }
      



    //}



  });



  function mostrarClasesRecomendada(){






  }

  function calcularUV(){
    var cantUV=parseInt($("#txtIndiceAcademico").val());
    var resultado=0

    
    if(cantUV>=0&&cantUV<=39)
        resultado=12;
    if(cantUV>=40&&cantUV<=59)
        resultado=14;
    if(cantUV>=60&&cantUV<=69)
        resultado=16;
    if(cantUV>=70&&cantUV<=79)
        resultado=20;
    if(cantUV>=80&&cantUV<=100)
        resultado=25;

      $("#txtCantUV").val(resultado);


  }



  

  $("#btnLimpiar").click(function(){
  limpiarGrafico();

  });




});