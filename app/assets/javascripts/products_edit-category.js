// $(document).on('turbolinks:load', function(){
//   $(function(){

//     //プレビューのhtmlを定義
//     function buildHTML(count) {
//       var html = `<div class="preview-box" id="preview-box__${count}">
//                     <div class="upper-box">
//                       <img src="" alt="preview">
//                     </div>
//                     <div class="lower-box">
//                       <div class="update-box">
//                         <label class="edit_btn">編集</label>
//                       </div>
//                       <div class="delete-box" id="delete_btn_${count}">
//                         <span>削除</span>
//                       </div>
//                     </div>
//                   </div>`
//       return html;
//     }

//     // 投稿編集時
//     //items/:i/editページへリンクした際のアクション=======================================
//     if (window.location.href.match(/\/items\/\d+\/edit/)){
//       //登録済み画像のプレビュー表示欄の要素を取得する
//       var prevContent = $('.label-content').prev();
//       labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
//       $('.label-content').css('width', labelWidth);
//       //プレビューにidを追加
//       $('.preview-box').each(function(index, box){
//         $(box).attr('id', `preview-box__${index}`);
//       })
//       //削除ボタンにidを追加
//       $('.delete-box').each(function(index, box){
//         $(box).attr('id', `delete_btn_${index}`);
//       })
//       var count = $('.preview-box').length;
//       //プレビューが5あるときは、投稿ボックスを消しておく
//       if (count == 5) {
//         $('.label-content').hide();
//       }
//     }
//     //=============================================================================

//     // ラベルのwidth操作
//     function setLabel() {
//       //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
//       var prevContent = $('.label-content').prev();
//       labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
//       $('.label-content').css('width', labelWidth);
//     }

//     // プレビューの追加
//     $(document).on('change', '.hidden-field', function() {
//       setLabel();
//       //hidden-fieldのidの数値のみ取得
//       var id = $(this).attr('id').replace(/[^0-9]/g, '');
//       //labelボックスのidとforを更新
//       $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
//       //選択したfileのオブジェクトを取得
//       var file = this.files[0];
//       var reader = new FileReader();
//       //readAsDataURLで指定したFileオブジェクトを読み込む
//       reader.readAsDataURL(file);
//       //読み込み時に発火するイベント
//       reader.onload = function() {
//         var image = this.result;
//         //プレビューが元々なかった場合はhtmlを追加
//         if ($(`#preview-box__${id}`).length == 0) {
//           var count = $('.preview-box').length;
//           var html = buildHTML(id);
//           //ラベルの直前のプレビュー群にプレビューを追加
//           var prevContent = $('.label-content').prev();
//           $(prevContent).append(html);
//         }
//         //イメージを追加
//         $(`#preview-box__${id} img`).attr('src', `${image}`);
//         var count = $('.preview-box').length;
//         //プレビューが5個あったらラベルを隠す 
//         if (count == 5) { 
//           $('.label-content').hide();
//         }

//         //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す=============
//         if ($(`#item_images_attributes_${id}__destroy`)){
//           $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
//         } 
//         //=============================================================================

//         //ラベルのwidth操作
//         setLabel();
//         //ラベルのidとforの値を変更
//         if(count < 5){
//           $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
//         }
//       }
//     });

//     // 画像の削除
//     $(document).on('click', '.delete-box', function() {
//       var count = $('.preview-box').length;
//       setLabel(count);
//       var id = $(this).attr('id').replace(/[^0-9]/g, '');
//       $(`#preview-box__${id}`).remove();

//       //新規登録時と編集時の場合分け==========================================================

//       //新規投稿時
//       //削除用チェックボックスの有無で判定
//       if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
//         //フォームの中身を削除 
//         $(`#item_images_attributes_${id}_image`).val("");
//         var count = $('.preview-box').length;
//         //5個めが消されたらラベルを表示
//         if (count == 4) {
//           $('.label-content').show();
//         }
//         setLabel(count);
//         if(id < 5){
//           $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

//         }
//       } else {

//         //投稿編集時
//         $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
//         //5個めが消されたらラベルを表示
//         if (count == 4) {
//           $('.label-content').show();
//         }

//         //ラベルのwidth操作
//         setLabel();
//         //ラベルのidとforの値を変更
//         //削除したプレビューのidによって、ラベルのidを変更する
//         if(id < 5){
//           $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
//         }
//       }
//       //=============================================================================
//     });
//   });
// });




// // 没コード

// // // 親カテゴリを変更するとjQueryが発火
// // document.addEventListener("turbolinks:load", function() {
// //   $(function(){
// //     $("#parent_category_field-edit").change(function () {
// //       function build_childSelect() {
// //         let child_select = `
// //                   <select name="" class="child_category-edit" required="required">
// //                     <option value=""> 選択してください </option>
// //                   </select>
// //                   `
// //         return child_select;
// //       }

// //       // selectタグにoptionタグを追加
// //       function build_Option(children) {
// //         let option_html = `
// //                           <option value=${children.id}>${children.name}</option>
// //                           `
// //         return option_html;
// //     }

// //       // 選択したoption(親カテゴリの値)を取得しparentValueに格納
// //       let parentValue = $("#parent_category_field-edit").val();
// //       // 初期値0("選択してください")以外を選択したらajax開始
// //       if (parentValue.length != 0) {
// //         $.ajax({
// //           url: '/products/search',
// //           type: 'GET',
// //           // productsコントローラーに paramsをparent_id で送る
// //           data: { parent_id: parentValue },
// //           dataType: 'json'
// //         })

// //           .done(function (data) {
// //             // 既に子カテゴリがある場合は削除
// //             $(".child_category-edit").remove();
// //             // 既に孫カテゴリがある場合は孫カテゴリも削除
// //             $(".grandchild_category-edit").remove();
// //             // build_childSelectを実行し selectタグを生成してビューにappend
// //             let child_select = build_childSelect
// //             $("#child_category_field-edit").append(child_select);
// //             // jbuilderから取得したデータを1件ずつoptionタグにappend
// //             data.forEach(function (d) {
// //               let option_html = build_Option(d)
// //               $(".child_category-edit").append(option_html);
// //             })
// //           })
// //           .fail(function () {
// //             alert("error:子カテゴリーの取得に失敗しました");
// //           });
// //       }
// //     });


// //     // 子カテゴリを変更するとjQueryが発火
// //     $(document).on("change", ".child_category-edit", function () {
// //       function build_grandchildSelect() {
// //         let grandchild_select = `
// //                   <select name="product[category_id]" class="grandchild_category-edit" required="required">
// //                     <option value=""> 選択してください </option>
// //                   </select>
// //                   `
// //         return grandchild_select;
// //       }
// //       // selectタグにoptionタグを追加
// //       function build_Option(grandchildren) {
// //         let option_html = `
// //                           <option value=${grandchildren.id}>${grandchildren.name}</option>
// //                           `
// //         return option_html;
// //     }

// //       // 選択したoption(子カテゴリの値)を取得しparentValueに格納
// //       let childValue = $(".child_category-edit").val();
// //       // 初期値0("選択してください")以外を選択したらajax開始
// //       if (childValue.length != 0) {
// //         $.ajax({
// //           url: '/products/search',
// //           type: 'GET',
// //           // productsコントローラーに paramsをchildren_id で送る
// //           data: { children_id: childValue },
// //           dataType: 'json'
// //         })

// //           .done(function (data) {
// //             // 既に孫カテゴリがある場合は削除
// //             $(".grandchild_category-edit").remove();
// //             // build_grandchildSelectを実行し selectタグを生成してビューにappend
// //             let grandchild_select = build_grandchildSelect
// //             $("#grandchild_category_field-edit").append(grandchild_select);
// //             // jbuilderから取得したデータを1件ずつoptionタグにappend
// //             data.forEach(function (grandchild_d) {
// //               let option_html = build_Option(grandchild_d)
// //               $(".grandchild_category-edit").append(option_html);
// //             })
// //           })
// //           .fail(function () {
// //             alert("error:孫カテゴリーの取得に失敗しました");
// //           });
// //       }
// //     });
// //   });
// // })
