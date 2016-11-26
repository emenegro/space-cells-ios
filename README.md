# Space Cells

![Icon](etc/icon.png =100x)

Exercising collection view **loading**, **configuration** and **interaction** on iOS VIPER architecture.

The motivation is to explore the implementation of a mechanism that allows the interaction with components inside cells without involving the view.

## Example app
This app is composed of three views:

- The main view showing a list of space posters.
- An information view shown when tapping `Info` button.
- A detail view that shows the whole poster when tapping the cell.

![List](etc/list.png =320x) ![Info](etc/info.png =320x) ![Detail](etc/detail.png =320x)

## Todo
- Allow loading of multiple cell types.
- UI testing.

## Acknowledgements
- Application icon from [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Creative-Tail-rocket.svg), slightly modified.
- Posters from [JPL Visions of the Future](http://www.jpl.nasa.gov/visions-of-the-future/).
- This apps uses ['Reusable' extensions](https://medium.com/@gonzalezreal/ios-cell-registration-reusing-with-swift-protocol-extensions-and-generics-c5ac4fb5b75e#.mxlpvb6h0) by Guille González (adapted to Swift 3).

## License
This library is licensed under the [MIT License](LICENSE).
