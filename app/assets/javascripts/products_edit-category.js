// 親カテゴリを変更するとjQueryが発火
document.addEventListener("turbolinks:load", function() {
  $(function(){
    $("#parent_category_field-edit").change(function () {
      function build_childSelect() {
        let child_select = `
                  <select name="" class="child_category-edit" required="required">
                    <option value=""> 選択してください </option>
                  </select>
                  `
        return child_select;
      }

      // selectタグにoptionタグを追加
      function build_Option(children) {
        let option_html = `
                          <option value=${children.id}>${children.name}</option>
                          `
        return option_html;
    }

      // 選択したoption(親カテゴリの値)を取得しparentValueに格納
      let parentValue = $("#parent_category_field-edit").val();
      // 初期値0("選択してください")以外を選択したらajax開始
      if (parentValue.length != 0) {
        $.ajax({
          url: '/products/search',
          type: 'GET',
          // productsコントローラーに paramsをparent_id で送る
          data: { parent_id: parentValue },
          dataType: 'json'
        })

          .done(function (data) {
            // 既に子カテゴリがある場合は削除
            $(".child_category-edit").remove();
            // 既に孫カテゴリがある場合は孫カテゴリも削除
            $(".grandchild_category-edit").remove();
            // build_childSelectを実行し selectタグを生成してビューにappend
            let child_select = build_childSelect
            $("#child_category_field-edit").append(child_select);
            // jbuilderから取得したデータを1件ずつoptionタグにappend
            data.forEach(function (d) {
              let option_html = build_Option(d)
              $(".child_category-edit").append(option_html);
            })
          })
          .fail(function () {
            alert("error:子カテゴリーの取得に失敗しました");
          });
      }
    });


    // 子カテゴリを変更するとjQueryが発火
    $(document).on("change", ".child_category-edit", function () {
      function build_grandchildSelect() {
        let grandchild_select = `
                  <select name="product[category_id]" class="grandchild_category-edit" required="required">
                    <option value=""> 選択してください </option>
                  </select>
                  `
        return grandchild_select;
      }
      // selectタグにoptionタグを追加
      function build_Option(grandchildren) {
        let option_html = `
                          <option value=${grandchildren.id}>${grandchildren.name}</option>
                          `
        return option_html;
    }

      // 選択したoption(子カテゴリの値)を取得しparentValueに格納
      let childValue = $(".child_category-edit").val();
      // 初期値0("選択してください")以外を選択したらajax開始
      if (childValue.length != 0) {
        $.ajax({
          url: '/products/search',
          type: 'GET',
          // productsコントローラーに paramsをchildren_id で送る
          data: { children_id: childValue },
          dataType: 'json'
        })

          .done(function (data) {
            // 既に孫カテゴリがある場合は削除
            $(".grandchild_category-edit").remove();
            // build_grandchildSelectを実行し selectタグを生成してビューにappend
            let grandchild_select = build_grandchildSelect
            $("#grandchild_category_field-edit").append(grandchild_select);
            // jbuilderから取得したデータを1件ずつoptionタグにappend
            data.forEach(function (grandchild_d) {
              let option_html = build_Option(grandchild_d)
              $(".grandchild_category-edit").append(option_html);
            })
          })
          .fail(function () {
            alert("error:孫カテゴリーの取得に失敗しました");
          });
      }
    });
  });
})
