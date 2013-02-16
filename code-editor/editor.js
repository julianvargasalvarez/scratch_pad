var key_words = [
  'var'
  ];

  $('#a').keyup(function(e){
        var word = get_word();
          word += String.fromCharCode(e.which);
            set_word(word);
              check_words();
  });

function get_word() {
      return $('.cursor').text();
}

function set_word(word) {
      $('.cursor').text(word.toLowerCase());
}

function check_words(){
      var word = get_word();
        if(key_words.indexOf(word) > -1) {
                var $new_word = $('<spas class="key-word"></span>').text(word);
                    var $cursor = $('.cursor');
                        $cursor.before($new_word);
                            $cursor.text('');
                              }
}
