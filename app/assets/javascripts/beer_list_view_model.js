function BeerListViewModel(data) {
  var self = this;
  self.currentIndex = 0;
  self.status       = data.status;
  self.ratingCount  = ko.observable(data.ratingCount);
  self.beers        = ko.observableArray([]);
  self.paused       = ko.observable(false);

  self.init = function() {
    self.getMoreBeers().done(function() {
      self.beers()[self.currentIndex].visible(true);
    });
    return self;
  }

  self.getMoreBeers = function() {
    url = window.location.pathname.replace('/beers', '') + '/beers/?status=' + self.status;
    return $.get(url, function(moreBeers) {
      if (moreBeers.length > 0) {
        for(i = 0; i < moreBeers.length; i++) {
          self.beers.push(new BeerItem(moreBeers[i]));
        }
      }
    }, 'json');
  }

  self.rateBeer = function(rating) {
    if (self.paused()) return true;
    self.beers()[self.currentIndex].rate(rating);
    self.beers()[self.currentIndex += 1].visible(true);
    self.ratingCount(self.ratingCount() + 1);
    if (self.currentIndex + 1 === self.beers().length) {
      self.paused(true);
      self.getMoreBeers().done(function() { self.paused(false) });
    }
  }

  self.like = function() {
    self.rateBeer(1);
  }

  self.dislike = function() {
    self.rateBeer(-1);
  }

  self.pass = function() {
    self.rateBeer(0);
  }
}
