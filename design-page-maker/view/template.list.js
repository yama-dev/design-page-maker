'use strict';

module.exports.get = function(design, title, config){

  let _title = typeof title !== 'undefined' ?  title : 'デザイン案';

  let _html = `<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0">
  <meta name="generator" content="@yama-dev/design-page-maker">
  <title>${config.title}</title>
  <link rel="stylesheet" href="./design-page-maker.css">
  <script src="./qrcode.min.js"></script>
</head>
<body>
<header class="header">
  <h1>${config.title}</h1>
  <div class="guidance">${config.description}</div>
  <div id="qrcode">
    QRコード<br>
    <script type="text/javascript">
    new QRCode(document.getElementById("qrcode"), {
      text: location.href, width: 128, height: 128
    });
    </script>
  </div>
</header>
`;

_html += `
<section class="contentsCover">
  <div class="date">2018.01.01</div>
  <h2>デザイン案</h2>
`;

  for (var i = 0; i < design.length; ++i) {
    if(i % 3 == 0){
      _html += '  <ul class="contents__list">\n';
    }
    _html += `    <li class="has-image">
      <div class="caption">
        <table>
          <tr><td class="table__item-left">デバイス</td><td>PC</td></tr>
          <tr>
            <td class="table__item-left">補足</td>
            <td>
              <ul>
                <li>・デザイン案の特徴を記入します</li>
              </ul>
            </td>
          </tr>
        </table>
      </div>
      <div class="thumb"><a href="./detail.html?image=${design[i]}"><img src="${design[i]}" alt="design image ${i+1}"></a></div>
    </li>\n`;
    if(i % 3 == 2){
      _html += '  </ul>\n';
    }
  }
  if(design.length % 3 != 0){
    for (var i = 0; i < (3 - (design.length % 3)); ++i) {
      _html += `<li></li>\n`;
    }
    _html += '  </ul>\n';
  }

_html += `
</section>
</body>
</html>
`;

  return _html;
}
