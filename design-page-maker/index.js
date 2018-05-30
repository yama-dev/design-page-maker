'use strict';

let fs   = require('fs');
let path = require('path');
let opn  = require('opn');

var pjson = require('../design-page-maker.config.json');

let htmlList     = require('./view/template.list.js');
let htmlDetail   = require('./view/template.detail.js');
let htmlStyle    = require('./view/template.style.js');

let htmlJsQrcode = require('./view/qrcode.min.js'); // License https://github.com/davidshimjs/qrcodejs

// Set Design directry
let _dir = 'design/';
if(process.argv[2]){
  _dir = process.argv[2];
}

class APP {

  constructor() {
    let _that = this;

    this.CONFIG = {
      pathArray : []
    }

    this.getFiles(_dir);
    this.makeHtml(this.CONFIG.pathArray);
  }

  getFiles(dir){
    let _that = this;

    let files = fs.readdirSync(dir);

    files.forEach(function(file){ 

      var fullPath = path.join(dir, file);

      var stats = fs.statSync(fullPath)

      if(stats.isDirectory()){

        _that.getFiles(fullPath);

      } else {

        if(stats.size > 5 * 1000 * 1000){
          console.log(fullPath + " -> 画像の容量が大きすぎます");
          process.exit(1);
        }

        if(fs.statSync(fullPath).isFile() && /.*\.(jpg|png|gif)$/.test(fullPath)){

          fullPath = fullPath.replace(/\\/g,'/');
          fullPath = fullPath.replace(_dir,'');
          _that.CONFIG.pathArray.push(fullPath.replace(_dir,''));

        }
      }
    });
  }

  makeHtml(path){
    this.outputHtml(htmlList.get(path, pjson.config.title, pjson.config));
  }

  outputHtml(html){

    if(html){
      fs.writeFile(_dir + 'index.html', html, (error) => {
        if(error){
          console.log(error);
          process.exit(1);
        }
      });
      fs.writeFile(_dir + 'detail.html', htmlDetail, (error) => {
        if(error) console.log(error);
      });
      fs.writeFile(_dir + 'design-page-maker.css', htmlStyle, (error) => {
        if(error) console.log(error);
      });
      fs.writeFile(_dir + 'qrcode.min.js', htmlJsQrcode, (error) => {
        if(error) console.log(error);
      });
    } else {
      console.log('ERROR');
      process.exit(1);
    }

    // Open Browser.
    opn(__dirname + '/../' + _dir + 'index.html', {app: 'chrome'});
  }

}
new APP();
