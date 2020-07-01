document.addEventListener("turbolinks:load", function() {
  $(function(){
    // 一覧表示されている商品にカーソルを乗せると色が変わる
    $('.list').hover(function(){
      $(this).css('opacity', '0.6');
    },
    function(){
      $(this).css('opacity', '1');
    });

    // main-bottomクラスのボタンにカーソルを載せると色が変わる
    $('.content__btn--app-btn').hover(function(){
      $(this).css('opacity', '0.7');
    },
    function(){
      $(this).css('opacity', '1');
    });

    // main-bottomクラスのボタンにカーソルを載せると色が変わる
    $('.content__btn--google-btn').hover(function(){
      $(this).css('opacity', '0.7');
    },
    function(){
      $(this).css('opacity', '1');
    });

    // footerのリストにカーソルを載せると下線が追加される
    $('.content__lists__list').hover(function(){
      $(this).css('text-decoration', 'underline');
    },
    function(){
      $(this).css('text-decoration', 'none');
    });

    // 出品ボタンにカーソルを乗せると色が変わる
    $('.exhibition-btn').hover(function(){
      $(this).css('background-color', '#0fdee6');
    },
    function(){
      $(this).css('background-color', '#3CCACE');
    });

    // middleクラスのボタンにカーソルを押せると色が変わる
    $('.app-btn').hover(function(){
      $(this).css('opacity', '0.7');
    },
    function(){
      $(this).css('opacity', '1');
    });

    // middleクラスのボタンにカーソルを押せると色が変わる
    $('.google-btn').hover(function(){
      $(this).css('opacity', '0.7');
    },
    function(){
      $(this).css('opacity', '1');
    });

  });
})