    let tabla = document.getElementById("promedio");
    const base = "/horarios";
    
    window.onload = actualizarDatosPromedios();
    function actualizarDatosPromedios() {
        let tbody = document.getElementById("promedio");
        tbody.innerHTML = "";
        actualizarTabla( {file: 'posterior.json', dom: tbody, column: 3} );
        actualizarTabla( {file: 'anterior.json', dom: tbody, column: 2} );
    }

    function actualizarTabla( params ) {
        let data = new FormData();
        data.append( "archivo", params.file );
        //llamando al servidor para obtener los datos de la ruta del archivo json creado anteriormente
        fetch(`${base}/googleApi/getArchivo.php`, {
            method: "POST",
            body: data,
        })
        .then(response => {
            if(response.ok) return response.json();
            else throw new Error(response.status);
        })
        .then(data => {
            console.log(data);
            let nodo = params.dom;
            let columna = params.column;
            let fecha = data.fecha;
            nodo.closest("table").querySelector("thead tr").querySelector(`th:nth-child(${columna})`).innerHTML = fecha;
            data.datos.forEach(item => {
                let tr = getFilaPorNombre(item.nombre, nodo);
                if(tr){
                    tr.querySelector(`td:nth-child(${columna})`).innerHTML = item.promedio;
                    tr.querySelector(`td:nth-child(${columna})`).className = `promedio ${getClassColorPorPromedio(item.promedio)}`;
                }
                else{
                    celdaAnterior =
                    nodo.appendChild( creaFila(item, columna));
                }
            });
        })
        .catch( err => console.error(err));
    }
    /*****    busca por defecto en la primera fila    *******/
    function getFilaPorNombre(nombre, tbody){
        let tr = false;
        tbody.querySelectorAll('tr').forEach(fila => {
          if(fila.querySelector('td:first-child').dataset.nombre == nombre)
            tr = fila;
        });
        return tr;
    }

    function creaFila(fila, columna){
        let nuevaFila = document.createElement('tr');
        //console.log(nombre.replace(/([A-Z])/g, ' $1'));
        nuevaFila.innerHTML = `
          <td class="nombre" data-nombre="${fila.nombre}">${fila.nombre.replace(/([A-Z])/g, ' $1')}</td>
          <td class="promedio"></td>
          <td class="promedio"></td>
        `;
        nuevaFila.querySelector(`td:nth-child(${columna})`).innerHTML = fila.promedio;
        nuevaFila.querySelector(`td:nth-child(${columna})`).classList.add(getClassColorPorPromedio(fila.promedio));
        return nuevaFila;
    }

    /******* obtiene la clase que definira el color de fondo de la clase*******/
    function getClassColorPorPromedio(numero)
    {
      if(!isNaN(numero)){
          if(numero<=30)
              return "bajo";
          if(numero<=60)
              return "regular";
          if(numero<=60)
              return "alta";
          if(numero<=100)
              return "excelente";
      }
      return "blanco";
    }
      
    setInterval(actualizarDatosPromedios, 50000);