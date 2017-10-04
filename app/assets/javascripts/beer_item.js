function BeerItem(data) {
  var self = this;
  self.externalId  = ko.observable(data.external_id);
  self.name        = ko.observable(data.name);
  self.breweryName = ko.observable(data.brewery_name);
  self.icon        = ko.observable(data.icon);
  self.category    = ko.observable(data.category_root_name);
  self.visible     = ko.observable(false);
  self.cssClass    = ko.observable();

  self.rate = function(rating) {
    url = window.location.pathname + '/beers/' + self.externalId() + '/rate';
    $.post(url, { rating: rating });
    self.animate(self.animationForRating(rating));
  }

  self.animate = function(style) {
    self.cssClass('animated ' + style);
    setTimeout(function() {
      self.visible(false);
    }, 500);
  }

  self.animationForRating = function(rating) {
    switch (rating) {
      case 0:
        return 'fadeOutUpBig';
        break;
      case 1:
        return 'bounceOutRight';
        break;
      case -1:
        return 'bounceOutLeft';
        break;
    }
  }
}
