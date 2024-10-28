document.getElementById('btnListarPizzas').addEventListener('click', () => {
    fetch('/getListPizzasJSON').then(response => {
        if (!response.ok) {
            throw new Error('Error en la red');
        }
        return response.json();
    })
        .then(data => {
            console.log(data);
            const tbody = document.querySelector('#listaPizzas tbody');

            tbody.innerHTML = '';
            data.forEach(pizza => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                <td>${pizza.id_pizza}</td>
                <td>${pizza.nombre}</td>
                <td>${pizza.descripcion}</td>
                <td>${pizza.precio}</td>
                <td>${pizza.disponible}</td>`;
                tbody.appendChild(tr);
            });
        })
        .catch(error => {
            console.error('Error al consultar pizza', error);
        });
});