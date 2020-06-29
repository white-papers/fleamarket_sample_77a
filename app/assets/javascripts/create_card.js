window.addEventListener('DOMContentLoaded', function(){

  let submit = document.getElementById("token_submit");

  Payjp.setPublicKey('pk_test_55a26013fc6f9309d8ee2052');

    submit.addEventListener('click', function(e){

    e.preventDefault(); 

    let card = { 
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("payment_card_cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
    };

    Payjp.createToken(card, function(status, response) {  
      if (status === 200) { 
      
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name"); 
        $("#charge-form").append(
          $(`<input type="hidden" name="payjp-token" value="${response.id}">`)
        ); 
        $("#inputForm").get(0).submit();
        alert("登録が完了しました"); 
      } else {
        alert("カード情報が正しくありません。"); 
      }
    });
  });
});