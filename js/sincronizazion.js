let data;

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
        let trs = "";
        data.forEach(elem => {
            nombre = elem.first_name;
            if(elem.last_name != null){
                nombre = nombre + " " + elem.last_name;
            }
            trs = trs + `
            <tr>
                <td>${elem.id}</td>
                <td>${elem.emp_id}</td>
                <td>${elem.emp_code}</td>
                <td>${elem.nombre}</td>
                <td>${elem.apellido}</td>
                <td>${elem.depto}</td>
                <td>${elem.activo?true:false}</td>
            </tr>`;
        });
        document.getElementById("empleados").innerHTML = trs;
    });
}

//actualizarPersonal();


document.getElementById('sincronizar').addEventListener('click', even => {
    fetch('getPersonal.json', {
        method: 'GET',
    })
    .then(response=> {
        return response.json();
    })
    .then(data => {
        console.log(data);
        let trs = "";
        let cont=0;
        data.forEach(elem => {
            nombre = elem.first_name;
            if(elem.last_name != null){
                nombre = nombre + " " + elem.last_name;
            }
            trs = trs + `
            <tr>
                <td>${cont++}</td>
                <td class="emp_id">${elem.id}</td>
                <td class="emp_code">${elem.emp_code}</td>
                <td><input type="text" value="${elem.first_name}" name="nombre"></td>
                <td><input type="text" value="${elem.last_name}" name="apellido"></td>
                <td><input type="text" value="${elem.depto}" name="area"></td>
                <td><input type="checkbox" name="activo" id="" checked></td>
            </tr>`;
        });
        document.getElementById("sincPersonalBiometrico").innerHTML = trs;
    })
    .catch(err => console.error( err));
});

document.getElementById("agregarPersonal").addEventListener("click", () =>{
    let inputs = document.getElementById("sincPersonalBiometrico").querySelectorAll("input:checked");
    let personas = [];
    let tr;
    inputs.forEach(input => {
        tr = input.closest("tr");
        personas.push(
            {   emp_id      : tr.querySelector("td.emp_id").innerText,
                emp_code    : tr.querySelector("td.emp_code").innerText,
                nombre      : tr.querySelector("input[name='nombre']").value,
                apellido    : tr.querySelector("input[name='apellido']").value,
                depto       : tr.querySelector("input[name='area']").value,
            }
        );
    });
    if(personas.length>0){
        let data = new FormData();
        data.append('personas', JSON.stringify(personas));
        fetch('server/agregarPersonas.php', {
            method : 'POST',
            body : data,
        })
        .then( response => response.json())
        .then( data => {
            console.log("guardado");
            console.log(data);
        })
        .catch( err => console.log(err));
    }
    console.log(personas);
});