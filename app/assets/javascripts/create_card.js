$(document).on('turbolinks:load', function() {
  var form = $("#inputForm"); //id”charge-form”のものをformに代入します。
  Payjp.setPublicKey('pk_test_55a26013fc6f9309d8ee2052'); //公開鍵を直書き、して参照できる様にします。
  $(document).on("click", "#token_submit", function(e) { //eが押されたときに作動します。
    e.preventDefault(); //まずrailsの処理を止めて、jsの処理を先に行います。
    let card = {
      number: document.getElementById("card_number").value,
      cvc: document.getElementById("payment_card_cvc").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: document.getElementById("exp_year").value
    }; 
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#payment_card_cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); 
        form.append(
          $(`<input type="hidden" name="payjp-token" value="${response.id}">`)
        );
        form.get(0).submit();
        alert("登録が完了しました"); 
      } else {
        alert("カード情報が正しくありません。"); 
      }
    });
  });
});





