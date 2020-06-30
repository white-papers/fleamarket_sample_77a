document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {
      Payjp.setPublicKey("pk_test_55a26013fc6f9309d8ee2052"); 
      let btn = document.getElementById("token_submit"); 
      btn.addEventListener("click", e => { 
        e.preventDefault(); 
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
            $("#inputForm").append(
              $(`<input type="hidden" name="payjp-token" value="${response.id}">`)
            );
            $("#inputForm").get(0).submit();
            alert("登録が完了しました"); 
          } else {
            alert("カード情報が正しくありません。"); 
          }
        });
      });
    }
  },
  false
);