const pay = () => {
  Payjp.setPublicKey("pk_test_1d7870349c3934e2a0fcd3ef");
  console.log("カード情報トークン化のためのJavaScript");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("order[number]");
      document.getElementById("card-cvc").removeAttribute("order[cvc]");
      document.getElementById("card-exp-month").removeAttribute("order[exp_month]");
      document.getElementById("card-exp-year").removeAttribute("order[exp_year]");
    
      document.getElementById("charge-form").submit();
    });
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);