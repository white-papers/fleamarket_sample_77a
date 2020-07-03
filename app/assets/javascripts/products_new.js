$(document).on('turbolinks:load', function(){
  $(function(){

    //プレビューのhtmlを定義
    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <label class="edit_btn">編集</label>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    // 投稿編集時
    //=============================================================================
    //products/:i/editページへリンクした際のアクション
    if (window.location.href.match(/\/products\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      //プレビューにidを追加
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      //プレビューが5あるときは、投稿ボックスを消しておく
      if (count == 5) {
        $('.label-content').hide();
      }
    }
    //=============================================================================

    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    // プレビューの追加
    $(document).on('change', '.hidden-field', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.label-content').hide();
        }

        //=============================================================================
        //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す
        if ($(`#product_images_attributes_${id}__destroy`)){
          $(`#product_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        //=============================================================================

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          $('.label-box').attr({id: `label-box--${count}`,for: `product_images_attributes_${count}_image`});
        }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      //新規登録時と編集時の場合分け==========================================================
      //新規投稿時
      //削除用チェックボックスの有無で判定
      if ($(`#product_images_attributes_${id}__destroy`).length == 0) {
        //フォームの中身を削除 
        $(`#product_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});

        }
      } else {

        //投稿編集時
        $(`#product_images_attributes_${id}__destroy`).prop('checked',true);
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `product_images_attributes_${id}_image`});
        }
      }
      //=============================================================================
    });
  });
});




// 没コード

// $(function () {
//   // # プレビュー機能
//     // # 'change'イベントでは$(this)で要素が取得できないため、 'click'イベントを入れました。
//     // # これにより$(this)で'input'を取得することができ、inputの親要素である'li'まで辿れます。
//   $(document).on('click', '.image_upload', function () {
//     // # inputの要素はクリックされておらず、inputの親要素であるdivが押されています。
//     // # divのクラス名をclickした時にイベントが作動
//     // # div（this）から要素を辿ればinputを指定可能
//     // # $liに追加するためのプレビュー画面のHTML
//     var preview = $(`<div class="image-preview__wapper">
//                       <img class="preview">
//                     </div>
//                     <div class="image-preview_btn">
//                       <div class="image-preview_btn_delete"> 削除
//                       </div>
//                     </div>`);
//     // # 次の画像を読み込むためのinput
//     var append_input = $(`<li class="input">
//                             <label class="upload-label">
//                               <div class="upload-label__text">
//                                 <i class="fa fa-camera fa-4x"></i>
//                                   <div class="input-area display-none">
//                                     <input class="hidden image_upload" type="file">
//                                   </div>
//                               </div>
//                             </label>
//                           </li>`)
//     $ul = $('#previews')
//     $li = $(this).parents('li');
//     $label = $(this).parents('.upload-label');
//     $inputs = $ul.find('.image_upload');

//     // # inputに画像を読み込んだら、"プレビューの追加"と"新しいli追加"処理が動きます。
//     $('.image_upload').on('change', function (e) {
//       // # inputで選択した画像を読み込みます。
//       var reader = new FileReader();
//       // # プレビューに追加させるために、inputから画像ファイルを読み込みます。
//       reader.readAsDataURL(e.target.files[0]);
//       // # 画像ファイルが読み込んだら、処理が実行されます。 
//       reader.onload = function (e) {
//         // # previewをappendで追加する前に、プレビューできるようにinputで選択した画像を<img>に'src'で付与させます。
//         // # つまり、<img>タグに画像を追加させます。
//         $(preview).find('.preview').attr('src', e.target.result);
//       }
//       // # inputの画像を付与した,previewを$liに追加します。
//       $li.append(preview);
//       // # 生成したliの横幅を決めます。
//       $('#previews li').css({
//         'width': `80px`
//       })

//       // # プレビュー完了後は、inputを非表示にさせます。これによりプレビューだけが残ります。
//       $label.css('display', 'none'); //# inputを非表示にします。
//       $li.removeClass('input');     //# inputのクラスはjQueryで数を数える時に邪魔なので除去します。
//       $li.addClass('image-preview'); //# inputのクラスからプレビュー用のクラスに変更しました、
//       $lis = $ul.find('.image-preview'); //# クラス変更が完了したところで、プレビューの数を数えます。 
//       //# 画像が9枚以内なら文字とインプットを追加させます。
//       if ($lis.length < 5) {
//         $ul.append(append_input)
//         $('#previews li:last-child').css({
//           'width': `80px`
//         })
//       }
//       // # inputの最後の"data-image"を取得して、input nameの番号を更新させています。
//       // # これをしないと、それぞれのinputの区別ができず、最後の1枚しかDBに保存されません。
//       // # 全部のプレビューの番号を更新することで、プレビューを削除して、新しく追加しても番号が1,2,3,4,5,6と綺麗に揃います。そのため、全部の番号を更新させます。
//       $inputs.each(function (num, input) {
//         // # nameの番号を更新するために、現在の番号を除去します。
//         $(input).removeAttr('name');
//         $(input).attr({
//           name: "product[images_attributes][" + num + "][image]",
//           id: "images_attributes_" + num + "_image"
//         });
//       });

//     });
//   });

//   // # 削除ボタンをクリックしたとき、処理が動きます。
//   $(document).on('click', '.image-preview_btn_delete', function () {
//     var append_input = $(`<li class="input">
//                             <label class="upload-label">
//                               <div class="upload-label__text">
//                                 <i class="fa fa-camera fa-4x"></i>
//                                 <div class="input-area display-none">
//                                   <input class="hidden image_upload" type="file">
//                                 </div>
//                               </div>
//                             </label>
//                           </li>`)
//     $ul = $('#previews')
//     $lis = $ul.find('.image-preview');
//     $li = $(this).parents('.image-preview');
//     // # "li"ごと削除して、previewとinputを削除させます。
//     $li.remove();
//     $lis = $ul.find('.image-preview'); //# クラス変更が完了したところで、プレビューの数を数えます。 
//     //# 画像が10枚以内なら文字とインプットを追加させます
//     if ($lis.length == 4) {
//       $ul.append(append_input)
//     }
//     $('#previews li:last-child').css({
//       'width': `80px`
//     })
//   });
// });

