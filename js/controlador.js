$("#btnClasesApro").click(function(){
	
	myDiagram.nodes.each(function(n){ 
		if (n.data.estado != "aprobada") 
			console.log(n.data.name);
	});


});



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
	console.log(node.data.estado);
}




 var nodeDataArray = [
      { key: 1, name:"clase1" },
      { key: 2, name:"clase2" },
      { key: 3, name:"clase3" },
      { key: 4, name:"clase4" },
      { key: 5, name:"clase5" },
      { key: 6, name:"clase6" },
      { key: 7, name:"clase7" },
      { key: 8, name:"clase8" },
      { key: 9, name:"clase9" }
 
    ];
    var linkDataArray = [
      { from: 1, to: 2, color: "blue" },
      { from: 2, to: 3, color: "blue" },
      { from: 3, to: 4, color: "blue" },
      { from: 4, to: 5, color: "green" },
      { from: 5, to: 6, color: "purple" },
      
      { from: 7, to: 8, color: "blue" },
      { from: 8, to: 3, color: "blue" }
    ];
    myDiagram.model = new go.GraphLinksModel(nodeDataArray, linkDataArray);
  







