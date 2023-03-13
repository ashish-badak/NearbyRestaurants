# NearbyRestaurants

A demo application to show nearby restaurants usin Yelp Developer APIs

## NOTE:

For security reasons, I have not included `APIKey` in here. Please get your `APIKey` from [Yelp](https://docs.developer.yelp.com/docs/fusion-authentication)


## Implementation Details:

- **Architecture:** VIPER
- **UI:** Programmatic UI
- APIs Used:
  1. [Business Listing](https://docs.developer.yelp.com/reference/v3_business_search)
  2. [Business Details](https://docs.developer.yelp.com/reference/v3_business_info)

## Notable Features:

### UI:
- Entire UI layer is written in a programmatic UI style.
- Created generic TableViewCell and CardTableViewCell which can be reused across the project with programmatically created views. This offers better flexibility.
- Uses Generic cell registration and queueing. 

### Networking:
- Implemented network layer without using any third-party library
- Entire networking layer is highly modular.
- With the use of generics and protocols, it is very flexible to scale, tweak and test.

### Image Store:
- Implemented image caching without any third-party library.
- Created separate entities to download and cache to allow better flexibility.
