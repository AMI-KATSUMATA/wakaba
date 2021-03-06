// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//
//= require jquery
//= require rails-ujs
//= require activestorage
//=require turbolinks
//= require_tree .
/*global $*/

// スライダー
$(document).on('turbolinks:load', function () {
  $('.slider').slick({
  autoplay: true,
  infinite: true,
  autoplaySpeed: 2000,
  loop: true,
  dots: true,
　arrows: true,
  speed: 500,
  slidesToShow: 3,
  slidesToScroll: 1,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        dots: true,
      　arrows: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,
        arrows: true
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
      }
    }
    ]
  });
});

// ハンバーガーアイコン
$(document).on('turbolinks:load', function () {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
});

// タブメニュー
$(document).on('turbolinks:load', function () {
  $('#tab-contents .tab[id != "tab1"]').hide();

  $('#tab-menu a').on('click', function(event) {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
});

// フェードイン

// 左
$(document).on('turbolinks:load', function () {
  //画面をスクロールするとイベントが発動する
  $(window).scroll(function() {

    //フェードインさせたい要素の位置をずらす
    $('.fadein-l').css({
      'opacity': '0',
      'transform': 'translateX(-30px)'
    });

    //スクロールバーの位置を取得
    var scroll = $(window).scrollTop();

    //ウィンドウの高さを取得
    var windowHeight = $(window).height();

    $('.fadein-l').each(function() {
      //フェードインさせたい要素の縦位置を取得
      var elemPos = $(this).offset().top;

      //要素がウィンドウの中に入ってから200pxスクロールしたら要素をフェードインする
      if (scroll > elemPos - windowHeight + 200) {
        $(this).css({
          'opacity': '1',
          'transform': 'translateX(0)'
        });
      }
    });
  });
});

// 右
$(document).on('turbolinks:load', function () {
  //画面をスクロールするとイベントが発動する
  $(window).scroll(function() {

    //フェードインさせたい要素の位置をずらす
    $('.fadein-r').css({
      'opacity': '0',
      'transform': 'translateX(30px)'
    });

    //スクロールバーの位置を取得
    var scroll = $(window).scrollTop();

    //ウィンドウの高さを取得
    var windowHeight = $(window).height();

    $('.fadein-r').each(function() {
      //フェードインさせたい要素の縦位置を取得
      var elemPos = $(this).offset().top;

      //要素がウィンドウの中に入ってから200pxスクロールしたら要素をフェードインする
      if (scroll > elemPos - windowHeight + 200) {
        $(this).css({
          'opacity': '1',
          'transform': 'translateX(0)'
        });
      }
    });
  });
});

