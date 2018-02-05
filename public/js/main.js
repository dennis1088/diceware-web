var copy = (function() {
  var sourceElement = $('.copy__text');
  var actionElement = $('.copy__button');

  var init = function() {
    bindActionHandler();
  };

  var bindActionHandler = function() {
    actionElement.click(copySourceText);
  };

  var copySourceText = function() {
    sourceElement.select();
    document.execCommand("copy");
  };

  return {
    init: init
  };
})();

copy.init();
