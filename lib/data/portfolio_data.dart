import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/app_strings.dart';

import '../models/certificate.dart';
import '../models/experience.dart';
import '../models/project.dart';
import '../models/skill.dart';

class PortfolioData {
  PortfolioData._();

  // ==========================================================
  // Skills
  // ==========================================================

  static final List<Skill> skills = [
    // Mobile Development
    Skill(
      title: "Flutter",
      category: "Mobile Development",
      icon: Icons.flutter_dash,
      description: "Cross-platform mobile application development",
    ),
    Skill(
      title: "Dart",
      category: "Mobile Development",
      icon: Icons.code,
      description: "Primary programming language for Flutter",
    ),

    // Architecture
    Skill(
      title: "Clean Architecture",
      category: "Architecture",
      icon: Icons.architecture,
      description: "Scalable application architecture",
    ),
    Skill(
      title: "MVVM / MVI",
      category: "Architecture",
      icon: Icons.account_tree,
      description: "Modern application architecture patterns",
    ),

    // State Management
    Skill(
      title: "Bloc / Cubit",
      category: "State Management",
      icon: Icons.account_tree,
      description: "Business Logic Component pattern",
    ),
    Skill(
      title: "Provider",
      category: "State Management",
      icon: Icons.layers,
      description: "Dependency injection & state management",
    ),

    // Backend
    Skill(
      title: "Firebase",
      category: "Backend",
      icon: Icons.local_fire_department,
      description: "Authentication, Firestore, Storage & Notifications",
    ),
    Skill(
      title: "REST APIs",
      category: "Backend",
      icon: Icons.api,
      description: "RESTful API integration using Dio",
    ),
    Skill(
      title: "Google Maps",
      category: "Backend",
      icon: Icons.map,
      description: "Maps & location services",
    ),
    Skill(
      title: "Stripe",
      category: "Backend",
      icon: Icons.payment,
      description: "Payment gateway integration",
    ),
    Skill(
      title: "Ollama",
      category: "AI",
      icon: Icons.smart_toy,
      description: "Local AI model integration",
    ),

    // Local Storage
    Skill(
      title: "MySQL",
      category: "Database",
      icon: Icons.storage,
      description: "Relational database",
    ),

    // Testing
    Skill(
      title: "Unit Testing",
      category: "Testing",
      icon: Icons.fact_check,
      description: "Business logic testing",
    ),
    Skill(
      title: "Widget Testing",
      category: "Testing",
      icon: Icons.bug_report,
      description: "Flutter widget testing",
    ),

    // Tools
    Skill(
      title: "Git",
      category: "Tools",
      icon: Icons.commit,
      description: "Version control",
    ),
    Skill(
      title: "GitHub",
      category: "Tools",
      icon: Icons.code,
      description: "Source code management",
    ),
    Skill(
      title: "Postman",
      category: "Tools",
      icon: Icons.send,
      description: "API testing",
    ),
    Skill(
      title: "Figma",
      category: "Tools",
      icon: Icons.design_services,
      description: "UI collaboration",
    ),
    Skill(
      title: "AI",
      category: "Tools",
      icon: Icons.design_services,
      description: "UI collaboration",
    ),
    Skill(
      title: "CI / CD",
      category: "Tools",
      icon: Icons.design_services,
      description: "UI collaboration",
    ),

    Skill(
      title: "Flavors",
      category: "Tools",
      icon: Icons.design_services,
      description: "UI collaboration",
    ),

    // Languages
    Skill(
      title: "JavaScript",
      category: "Programming",
      icon: Icons.javascript,
      description: "Web programming",
    ),
    Skill(
      title: "HTML",
      category: "Programming",
      icon: Icons.html,
      description: "Markup language",
    ),
    Skill(
      title: "CSS",
      category: "Programming",
      icon: Icons.css,
      description: "Styling language",
    ),
  ];

  // ==========================================================
  // Experience
  // ==========================================================

  static const List<Experience> experiences = [
    Experience(
      company: "Elevate",
      role: "Flutter Developer Intern",
      duration: "Feb 2026 - Aug 2026",
      description:
          "Developed production-level Flutter applications using Clean Architecture, MVVM/MVI, Bloc/Cubit, Dio, Dependency Injection, Firebase, and AI-assisted development workflows.",
    ),

    Experience(
      company: "Route Academy",
      role: "Flutter Development Diploma",
      duration: "Jul 2023 - Nov 2023",
      description:
          "Completed an intensive Flutter diploma covering Flutter, Firebase, Clean Architecture, REST APIs, and modern mobile development best practices.",
    ),

    Experience(
      company: "Pearson",
      role: "Instructor",
      duration: "Nov 2025 - Present",
      description:
          "Deliver Pearson courses, develop students' analytical and problem-solving skills, assess performance, and teach practical AI tools to improve productivity.",
    ),
  ];

  // ==========================================================
  // Projects
  // ==========================================================
  static const List<Project> projects = [
    Project(
      featured: true,
      title: "Fitness AI App",
      subtitle: "AI Fitness Assistant",
      description:
          "Fitness application with AI chat, meal planning, workout tracking, calorie calculations, and personalized fitness recommendations.",
      image: "assets/projects/fitness.png",
      github: AppStrings.fitnessRepo,
      technologies: [
        "Flutter",
        "Firebase",
        "BLoC",
        "AI",
        "Ollama",
        "Clean Architecture",
        "Dio",
        "Dependency Injection",
        "REST APIs",
      ],
    ),

    Project(
      featured: true,
      title: "Flowery App",
      subtitle: "E-Commerce Mobile Application",
      description:
          "E-commerce application supporting authentication, shopping cart, product management, order tracking, and backend integration.",
      image: "assets/projects/flowery.png",
      github: AppStrings.floweryRepo,
      technologies: [
        "Flutter",
        "Firebase",
        "BLoC",
        "Clean Architecture",
        "Dio",
        "Dependency Injection",
        "REST APIs",
        "Google Maps",
        "Stripe",
      ],
    ),

    Project(
      featured: false,
      title: "Driver App",
      subtitle: "Delivery Management",
      description:
          "Driver application supporting order management, live map tracking, notifications, and order status updates.",
      image: "assets/projects/driver.png",
      github: AppStrings.driverRepo,
      technologies: [
        "Flutter",
        "Firebase",
        "BLoC",
        "Clean Architecture",
        "Dio",
        "Dependency Injection",
        "Google Maps",
        "REST APIs",
      ],
    ),

    Project(
      featured: true,
      title: "InOne",
      subtitle: "Social Media & Review Platform",
      description:
          "Graduation project featuring community reviews, AI-powered agents, personalized recommendations, and real-time voice & video calls using Agora.",
      image: "assets/projects/inone.png",
      github: AppStrings.inoneRepo,
      technologies: [
        "Flutter",
        "Firebase",
        "Provider",
        "Clean Architecture",
        "MVVM",
        "Firebase Authentication",
        "Firestore",
        "Agora",
      ],
    ),

    Project(
      featured: false,
      title: "Exam App",
      subtitle: "Online Examination Platform",
      description:
          "Exam platform supporting quizzes, score calculation, and student progress tracking.",
      image: "assets/projects/exam.png",
      github: AppStrings.examRepo,
      technologies: [
        "Flutter",
        "Firebase",
        "BLoC",
        "Clean Architecture",
        "Dio",
        "Dependency Injection",
        "REST APIs",
      ],
    ),

    Project(
      featured: false,
      title: "Movies App",
      subtitle: "Movie Discovery",
      description:
          "Movie discovery application with search, recommendations, movie details, and reviews.",
      image: "assets/projects/movies.png",
      github: AppStrings.moviesRepo,
      technologies: [
        "Flutter",
        "Dio",
        "REST APIs",
        "BLoC",
        "Clean Architecture",
        "Dependency Injection",
      ],
    ),

    Project(
      featured: false,
      title: "Circus of Plates",
      subtitle: "2D Single-Player Game",
      description:
          "A single-player game where a clown catches falling colored plates. Matching three consecutive plates of the same color makes them disappear and increases the player's score.",
      image: "assets/projects/circus_of_plates.png",
      github: AppStrings.circusOfPlatesRepo,
      technologies: ["Java", "Game Development", "Object-Oriented Programming"],
    ),

    Project(
      featured: false,
      title: "Islami App",
      subtitle: "Islamic Lifestyle Application",
      description:
          "A comprehensive Islamic application featuring Quran, Hadith, Sebha, Azkar, Prayer Times, and Radio with a clean, responsive Flutter interface following modern development practices.",
      image: "assets/projects/islami.png",
      github: AppStrings.islamiRepo,
      technologies: [
        "Flutter",
        "Provider",
        "SharedPreferences",
        "Localization",
        "Theming",
      ],
    ),
  ];

  // ==========================================================
  // Certificates
  // ==========================================================

  static const List<Certificate> certificates = [
    Certificate(
      title: "Flutter Development Diploma",
      issuer: "Route Academy",
      image: "assets/certificates/route.png",
    ),

    Certificate(
      title: "Flutter Developer Internship",
      issuer: "Elevate",
      image: "assets/certificates/elevate.png",
    ),
  ];
}
