$("#box").hide();

window.onload = function(e) {
    window.addEventListener('message', function(event) {
        let data = event.data
        $("#box").show();
       //  document.getElementById("title").textContent = data.title;
    })
} 

    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://ali_namechange/exit', JSON.stringify({}));
            return
        }
    };

    $("#close").click(function () {
        $.post('http://ali_namechange/exit', JSON.stringify({}));
        return
    })

    $("#cancel").click(function() {
        $("#box").hide();
        $.post("http://ali_namechange/exit", JSON.stringify({
    
        }));
    });
    
    //when the user clicks on the submit button, it will run
    $("#submit").click(function () {
        let inputValue = $("#firstnameinput").val()
        let inputValue2 = $("#lastnameinput").val()
        if (inputValue.length >= 10 && inputValue2.lenght >= 10){
            $.post("http://ali_namechange/error", JSON.stringify({
                error: "Du kannst nicht so viele Zeichen eingeben."
            }))
            return
        } else if (!inputValue && !inputValue2) {
            $.post("http://ali_namechange/error", JSON.stringify({
                error: "Vorgang abgebrochen"
            }))
            return
        }
        
        // if there are no errors from above, we can send the data back to the original callback and hanndle it from there
        $("#box").hide();
        $.post('http://ali_namechange/join', JSON.stringify({
            vorname: inputValue,
            nachname: inputValue2,
            
        }));
      //  $("body").hide();
    })

   





