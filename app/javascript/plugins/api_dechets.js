fetch("https://opendata.bordeaux-metropole.fr/api/records/1.0/search/?dataset=dechetteries-en-temps-reel&facet=statut&facet=insee")
  .then(response => response.json())
  .then((data) => {
    console.log(data);
  });
