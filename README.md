# 📱 Photo Carousel App

A beautiful, responsive photo carousel application built with vanilla JavaScript and Vite. Features touch/swipe support, auto-play functionality, and works perfectly on both desktop and mobile devices.

## ✨ Features

- 🖼️ **Beautiful Photo Carousel** - Smooth transitions between images
- 📱 **Mobile Responsive** - Optimized for all screen sizes
- 👆 **Touch Support** - Swipe left/right to navigate on mobile
- ⌨️ **Keyboard Navigation** - Use arrow keys on desktop
- 🔄 **Auto-play** - Automatic slide progression (optional)
- 🎨 **Modern UI** - Clean, professional design with gradient backgrounds
- 📝 **Text Overlays** - Descriptive text above each image
- 🚀 **PWA Ready** - Can be installed as a Progressive Web App

## 🚀 Live Demo

Visit the live app: [https://yourusername.github.io/photo-carousel-app](https://yourusername.github.io/photo-carousel-app)

## 📱 Mobile Installation

### PWA Installation (Recommended)
1. Open the app in Chrome on your mobile device
2. Tap the "Add to Home Screen" option in Chrome menu
3. Your app will be installed as a native-like app!

### Direct Access
- Simply bookmark the URL in your mobile browser
- The app works perfectly in any modern mobile browser

## 🛠️ Development

### Prerequisites
- Node.js (v16 or higher)
- npm or yarn

### Setup
```bash
# Clone the repository
git clone https://github.com/yourusername/photo-carousel-app.git

# Navigate to project directory
cd photo-carousel-app

# Install dependencies
npm install

# Start development server
npm run dev
```

### Build for Production
```bash
# Build the project
npm run build

# Preview the build
npm run preview
```

## 📁 Project Structure

```
photo-carousel-app/
├── index.html          # Main HTML file
├── main.js            # JavaScript logic
├── package.json       # Dependencies and scripts
├── vite.config.js     # Vite configuration
├── manifest.json      # PWA manifest
├── .github/
│   └── workflows/
│       └── deploy.yml # GitHub Pages deployment
└── README.md          # This file
```

## 🎨 Customization

### Adding New Photos
Edit the `carouselData` array in `main.js`:

```javascript
const carouselData = [
  {
    id: 1,
    image: 'https://your-image-url.com/image1.jpg',
    title: 'Your Title',
    description: 'Your description here'
  },
  // Add more slides...
];
```

### Styling
- Main styles are in `index.html` within the `<style>` tag
- Responsive breakpoints are defined for mobile devices
- Colors and fonts can be easily customized

## 📱 Mobile Features

- **Touch Navigation**: Swipe left/right to change slides
- **Responsive Design**: Adapts to all screen sizes
- **PWA Support**: Install as a native app
- **Fast Loading**: Optimized for mobile networks
- **Offline Ready**: Works without internet (after first load)

## 🔧 Technical Details

- **Framework**: Vanilla JavaScript (no dependencies)
- **Build Tool**: Vite
- **Styling**: Pure CSS with modern features
- **Deployment**: GitHub Pages
- **PWA**: Progressive Web App capabilities

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

If you have any questions or need help, please open an issue on GitHub.

---

Made with ❤️ using vanilla JavaScript and Vite
