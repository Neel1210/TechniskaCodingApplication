// const API_KEY = '1224c636b061b02d666072374924471d70bcbc5138d5';
// const CLIENT_SECRET = '0fa86918df22157a3193d1319bdc98c170c7dc3e';

//cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js
var theme = 'ace/theme/tomorrow';
var mode = 'ace/mode/scss';
var editor = ace.edit('ace-editorid');
editor.setTheme(theme);
editor.getSession().setMode(mode);
// editor.renderer.setShowGutter(false); 

$('#ace-mode').on('change', function() {
    editor.getSession().setMode('ace/mode/' + $(this).val().toLowerCase());
});
$('#ace-theme').on('change', function() {
    editor.setTheme('ace/theme/' + $(this).val().toLowerCase());
});


// function submit()
// {
//     const HackerEarth=require('hackerearth-v4-node');
//     const HE = new HackerEarth({'clientSecret':'0fa86918df22157a3193d1319bdc98c170c7dc3e'});
//     HE.execute({
//         sourceFile:path.join(test,'add.cpp'),
//         lang:'CPP',
//         inputFile:path.join(test,'input.txt'),
//         memory_limit:10000,
//         time_limit:2,
//         // callbackURL:'YOUR_CALLBACK_URL'
//     },(err,response)=>{
//         if(err){
//             console.log(err);
//         }
//         else{
//             console.log(response.data);
//         }
//     })
// }

// submit();
