import spf from 'spf/dist/spf';
import '../stylesheets/application.scss';

var app = app || {};


app.init = {
    spf: function() {
        spf.init({
            'animation-class': 'spf-animate',
            'animation-duration': 425,
            'cache-lifetime': 10 * 60 * 1000,  // 10 minute cache lifetime (ms).
            'cache-max': 50,  // 50 items.
            'cache-unified': true,
            'link-class': 'spf-link',
            'nolink-class': 'spf-nolink',
            'navigate-limit': 100,  // 20 navigations per session.
            'navigate-lifetime': 24 * 60 * 60 * 1000,  // 1 day session lifetime (ms).
            'reload-identifier': null,  // Always a param, no '?' needed.
            'request-timeout': 0,  // No request timeout.
            'url-identifier': '?spf=__type__'
        })
    }
}



app.init.spf()


window.counter = function() {
    var x = 0;
    setInterval(function() {
        x++;
        document.getElementById("counter").innerHTML = x;
    }, 1000);

}
