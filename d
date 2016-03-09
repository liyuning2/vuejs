[1mdiff --git a/APublicResourceFolder/style.css b/APublicResourceFolder/style.css[m
[1mindex 496fb3f..ff629ef 100644[m
[1m--- a/APublicResourceFolder/style.css[m
[1m+++ b/APublicResourceFolder/style.css[m
[36m@@ -35,7 +35,9 @@[m [mfooter {[m
 }[m
 #copyright .container .row:first-child div{[m
     height: 100%;[m
[31m-    line-height: 500%;[m
[32m+[m[32m    display: flex;[m
[32m+[m[32m    align-items: center;[m
[32m+[m[32m    justify-content: center;[m
 }[m
 #copyright .container .row:first-child div:first-child{[m
     border-right: 1px solid #eeeeee;[m
[36m@@ -44,18 +46,18 @@[m [mfooter {[m
     border-bottom:1px solid #eeeeee;[m
 }[m
 #copyright .container .row:last-child{[m
[32m+[m[32m    display: flex;[m
[32m+[m[32m    align-items:center;[m
[32m+[m[32m    justify-content:center;[m[41m    [m
     height:20%;[m
 }[m
 #copyright .container #controller div{[m
     height:100%;[m
     display: flex;[m
     align-items:center;[m
[31m-}[m
[31m-#copyright .container #controller div i{[m
[31m-    margin:0 auto;[m
[32m+[m[32m    justify-content:center;[m
 }[m
 #copyright .container .row:last-child small{[m
[31m-    margin:0 auto;[m
     transform: scale(0.6);[m
 }[m
 #copyright .container .row input {[m
[1mdiff --git a/entry.js b/entry.js[m
[1mindex 51d4e1d..cfa6122 100644[m
[1m--- a/entry.js[m
[1m+++ b/entry.js[m
[36m@@ -53,28 +53,34 @@[m [mvar header = new Vue({[m
 var copyright = new Vue({[m
     el: "#copyright",[m
     data: {[m
[32m+[m[32m        switchMode: true,[m
         plus: getIco('plus'),[m
         minus: getIco('minus'),[m
         placeholder: 'Temp',[m
         temperature: '',[m
[31m-        positve: '',[m
[31m-        negative: '',[m
[32m+[m[32m        pending: '',[m
[32m+[m[32m        power: true,[m
     },[m
     methods: {[m
         tapPlusContorller: function() {[m
             this.initNumber();[m
[31m-            this.positve --;[m
[32m+[m[32m            30 > this.pending && this.pending ++;[m
         },[m
         tapMinusContorller: function() {[m
             this.initNumber();[m
[31m-            this.negative --;[m
[32m+[m[32m            0 < this.pending && this.pending --;[m
         },[m
         initNumber: function() {[m
[31m-            if (0 == this.positve.length) {[m
[31m-                this.positve = 0;[m
[32m+[m[32m            if (0 == this.pending.length) {[m
[32m+[m[32m                this.pending = 0;[m
             }[m
[31m-            if (0 == this.negative.length) {[m
[31m-                this.negative = 0;[m
[32m+[m[32m        },[m
[32m+[m[32m        switchModes: function() {[m
[32m+[m[32m            if (this.props && this.props.attr && 'power' == this.props.attr) {[m
[32m+[m[32m                this.switchMode = true;[m
[32m+[m[32m            }[m
[32m+[m[32m            if (this.props && this.props.attr && 'mode' == this.props.attr) {[m
[32m+[m[32m                this.switchMode = false;[m
             }[m
         }[m
     }[m
[1mdiff --git a/index.html b/index.html[m
[1mindex a4196c9..ae1efd7 100644[m
[1m--- a/index.html[m
[1m+++ b/index.html[m
[36m@@ -39,20 +39,20 @@[m
     <footer id="copyright" class="text-center col-xs-12">[m
         <div class="container">[m
             <div class="row">[m
[31m-                <div class="col-xs-6 text-center text-danger">[m
[32m+[m[32m                <div class="col-xs-6 text-center" attr="power" v-bind:class="[switchMode ? text-danger : '']" v-on:click="switchModes">[m
                     Power[m
                 </div>[m
[31m-                <div class="col-xs-6 text-center">[m
[32m+[m[32m                <div class="col-xs-6 text-center" attr="mode" v-bind:class="[!switchMode ? text-danger : '']" v-on:click="switchModes">[m
                     Mode[m
                 </div>[m
             </div>[m
[31m-            <div class="row" id="controller">[m
[32m+[m[32m            <div class="row" id="controller" v-if="power">[m
                 <div class="col-xs-3 text-center" v-on:click="tapMinusContorller">[m
                     <i class="iconfont">{{{ minus }}}</i>[m
                 </div>[m
                 <div class="col-xs-6 text-center">[m
                     <input class="col-xs-12" placeholder="{{ placeholder }}" [m
[31m-                        value="{{ 0 <= positve + negative ?  30 >= positve + negative ? positve + negative : 30 :  0}}" [m
[32m+[m[32m                        value="{{ pending }}"[m[41m [m
                     disabled/>[m
                 </div>[m
                 <div class="col-xs-3 text-center" v-on:click="tapPlusContorller">[m
[36m@@ -65,5 +65,4 @@[m
         </div>[m
     </footer>[m
 </body>[m
[31m-</html>[m
[31m-[m
[32m+[m[32m</html>[m
\ No newline at end of file[m
