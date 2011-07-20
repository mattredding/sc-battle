/* Connect With SoundCloud                      */
/* URL: http://connect.soundcloud.com/latest.js */
/* Version: 0.2.0                               */

window.SC = window.SC || {};

SC.Client = function(passedOptions){
  this.options = {
    "accessToken": passedOptions.accessToken,
    "clientId":    passedOptions.clientId,
    "site":        (passedOptions.site || "soundcloud.com")
  }

  this.get = function(path, callback) {
   SC.Helper.JSONP.get(this.buildUrl(path), callback);
  }

  this.buildUrl = function(path){
    var scheme, pathWithParams;
    if(this.options.accessToken){
      scheme = "https";
      pathWithParams = path + "?oauth_token=" + this.options.accessToken;
    }else {
      scheme = "http";
      pathWithParams = path + "?consumer_key=" + this.options.clientId;
    }
    pathWithParams += "&format=json";
    return scheme + "://api." + this.options.site + pathWithParams;
  }

  /* IMPLEMENT Using CORS+Fallback */
  //function delete(path, params, callback){} // keyword collision :(
  //function post  (path, params, callback){}
  //function put   (path, params, callback){}
}

SC.Connect = {
  successCallback: function(){},
  errorCallback:   function(reason){},

  client: undefined,

  open: function(options){
    var url;
    if(options.redirectEndpoint){
      url = options.redirectEndpoint;
    }else if(options.clientId && options.redirectUri){
      url = "http://soundcloud.com/connect?client_id="+ options.clientId + "&response_type=token&redirect_uri=" + escape(options.redirectUri);
    }else{
      throw("Either clientId and redirectUri (for user agent flow) or redirectEndpoint (for backend flow) must be passed as an option");
    }

    if(options.success){ this.successCallback = options.success; }
    if(options.error)  { this.errorCallback   = options.error; }

    window.open(url, "soundcloud-connect-popup","location=1, width=456, height=510,toolbar=no,scrollbars=yes");
  },

  popupCallback: function(popupWindow){
    var params = SC.Helper.parseLocation(popupWindow.location);
    popupWindow.close();
    if(params.error){
      this.errorCallback(params.error);
    }else{
      var accessToken = params.access_token;
      this.client = new SC.Client({'accessToken': accessToken});
      this.successCallback();
    }
    
  }
};


SC.Helper = {
  JSONP: {
    callbacks: {},
    randomCallbackName: function(){
      return "CB" + parseInt(Math.random()*999999);
    },
    get: function(url, callback){
      var callbackName = this.randomCallbackName();
      var scriptElement = document.createElement('script');
      scriptElement.src = url + "&callback=SC.Helper.JSONP.callbacks." + callbackName;
      scriptElement.addEventListener("load", function(){
        document.body.removeChild(scriptElement);
      })
      this.callbacks[callbackName] = callback;
      document.body.appendChild(scriptElement);
    }
  },
  parseLocation: function(location){
    var splitted = (location.search + location.hash).split(/[&?#]/);
    var obj = {};
    for(var i in splitted){
      var kv = splitted[i].split("=");
      if(kv[0]){
        obj[kv[0]] = unescape(kv[1]);
      }
    }
    return obj;
  }
};
