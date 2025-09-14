# Interactive Particle System

This project is a web-based, interactive generative art piece that creates a mesmerizing visual experience using a system of flowing particles.

## Technology Stack

*   **HTML:** The standard markup language for creating the web page.
*   **CSS:** Used for styling the page, making the canvas fill the screen and setting a dark background.
*   **JavaScript (ES6+):** The core logic of the application is written in modern JavaScript.
*   **HTML5 Canvas API:** The Canvas API is used for drawing and animating the particles in 2D.

## Features

*   **Generative Art:** The application creates a unique and ever-changing visual display.
*   **Particle Animation:** Thousands of particles are animated smoothly across the screen.
*   **Interactive:** The particle system reacts to the user's mouse movements.
*   **Connecting Lines:** Lines are drawn between nearby particles, creating a web-like effect.

## How It Works

The application is built around a few key components:

1.  **Canvas Setup:** An HTML `<canvas>` element is created to cover the entire viewport. A 2D rendering context is obtained from the canvas, which provides the methods for drawing.

2.  **Particle Class:** A `Particle` class is defined to manage the state of each particle. This includes its position (x, y), velocity (directionX, directionY), size, and color.

3.  **Initialization:** The `init()` function creates a large number of particles and stores them in an array. The number of particles is calculated based on the screen size. Each particle is given a random initial position, size, and velocity.

4.  **Animation Loop:** The `animate()` function is the heart of the application. It uses `requestAnimationFrame` to create a smooth animation loop. In each frame, it clears the canvas and then calls the `update()` method for every particle.

5.  **Particle Update:** The `update()` method of each particle is responsible for:
    *   Moving the particle based on its velocity.
    *   Bouncing the particle off the edges of the screen.
    *   Detecting the mouse position and making the particle move away from the cursor if it's too close.
    *   Drawing the particle on the canvas.

6.  **Mouse Interaction:** An event listener tracks the mouse's position. This position is used in the `update()` method to create the interactive effect.

7.  **Connecting Lines:** The `connect()` function iterates through all pairs of particles. If the distance between two particles is below a certain threshold, it draws a line between them. The opacity of the line is inversely proportional to the distance, creating a fading effect.

## How to Run

To run this project locally, you need a simple web server. If you have Python 3 installed, you can use its built-in server:

1.  Open a terminal in the project directory.
2.  Run the command: `python3 -m http.server`
3.  Open your web browser and navigate to `http://localhost:8000`.
