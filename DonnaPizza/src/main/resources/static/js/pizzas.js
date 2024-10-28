document.getElementById('btnListarPizzas').addEventListener('click', () => {
    listarPizzas();
});

function listarPizzas() {
    fetch('/getListPizzasJSON')
        .then(response => {
            if (!response.ok) {
                throw new Error('Error en la red');
            }
            return response.json();
        })
        .then(data => {
            console.log("Respuesta JSON:", data);
            if (!Array.isArray(data)) {
                throw new Error("El formato de datos no es un arreglo.");
            }

            const tbody = document.querySelector('#listaPizzas tbody');
            tbody.innerHTML = '';
            data.forEach(pizza => {
                const disponibleText = pizza.disponible === 0 ? 'No' : 'Si';
                const tr = document.createElement('tr');
                tr.innerHTML = `
                <td>${pizza.id_pizza}</td>
                <td>${pizza.nombre}</td>
                <td>${pizza.descripcion}</td>
                <td>${pizza.precio}</td>
                <td>${disponibleText}</td>
                <td>
                    <button class="btn btn-warning btn-sm" onclick="abrirModalActualizar(${pizza.id_pizza});" data-bs-toggle="modal" data-bs-target="#actualizarPizzaModal">Editar</button>
                    <button class="btn btn-danger btn-sm" onclick="eliminarPizza(${pizza.id_pizza});">Eliminar</button>
                </td>`;
                tbody.appendChild(tr);
            });
        })
        .catch(error => {
            console.error('Error al consultar pizza', error);
        });
};

// REGISTRAR
document.getElementById('btnGuardarPizza').addEventListener('click', () => {
    const pizza = {
        nombre: document.getElementById('nombrePizza').value,
        descripcion: document.getElementById('descripcionPizza').value,
        precio: parseFloat(document.getElementById('precioPizza').value),
        disponible: document.getElementById('disponiblePizza').checked ? 0 : 1
    };

    fetch('/CRUDPizzas', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(pizza)
    })
        .then(response => response.json())
        .then(data => {
            Swal.fire({
                icon: 'success',
                title: 'Pizza registrada',
                text: 'La pizza ha sido registrada con éxito'
            });
            document.getElementById('formRegistrarPizza').reset();
            const modal = bootstrap.Modal.getInstance(document.getElementById('registrarPizzaModal'));
            modal.hide();
            listarPizzas();
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Hubo un problema al registrar la pizza'
            });
            console.error('Error al registrar la pizza:', error);
        });
});

function cargarDatosPizza(pizza) {
    console.log(pizza);
    document.getElementById('idPizza').value = pizza.id_pizza;
    document.getElementById('nombrePizzaActualizar').value = pizza.nombre;
    document.getElementById('descripcionPizzaActualizar').value = pizza.descripcion;
    document.getElementById('precioPizzaActualizar').value = pizza.precio;
    document.getElementById('disponiblePizzaActualizar').checked = pizza.disponible === 0;
}

function abrirModalActualizar(id) {
    fetch(`/CRUDPizzas/${id}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al obtener la pizza');
            }
            return response.json();
        })
        .then(data => {
            cargarDatosPizza(data);
            const modal =  bootstrap.Modal.getInstance(document.getElementById('actualizarPizzaModal'));
            modal.show();
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

document.getElementById('btnActualizarPizza').addEventListener('click', () => {
    const id = document.getElementById('idPizza').value;
    const pizza = {
        nombre: document.getElementById('nombrePizzaActualizar').value,
        descripcion: document.getElementById('descripcionPizzaActualizar').value,
        precio: parseFloat(document.getElementById('precioPizzaActualizar').value),
        disponible: document.getElementById('disponiblePizzaActualizar').checked ? 0 : 1
    };

    fetch(`/CRUDPizzas/${id}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(pizza)
    })
        .then(response => response.json())
        .then(data => {
            Swal.fire({
                icon: 'success',
                title: 'Pizza actualizada',
                text: 'La pizza ha sido actualizada con éxito'
            });
            document.getElementById('formActualizarPizza').reset();
            const modal = bootstrap.Modal.getInstance(document.getElementById('actualizarPizzaModal'));
            modal.hide();
            listarPizzas();
        })
        .catch(error => console.error('Error al actualizar la pizza:', error));
});

function eliminarPizza(id) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "Esta acción no se puede deshacer",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            fetch(`/CRUDPizzas/${id}`, {
                method: 'DELETE'
            })
                .then(response => {
                    if (response.ok) {
                        Swal.fire(
                            'Eliminada!',
                            'La pizza ha sido eliminada.',
                            'success'
                        );
                        listarPizzas();
                    } else {
                        throw new Error('Error al eliminar la pizza');
                    }
                })
                .catch(error => console.error('Error al eliminar la pizza:', error));
        }
    });
}
