# BlendViewer


<!-- ![Status](https://img.shields.io/badge/status-prerelease-blue?logo=github) -->
![Status](https://img.shields.io/badge/-Under%20Development%20|%20UI%20Integration-orange?logo=github)

---

- **BlendViewer** is a lightweight **glTF (`.gltf` / `.glb`) rendering and inspection application** under development. 
- Being built with the **Qt Framework (C++ & QML)**.
- The project focuses on providing an intuitive UI for loading, viewing, and manipulating 3D models using **Qt Quick 3D**.

### [Live concept & design reference](https://chester-xx.github.io/blendviewer/live-reference/)

---

### Current Issues

- **Resizing behavior** - Window Resizing causes performance issues related to layout bindings and dynamic objects being linked to both anchoring and layout bindinds.
- **`assets/models` Storage** - Currently storing models in the repository for testing. Deployment requires appdata storage.
- **Viewport Placeholder** - Placeholder  object `Canvas` & `Rectangle` has been depricated for the use of gradients, deciding on implementation between svg or fragment shader based on performance.

---

## Technical Applications

* **Language:** C++
* **Framework:** Qt 6
* **Modules Used:**

  * Qt Core
  * Qt GUI
  * Qt QML
  * Qt Quick
  * Qt Quick 3D
  * Qt ShaderTools
* **IDE:** Visual Studio (Qt VS Tools Extension)
* **Rendering Backend:** Qt Quick 3D (glTF importer) & Potentially implementation with Vulkan
* **CMake for build system**

## Project Setup & Information

### Planned Repository Structure
```
BlendViewer/
│
├── main.cpp
├── Main.qml
│
├── src/
│   ├── controllers/
│   ├── models/
│   └── utils/
│
├── ui/
│   ├── Properties.qml
│   │
│   ├── sidebar/
│   │   ├── SideBar.qml
│   │   │
│   │   ├── AppInfo.qml
│   │   ├── ImportFileButton.qml
│   │   ├── CameraSpeedController.qml
│   │   │
│   │   ├── cameracontrols/
│   │   │   ├── CameraControls.qml
│   │   │   │
│   │   │   ├── CameraControlsHeader.qml
│   │   │   └── ControlObject.qml
│   │   │
│   │   ├── quickviews/
│   │   │   ├── QuickViews.qml
│   │   │   │
│   │   │   ├── QuickViewsHeader.qml
│   │   │   └── ViewObject.qml
│   │   │
│   │   └── environments/
│   │       ├── Environments.qml
│   │       │
│   │       ├── EnvironmentsHeader.qml
│   │       └── EnvironmentObject.qml
│   │
│   ├── statusbar/
│   │   ├── StatusBar.qml
│   │   │
│   │   └── StatusLabel.qml
│   │
│   └── viewport/
│       ├── ViewPort.qml
│       │
│       └── ViewPortPlaceHolder.qml
│
├── assets/
│   ├── app.rc
│   └── icons/
│
├── build-debug/
├── build-release/
├── release-output/
│
├── deploy.bat
│
├── CMakeLists.txt
├── CMakePresets.json
│
├── README.md
└── LICENSE
```

1. Qt Quick Application initialization via Visual Studio
2. Enable required modules
3. Configure build system (Visual Studio + Qt + Qt VS Tools).
4. Automated deployment using:
   * `windeployqt`
   * Post-build cleanup for unnecessary folders

## Planning & Feature List
The project is fairly knew and I have a large amount of research to do.

### Core Features

#### Model Imports

* Import `.gltf` and `.glb` files
* Drag & drop support (future)
* SceneLoader-based rendering
* Status indicator (Ready / No model loaded)

#### Camera Controls

* Rotation X slider
* Rotation Y slider
* Distance (zoom) slider
* Camera speed slider
* Reset camera button

#### Quick Views & Presets

* Perspective (default)
* Top
* Bottom
* Left
* Right
* Front

#### Transformation Tools

* **Select tool**
* **Move**
* **Rotate**
* **Scale**
* **Wireframe mode toggle**

#### Scene Tools

* Grid toggle (on/off)
* Axis indicator
* Environment lighting selection
* FPS counter
* Mesh / Vertex / Material statistics

## Analysis

This section explains the technical reasoning behind the project:

* Qt Quick 3D provides native glTF import and rendering via `SceneLoader`.
* QML allows UI prototyping and dynamic control binding in addition controls via signals & slots.
* C++ backend will be able to handle file streams, input handling within the Qt engine, scene data handling.
* ShaderTools enables future material and shader experimentation.

This project enables the promotion of my education and depth into embedded systems development and software integration for such systems.

Design goals:

* Simple UI & UX (not my strong suite)
* Camera interaction in both I/O & signal systems
* Cross-platform capability (Windows first, later Linux/macOS) with understanding of `windeployqt` and containerization

## Design

The UI design is inspired by 3D viewers such as:

* Blender
* CAD
* glTF Studio
* Recent experimentation with Google Stitch

### **Design Components**:

* Left sidebar: Camera & environment controls
* Center viewport: 3D scene renderer
* Right toolbar: Transform tools (select, move, rotate, scale, wireframe)
* Bottom status bar: statistics (meshes, vertices, materials, FPS)

## Development & Implementation

1. **UI Layer**

   * QML-based controls
   * Toolbar and sidebar components
   * Property bindings to camera and scene objects

2. **File Stream Handling**

   * `.glTF` & `.glb` handling
   * Storage & Tracking
   * Render Pipeling -> `SceneLoader`

3. **Rendering Layer**

   * Qt Quick 3D `View3D`
   * `SceneLoader` for glTF files
   * Camera + Light nodes

4. **Input System**

   * Keyboard (WASD movement)
   * Sliders for rotation and zoom
   * Buttons for preset views

5. **Automation**

   * `windeployqt` for Release builds
   * Post-build cleanup scripts
   * Output directory unification

## Testing & Integration

* Load multiple models of varying complexity
* Validate:
  * Camera controls
  * Transform tools
  * Wireframe rendering
  * Performance
* Cross-machine testing (no Qt installed + Windows Only as of now)

## Planned Features Post Implementation

* Screenshot export
* Shader customization
* Linux & macOS builds

## License

[MIT Licence](https://github.com/Chester-xx/BlendViewer/blob/main/LICENSE)
