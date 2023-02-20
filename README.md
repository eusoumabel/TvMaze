# TvMaze

An app that uses the TvMaze API to display clearer information to users.

## Light

![Light](https://user-images.githubusercontent.com/51540772/219980781-9f7ec44e-5b76-4ed1-946a-134f4a64b413.png)

## Dark

![Dark](https://user-images.githubusercontent.com/51540772/219980792-9b786db7-e7bd-4280-afaa-0a9079287761.png)

## Getting Started

To use this app, all you need is flutter 3.0 installed and running on your machine. Clone this project to your computer and opens a emulator or run on your device.

## Deployment

To deploy this project run

```bash
  flutter run
```

  
## Run Locally

Clone the project

```bash
  git clone https://github.com/estermabel/TvMaze.git
```

Go to the project directory

```bash
  cd tv_maze
```

Install dependencies

```bash
  flutter pub get
```

Run the project

```bash
  flutter run
```


## Tech Stack

This project was developed using **Flutter**. The state manegement tool used was **Change Notifier** alongside with the **Flutter Modular** for dependency injection and **Clean Architecture**.

## API Reference

#### Documentation

You can access the full documentation [here](https://www.tvmaze.com/api#show-episode-list).

  
## Features

- [X] List all of the series contained in the API used by the paging scheme provided by the API.
- [X] Allow users to search series by name.
- [X] The listing and search views must show at least the name and poster image of the
series.
- [X] After clicking on a series, the application should show the details of the series, showing
the following information:
  - Name
  - Poster
  - Days and time during which the series airs
  - Genres
  - Summary
  - List of episodes separated by season
- [X] After clicking on an episode, the application should show the episode’s information, including:
  - Name
  - Number
  - Season
  - Summary
  - Image
- [X] Light and Dark theme defined by the system


## Authors

* **Ester Mabel** - *GitHub* - [GitHub](https://github.com/estermabel)

## Acknowledgments

* I built this app as a challenge. With him I was able to practice and reinforce my skills and knowledge. It was a fun project, I couldn't do the extra challenges, but I intend to keep improving this project.
