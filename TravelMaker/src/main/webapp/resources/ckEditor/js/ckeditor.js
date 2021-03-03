ClassicEditor 
       .create(document.querySelector( '#content' )) 
       
       
       .then( editor => { 
           console.log( editor ); 
           toolbarContainer.appendChild(editor.ui.view.toolbar.element);
       })
       .catch( error => { 
         console.error( error ); 
      });