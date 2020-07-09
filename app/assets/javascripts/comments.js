document.addEventListener("turbolinks:load", function() {
  $(function(){
    // 新規コメント表示用・自分のコメント復元用 
      function new_comment(comment_data){
        var HTML_content_time = 
          `
          <div class="comment_Me comment_one_block" data-index=${comment_data.id}>
            <div class="comment_content">
              ${comment_data.comment}
              <div class="comment_create_at">
                ${comment_data.created_at}
              </div>
          `
        var HTML_deleteBtn =  
            `
            <div class="comment_delete me_pre_delete" data-index=${comment_data.id}>
              <a rel="nofollow" data-method="patch" href="/comments/${comment_data.id}">削除する</a>
            </div>
            `
        var HTML_nickname =
            `
            </div>
            <div class="comment_user_name">
              ${comment_data.user_nickname}
            `
        var HTML_sellerMark =
            `
              <div class="seller_display">
              出品者
              </div>
            `
        var HTML_endDiv =
          `
            </div>
          </div> 
          `
        if (comment_data.product_exhibitor.id == comment_data.user_id){
            // 出品者とコメントしたユーザーが等しい場合
          var html = HTML_content_time + HTML_deleteBtn + HTML_nickname + HTML_sellerMark + HTML_endDiv
        }else{
          // 出品者とコメントしたユーザーが異なる場合
          var html = HTML_content_time + HTML_nickname + HTML_endDiv
              };
    
        return html;
      };

    // 他人のコメント復元用 
      function restore_other_comment(comment_data){
        var html = 
        `
        <div class="comment_Other comment_one_block" data-index=${comment_data.id}>
          <div class="comment_user_name">
          ${comment_data.user_nickname}
          </div>
    
          <div class="comment_content_other">
            ${comment_data.comment}
            <div class="comment_create_at">
              ${comment_data.created_at}
            </div>
            <div class="comment_delete other_pre_delete" data-index=${comment_data.id}>
              <a rel="nofollow" data_method="patch" href="/comments/${comment_data.id}">削除する</a>
            </div>
          </div>
        </div>
        `
      return html;
      };
    
    // 仮削除表示用
    function PLEdelete(index){
      var html = 
      `
      出品者によりこのコメントは削除されました。
      <div class="comment_restore" data-index=${index}>
        <a href="/comments/${index}/restore">復元する</a>
      </div>
      <div class="comment_delete complete_delete" data-index=${index}>
        <a class="complete_delete" rel="nofollow" data-method="delete" href="/comments/${index}">完全に削除する</a>
      </div>
      `
    
    return html;
    };
    
    // コメント作成した場合
      $('.new_comment').on('submit', function(e){
        e.preventDefault()
        var formData = new FormData(this);
        var url = $(this).attr('action');
        $.ajax({
          url: url,
          type: "POST",
          data: formData,
          dataType: 'json',
          processData: false,
          contentType: false
        })
      .done(function(comment_data){
        var html = new_comment(comment_data);
        $(".comment_list").append(html)
        $('#comment_body').val("");
        $('.comment_list').animate({ scrollTop: $('.comment_list')[0].scrollHeight});
      })
      .fail(function() {
        alert("メッセージの送信に失敗しました");
      });
    });
    
    // 復元した場合
    $(".comment_list").on('click',".comment_restore",function(e){
      e.preventDefault()
      var index = $(this).data("index")
      var url =`/comments/${index}/restore`
      $.ajax({
        url: url,
        type: "get",
        dataType: 'json',
      })
      .done(function(comment_data){
        if (comment_data.product_exhibitor.id == comment_data.user_id){   // 出品者とコメントユーザーが同じ場合
          var html = new_comment(comment_data);
          $(`.comment_one_block[data-index=${index}]`).replaceWith(html)
        }else{    // 出品者とコメントユーザーが異なる場合
          var html = restore_other_comment(comment_data);
          $(`.comment_one_block[data-index=${index}]`).replaceWith(html)
        }
      })
      .fail(function() {
        alert("メッセージの送信に失敗しました");
      });
    });
    
    
    // 自分のコメントを仮削除した場合
    $(".comment_list").on('click',".me_pre_delete",function(e){
      e.preventDefault()
      var index = $(this).data("index");
      var content =  $(`.comment_one_block[data-index=${index}]`).find(".comment_content");
      content.empty();
      content.append(PLEdelete(index));
    });
    
    // 他人のコメントを仮削除した場合
    $(".comment_list").on('click',".other_pre_delete",function(e){
    e.preventDefault()
    var index = $(this).data("index");
    var content =  $(`.comment_one_block[data-index=${index}]`).find(".comment_content_other");
    content.empty();
    content.append(PLEdelete(index));
    });
    
    // 完全削除した場合
    $(".comment_list").on('click','.complete_delete',function(e){
      e.preventDefault()
      var index = $(this).data("index");
      $(`.comment_one_block[data-index=${index}]`).remove();
    });
  })
})
