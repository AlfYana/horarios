let diasLaborables= ["lunes", "martes", "miercoles", "jueves", "viernes"];

let personal = document.getElementById("list_personal"); 
let tabla    = document.getElementById("tabla-registros");
function actualizarPersonal() {
    const data = new FormData();
    data.append('texto', 'busqueda');
    fetch('server/personal.php', {
        method: 'POST',
        body: data, 
    })
    .then(function(response){
        if(response.ok)
        {
            //console.log(response.text());
            return response.json();
        }
    }).then( data =>{
        console.log(data);
        let options = "";
        let nombre = "";
        data.forEach(elem => {
            nombre = elem.nombre;
            if(elem.apellido != null){
                nombre = nombre + " " + elem.apellido;
            }
            options = options + `
            <option value="${elem.emp_id}" data-emp="${elem.emp_code}">${nombre}</option>
            `;
        });
        personal.innerHTML = options;
    });
}

actualizarPersonal();

/***** Buscador *******/
let emp_code    = document.querySelector("input[name='code']");
let input       = document.getElementById("empleados");
input.addEventListener("input", function() {
    tabla.querySelector('tbody').innerHTML ='';
    let seleccionado = document.getElementById("list_personal").querySelector("option[value='" + input.value + "']");
    if (seleccionado) {
        emp_code.value = seleccionado.value;
        input.value = seleccionado.text;
        agregarHorariosExistentes(seleccionado.value);
    }
    else{
        document.querySelector("input[name='code']").value = '';
    }
});

/*********** function que agrega los horarios *************/
function agregarHorariosExistentes(emp_code) {
    let data = new FormData();
    data.append('empleado',emp_code);
    fetch('server/horarios.php', {
      method: "POST",
      body: data,
    })
    .then(response => response.json()) 
    .then(json => {
      //console.log(json);
      if(json.length > 0)
      {
        json.forEach(elem => {
            agregate({ id: elem.id, entrada: elem.entrada, salida: elem.salida, dias: elem.dias.split(',')})
        });
      }
      else{
        //tabla.querySelector('tbody').innerHTML ='';
      }
    })
    .catch(err => console.log(err));
}

/****** Evento al seleccionar checkeds ******/
tabla.addEventListener("change", function(e){
    if (e.target.nodeName == "INPUT") {
        let dia = e.target.name;
        if(diasLaborables.includes(dia))
        {
            e.target.closest("td").querySelector("input[name='default']").checked = false;
        }
        else if(dia == "default") {
            let semana = e.target.closest("td").querySelectorAll("input:checked");
            semana.forEach(element => {
                if(diasLaborables.includes(element.name))
                    element.checked = false;
            });
        }
        
    }

}, "checkeds");

/****** Evento para eliminar un horario *****/
tabla.addEventListener("click", function(e){
    //console.log(e.target.classList);
    if ( e.target.classList.contains("delete")) {
        let id = e.target.closest("tr").querySelector(".code_col").innerText;
        if(id)
        {
            let data = new FormData();
            data.append('id', id);
            fetch('server/eliminarHorario.php', {
                method: "POST",
                body: data,
            })
            .then(response => response.json()) 
            .then(json => {
                console.log(json);
                if(json.data.eliminadas)
                {
                    e.target.closest("tr").remove();
                }
            }).catch(err => console.log(err));
        }
        else{
            e.target.closest("tr").remove();
        }
    }
}, ".delete");

/****** agregar un nuevo horario *****/
document.getElementById("agregar").addEventListener("click", function(){
    agregate({id:'', entrada:'08:00', salida:'20:00', dias:[]});
});
function agregate(item){
    
    let nuevaFila = document.createElement('tr');
    nuevaFila.innerHTML = `
    <td class="code_col">${item.id}</td>
    <td class="hora">
        <input type="time" name="entrada" value="${item.entrada}">
    </td>
    <td class="hora">
        <input type="time" name="salida" value="${item.salida}">
    </td>
    <td class="checkeds">
        <label><input type="checkbox" name="default" value="default" checked><sup>L-V</sup></label>
        <label><input type="checkbox" name="lunes" value="lunes"><sup>Lu</sup></label>
        <label><input type="checkbox" name="martes" value="martes"><sup>Ma</sup></label>
        <label><input type="checkbox" name="miercoles" value="miercoles"><sup>Mi</sup></label>
        <label><input type="checkbox" name="jueves" value="jueves"><sup>Ju</sup></label>
        <label><input type="checkbox" name="viernes" value="viernes"><sup>Vi</sup></label>
        <label><input type="checkbox" name="sabado" value="sabado"><sup>Sa</sup></label>
        <label><input type="checkbox" name="domingo" value="domingo"><sup>Do</sup></label>
    </td>
    <td><div class="delete">X</div></td>
        `;
    tabla.querySelector("tbody").appendChild(nuevaFila);
    
    if(item.dias.length > 0){
        let checkeds = tabla.querySelector("tbody").lastElementChild.querySelectorAll(".checkeds input[type='checkbox']");
        checkeds.forEach(input => {
            if( item.dias.includes(input.value) )
                input.checked = true;
            else
                input.checked = false;
        });
    }
    
}

/********  Evento para guardar datos************/
document.getElementById("guardar").addEventListener("click", function(){
    let filas = tabla.querySelector("tbody").querySelectorAll("tr");
    let horario = [];
    filas.forEach(fila => {
        let checkeds = fila.querySelectorAll('.checkeds input:checked');
        let dias = [];
        if(checkeds.length > 0 && emp_code.value)
        {
            checkeds.forEach(check => {
            dias.push(check.value);
            });
            horario.push({
            dias: dias.toString(),
            //emp_code: emp_code.value,
            entrada: fila.querySelector('input[name="entrada"]').value,
            salida: fila.querySelector('input[name="salida"]').value,
            id_horario: fila.querySelector('.code_col').innerText,
            });

        }
        else{
            console.log("Selecciona algun dia porfavor");
        }
    });
    let codigoEmpleado = document.getElementById("list_personal").querySelector("option[value='" + emp_code.value + "']").dataset.emp;
    saveHorario(horario, emp_code.value, codigoEmpleado);
});

/****  Enviando Horario al servidor ****/
function saveHorario(horario, empleado, codigo) {
    
    console.log(horario);
    const registro = new FormData();
    registro.append('horario', JSON.stringify(horario));
    registro.append('empleado', empleado);
    registro.append('code', codigo);
    fetch('server/guardarHorario.php', {
        method: 'POST',
        body: registro, 
    })
    .then(function(response){
        if(response.ok)
        {
            tabla.querySelector('tbody').innerHTML ='';
            agregarHorariosExistentes(empleado);
            return response.json();
        }
    })
    .then( data => console.log(data))
    .catch( err => console.error(err));
}
