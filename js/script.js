const insertHtmlCode = function () {
  fetch("../syntax/htmlFile.txt")
    .then((response) => response.text())
    .then((data) => {
      console.log(data);
      console.log("-----------------");

      const newData = data.split(",").join("");
      console.log(newData);

      const containerCode = document.querySelector("#insert");

      containerCode.insertAdjacentHTML("afterbegin", newData);
    })
    .catch((err) => console.log(err));
};

insertHtmlCode();

//   Podemos agregar un event listener para que se refresque el contenido cada que se recibe un nuevo archivo
//   Checar como hacerlo
