var copy = (function() {
  var sourceElement = document.querySelector('.copy__text');
  var actionElement = document.querySelector('.copy__button');

  var init = function() {
    bindActionHandler();
  };

  var bindActionHandler = function() {
    actionElement.addEventListener('click', copySourceText, false);
  };

  var copySourceText = function() {
    sourceElement.setAttribute('readonly', '');
    sourceElement.select();
    sourceElement.setSelectionRange(0, sourceElement.value.length);
    document.execCommand("copy");
  };

  return {
    init: init
  };
})();

copy.init();
