require('./APublicResourceFolder/bootstrap-3.3.5-dist/css/bootstrap.min.css');
require('./APublicResourceFolder/ie-bug-fix/ie8-bug.css');
// require('./APublicResourceFolder/sns/iconfont.css');
require('./APublicResourceFolder/weather/iconfont.css');
require('./APublicResourceFolder/ie-bug-fix/ie10-viewport-bug-workaround.js');
require('./APublicResourceFolder/html5shiv/html5shiv.min.js');
require('./APublicResourceFolder/style.css');
// require('./APublicResourceFolder/respond/respond.min.js');
// require('./APublicResourceFolder/holder/holder.min.js');
// require('./APublicResourceFolder/bxslider/jquery.bxslider.min.js');
// require('./APublicResourceFolder/bxslider/jquery.bxslider.css');

var ico = {
    "thunder" : '&#xe600;', //雷电-天气
    "sunny" : '&#xe601;', //晴-天气
    "rain" : '&#xe602;', //小雨-天气
    "snow" : '&#xe603;', //雪-天气
    "cloud" : '&#xe604;', //多云-天气
    "plus" : '&#xe605;', //加号
    "menu" : '&#xe606;', //菜单
    "menu_solid" : '&#xe607;', //菜单
    "minus" : '&#xe608;', //减号
    "temperature" : '&#xe609;', //减号
};

var getIco = function(icoString) {
    return ico[icoString];
}

var Vue = require('vue');

var temperature = new Vue ({
    el: "#temperature",
    data: {
        weather: getIco("thunder"),
        temperature_sign: getIco("temperature"),
        temperature: 30,
        heat_status: "Heat",
    }
});

var header = new Vue({
    el: "#header",
    data: {
        location: 'Haidian',
        windscale: '5',
        humidity: '8',
        pm: '13',
        menu: getIco("menu_solid")
    }
});

var copyright = new Vue({
    el: "#copyright",
    data: {
        switchMode: true,
        plus: getIco('plus'),
        minus: getIco('minus'),
        placeholder: 'Temp',
        temperature: '',
        pending: '',
        power: true,
    },
    methods: {
        tapPlusContorller: function() {
            this.initNumber();
            30 > this.pending && this.pending ++;
        },
        tapMinusContorller: function() {
            this.initNumber();
            0 < this.pending && this.pending --;
        },
        initNumber: function() {
            if (0 == this.pending.length) {
                this.pending = 0;
            }
        },
        switchModes: function() {
            window.console.log(this.props);
            if (this.props && this.props.attr && 'power' == this.props.attr) {
                this.switchMode = true;
            }
            if (this.props && this.props.attr && 'mode' == this.props.attr) {
                this.switchMode = false;
            }
        }
    }
});