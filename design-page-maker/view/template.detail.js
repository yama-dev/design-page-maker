module.exports = `<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title></title>
  <style type="text/css">
  * { margin:0px; padding:0px; border:0px; font-size:12px; }
  .wrapper{ width:1300px; margin:0 auto; }
  </style>
</head>
<body onContextmenu="return false">
<section class="wrapper" align="center">
	<div class="design__image"><a href="./"><img src="" alt=""></a></div>
</section>
<script>
var url = window.location.href;
var searchUrl = location.search.replace('?image=','');
var filename_ex = url.match(".+/(.+?)([\?#;].*)?$")[1];
var filename = url.match(".+/(.+?)\.[a-z]+([\?#;].*)?$")[1];
document.querySelector('.design__image a img').setAttribute('src',searchUrl);
</script>
</body>
</html>`;
