function BeerListViewModel(data) {
  var self = this;
  self.currentIndex = 0;
  self.ratingCount  = ko.observable(data.ratingCount);
  self.unratedBeers = ko.observableArray([]);
  self.paused       = ko.observable(false);

  self.init = function() {
    self.getMoreBeers().done(function() {
      self.unratedBeers()[self.currentIndex].visible(true);
    });
    return self;
  }

  self.getMoreBeers = function() {
    url = window.location.pathname + '/unrated_beers';
    return $.get(url, function(moreBeers) {
      if (moreBeers.length > 0) {
        for(i = 0; i < moreBeers.length; i++) {
          self.unratedBeers.push(new BeerItem(moreBeers[i]));
        }
      }
    });
  }

  self.rateBeer = function(rating) {
    if (self.paused()) return true;
    self.unratedBeers()[self.currentIndex].rate(rating);
    self.unratedBeers()[self.currentIndex += 1].visible(true);
    self.ratingCount(self.ratingCount() + 1);
    if (self.currentIndex + 1 === self.unratedBeers().length) {
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
