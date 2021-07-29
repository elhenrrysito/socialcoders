document.addEventListener("DOMContentLoaded", function() {
    const queryString = window.location.search;
  
   const params = new URLSearchParams(queryString);
   const error = params.get('error');
   console.log(params.get("error"));
   if(error !== null ){
        alert(`tuviste ${error}/3 respuestas malas. Vuelve a intentarlo`);
   }
  
 });