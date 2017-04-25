//Storing data:
$("#btn-signup").on("click", save_json);

function save_json() {
    signup = {
        // username: document.getElementById("username").value,
        email: document.getElementById("email").value,
        first_name: document.getElementById("first_name").value,
        family_name: document.getElementById("family_name").value,
        telephone: document.getElementById("telephone").value,
        year: document.getElementById("year").value
    }

    myJSON = JSON.stringify(signup);
    localStorage.setItem("signupJSON", myJSON);
    console.log("new data should be saved in json");
};

// fill data from json
fill_data();

function fill_data() {
    var text;
    text = localStorage.getItem("signupJSON");
    signup = JSON.parse(text);
    // $("#username").val(signup.username);
    $("#email").val(signup.email);
    $("#first_name").val(signup.first_name);
    $("#family_name").val(signup.family_name);
    $("#telephone").val(signup.telephone);
    $("#year").val(signup.year);
    console.log("new data should be received from json");
};


// $(function() {
//     $.post('register.php', { width: screen.width, height:screen.height }, function(json) {
//         if(json.outcome == 'success') {
//             console.log("success")
//             // do something with the knowledge possibly?
//         } else {
//             alert('Unable to let PHP know what the screen resolution is!');
//         }
//     },'json');
// })
// 
// 
// $(function() { $.post('header.php', { width: 800px }, function(json) { if(json.outcome == 'success') { header-800px.php // do something with the knowledge possibly? } else { header.php; } },'json'); });