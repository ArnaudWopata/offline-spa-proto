# Offline rails+angular(+sharejs) Single Page App

## Architecture of a Single Page App

A SPA is takes 3 kind of actors and bring 2 types of data.

### The SPA, a.k.a the client

The SPA runs on the user's browser. By itslef, it an empty shell that will show and manipulate data using its locally specified logic.

### The application file server - a.k.a the CDN
The asset server prupose in only to serve the SPA files: HTML, CSS, JS, images. It can be very dumb read-only storage system, it can be your hard drive.

### The data source(s) - a.k.a the API

The SPA will fetch the data from one or many data sources. The current main type of data source type is REST API. It could be something else. The SPA can use several data sources to provide a service, such as a social network API and your business logic API. It holds all the right management and security logic, even if the SPA already runs it: API have the last call on the data.

**Note:** A single server can have both the role of CDN and API.

## No network. Where's the problem ?

There are 3 steps that requires network connection.

1. Retrieve the SPA
2. Get the data
3. Update the data

// TODO - Insert the schema

The first step is the most important one. If you can't load the SPA then you can't do nothing. But… your SPA will be quite useless without data. Having the data would enable the read-only features of your app. Lastly, being able to modify the data while offline, and update the changes when getting back online is the graal. We are aiming for that.


### Features we need

* Offline access to the SPA
* Within the SPA, know when we are offline
* Cache the data to access anytime
* Send data updates when getting back online

## Offline access to the SPA

When a user has no connection, how can the user load the remotly served SPA ?

### Basics
The first step in having an offline app is to make the browser load the SPA from its cache.

HTML5 brings this feature through the Application Cache. The AppCache policy is specific to every page and is ruled by a server side file called `cache manifest`. This file basically contains a whitelist and a blacklist of resources to be cached by the AppCache.

What we have to do here is to specify the static resources used by the SPA in the whitelist and the data sources in the blacklist.

The `cache manifest` can also provide fallback solutions for error or specific situations.

### Implementation withing rails
Rack-offline librairy allows an automatic generation of the `cache manigest`. It handles differrent behaviour depending on the environment (dev, prod), allowing easier debugging.

## Within the SPA, know when we are offline
### Basics

We can use `window.navigator.online` to know if we are online.
We can bind status changes with:

````
$(window).bind('online', function(){…});
````

### The Angular way

We have to create a service listening to the event and exposing theses values. That way, controllers would just have to depend on it, expose the status in the scope and that's it.

This component should be externalized to a lib.

## Cache the data to access it anytime

Usually, when user refreshes its page, the data is cleared from memory and the SPA has to download it again from the server. It doesn't have to be so: the SPA can download the data a first time, store it locally, then read from this storage unit everytime it needs to. Of course if the data is updated on the server, the client does not get the update. The usual compromise it to  update the data from the server when it's possible (online), or get it from the local storage when it's not (offline).

### A simple workflow

1. Online
  2. Get initial data from the server
  1. Store it in the localStorage
1. Offline
  2. Get the data from localStorage
2. Going back online
  3. Refresh the data from the server

### LocalStorage caching solutions

#### Bare handed

Implement your own system based on the very basic localStorage functions: read(key), write(key, data). _Good luck with that!_

#### The angular way

`ngStorage` library allows an easy binding between the scope and localStorage. This is neat. However, the sync process is up to you, and this is the hardest part.

#### BreezeJS, the heavy weight solution

BreezeJS is a two way binding solution between the API and the localStorage with eventing. Its integration however seems a bit complicated.

### Limitations

W3C specifications do not set any space limit. However, common browsers set the owner -various- limitations. Some of the limits are hard limits, some have threshold that trigger user to allow the app to take more space. It goes from 5Mo to several hundreds.

## Send data updates when going back online
A read-only offline app is a nice start. A read + write offline app is better. Just do think about how difficult it is to have it and you'll be fine.

### Lets just speak about the easy part

### Is that all? No it is not
The first part, sending updates, was the easy part. The next is trickier:

* How do you handle the errors the server may return?
* What is your conflict resolution policy?

## References

* "Offline apps" Railscasts [part 1](http://railscasts.com/episodes/247-offline-apps-part-1), [part 2](http://railscasts.com/episodes/247-offline-apps-part-1)
* DiveIntoHTML5 [chapter 8 - 'Offline'](http://diveintohtml5.info/offline.html)
* MDN
  * ['Online and offline events'](https://developer.mozilla.org/en/docs/Online_and_offline_events)
  * [window.navigator.onLine](https://developer.mozilla.org/en-US/docs/Web/API/NavigatorOnLine.onLine)
* [Building offline applications with AngularJS and PouchDB](http://mircozeiss.com/building-offline-applications-with-angularjs-and-pouchdb/) by Mirco Zeiss
* [CRUD Apps with Angular and Breeze](http://www.youtube.com/watch?v=P2ErSQj3SN8&feature=player_profilepage) by Ward Bell
* [SPA with rails and breezejs](http://www.breezejs.com/samples/intro-spa-ruby)

## Libraries

### Server side

* [Rack-offline](https://github.com/wycats/rack-offline), cache-manifest generation

### Client side

* [jquery-offline](https://github.com/wycats/jquery-offline), read-only API data caching
* [ngStorage](https://github.com/gsklee/ngStorage), localstorage, the angular way
* [BreezeJS](http://www.breezejs.com/) javascript database
