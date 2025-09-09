// Photo carousel data with dummy images and text overlays
const carouselData = [
  {
    id: 1,
    image: 'https://picsum.photos/800/600?random=1',
    title: 'Mountain Adventure',
    description: 'Discover breathtaking mountain landscapes and experience the thrill of high-altitude adventures.'
  },
  {
    id: 2,
    image: 'https://picsum.photos/800/600?random=2',
    title: 'Ocean Waves',
    description: 'Feel the power of the ocean as waves crash against the shore in this mesmerizing coastal scene.'
  },
  {
    id: 3,
    image: 'https://picsum.photos/800/600?random=3',
    title: 'City Lights',
    description: 'Experience the vibrant energy of the city as lights illuminate the urban landscape at night.'
  },
  {
    id: 4,
    image: 'https://picsum.photos/800/600?random=4',
    title: 'Forest Path',
    description: 'Walk through ancient forests and discover the peaceful beauty of nature\'s hidden trails.'
  },
  {
    id: 5,
    image: 'https://picsum.photos/800/600?random=5',
    title: 'Desert Sunset',
    description: 'Witness the stunning colors of a desert sunset as the sky transforms into a canvas of fire.'
  }
];

class PhotoCarousel {
  constructor() {
    this.currentSlide = 0;
    this.carousel = document.getElementById('carousel');
    this.controls = document.getElementById('controls');
    this.prevBtn = document.getElementById('prevBtn');
    this.nextBtn = document.getElementById('nextBtn');
    
    this.init();
  }
  
  init() {
    this.createSlides();
    this.createControls();
    this.bindEvents();
    this.setCarouselWidth();
    this.updateCarousel();
  }
  
  setCarouselWidth() {
    // Set the carousel width to accommodate all slides
    this.carousel.style.width = `${carouselData.length * 100}%`;
  }
  
  createSlides() {
    carouselData.forEach((slide, index) => {
      const slideElement = document.createElement('div');
      slideElement.className = 'slide';
      
      slideElement.innerHTML = `
        <div class="slide-content">
          <h2 class="slide-title">${slide.title}</h2>
          <p class="slide-description">${slide.description}</p>
        </div>
        <div class="image-container" style="background-image: url(${slide.image})"></div>
      `;
      
      this.carousel.appendChild(slideElement);
      console.log(`Created slide ${index + 1}: ${slide.title}`);
    });
    console.log(`Total slides created: ${carouselData.length}`);
  }
  
  createControls() {
    carouselData.forEach((_, index) => {
      const controlBtn = document.createElement('button');
      controlBtn.className = 'control-btn';
      if (index === 0) controlBtn.classList.add('active');
      
      controlBtn.addEventListener('click', () => {
        this.goToSlide(index);
      });
      
      this.controls.appendChild(controlBtn);
    });
  }
  
  bindEvents() {
    this.prevBtn.addEventListener('click', () => this.previousSlide());
    this.nextBtn.addEventListener('click', () => this.nextSlide());
    
    // Touch/swipe support for mobile
    let startX = 0;
    let endX = 0;
    
    this.carousel.addEventListener('touchstart', (e) => {
      startX = e.touches[0].clientX;
    });
    
    this.carousel.addEventListener('touchend', (e) => {
      endX = e.changedTouches[0].clientX;
      this.handleSwipe(startX, endX);
    });
    
    // Keyboard navigation
    document.addEventListener('keydown', (e) => {
      if (e.key === 'ArrowLeft') this.previousSlide();
      if (e.key === 'ArrowRight') this.nextSlide();
    });
    
    // Auto-play (optional)
    // this.startAutoPlay();
  }
  
  handleSwipe(startX, endX) {
    const threshold = 50;
    const diff = startX - endX;
    
    if (Math.abs(diff) > threshold) {
      if (diff > 0) {
        this.nextSlide();
      } else {
        this.previousSlide();
      }
    }
  }
  
  startAutoPlay() {
    setInterval(() => {
      this.nextSlide();
    }, 5000); // Change slide every 5 seconds
  }
  
  goToSlide(index) {
    this.currentSlide = index;
    this.updateCarousel();
  }
  
  nextSlide() {
    this.currentSlide = (this.currentSlide + 1) % carouselData.length;
    this.updateCarousel();
  }
  
  previousSlide() {
    this.currentSlide = this.currentSlide === 0 ? carouselData.length - 1 : this.currentSlide - 1;
    this.updateCarousel();
  }
  
  updateCarousel() {
    const translateX = -this.currentSlide * 100;
    this.carousel.style.transform = `translateX(${translateX}%)`;
    
    // Debug logging
    console.log(`Current slide: ${this.currentSlide}, translateX: ${translateX}%`);
    
    // Update control buttons
    const controlBtns = this.controls.querySelectorAll('.control-btn');
    controlBtns.forEach((btn, index) => {
      btn.classList.toggle('active', index === this.currentSlide);
    });
  }
}

// Initialize the carousel when the DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  new PhotoCarousel();
});

// Capacitor integration
import { Capacitor } from '@capacitor/core';

// Check if running on a native platform
if (Capacitor.isNativePlatform()) {
  console.log('Running on native platform');
  // Add any native-specific functionality here
} else {
  console.log('Running in web browser');
}
