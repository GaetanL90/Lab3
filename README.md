# Lab 3 – Hard‑Coded Multi‑Screen Travel App UI

This Flutter app implements the assignment requirements for a **hard‑coded multi‑screen Travel App UI**:

- **Screens**: Home dashboard, Detail screen, Booking screen (`lib/screens`).
- **Hard‑coded data**: `Destination` model and sample trips in `lib/data/travel_data.dart`.
- **Navigation flow**: `HomeScreen → DetailScreen → BookingScreen → back` using `Navigator.push` / `Navigator.pop` and passing `Destination` objects between screens.
- **UI features**: AppBar with icons, search bar, horizontal category chips, grid of destination cards, large header image with gradient, scrollable content, booking summary card, form‑style fields, and confirmation dialog.
- **Widgets & theming**: Uses many built‑in widgets (e.g. `Scaffold`, `AppBar`, `GridView`, `ListView`, `Stack`, `Positioned`, `Container`, `SafeArea`, `SingleChildScrollView`, `Wrap`, `Chip`, `ChoiceChip`, `TextField`, `TextFormField`, `ElevatedButton`, `FilledButton`, etc.) plus reusable widgets in `lib/widgets`.

## Assets

- Add your destination photos into `assets/images/` using these filenames (or update `imageAsset` paths in `lib/data/travel_data.dart`):
  - `paris.jpg`
  - `bali.jpg`
  - `kyoto.jpg`
  - `capetown.jpg`

The folder already exists and is wired in `pubspec.yaml` under:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

## Running the app

From the project root:

```bash
cd lab3_travel_app
flutter pub get
flutter run
```

## Report (for submission)

You can submit this section as your **lab report** (or copy it into a PDF/Word document if a specific format is required).

### Screenshots

- Home Screen showing logo, search, categories, and destination grid.
- Detail Screen showing large header image, information, and \"Book now\" button.
- Booking Screen showing booking summary card, traveller form, and confirmation dialog.

### Layout and design explanation

- **Home Screen**: Uses `Scaffold` and `AppBar` with a custom logo and title. The body is inside a `SafeArea` and `SingleChildScrollView` containing a `Column`. A heading prompts the user, followed by a search bar, horizontal category `ChoiceChip`s, and a `GridView.builder` that shows destination cards. This screen acts as the dashboard for the app.
- **Detail Screen**: Built with `CustomScrollView` and a `SliverAppBar` that expands to show a large destination photo with a gradient overlay and title. Below, a padded `Column` shows location, rating, trip info chips, description text, and highlight `Chip`s. A bottom `Container` with a price label and primary `ElevatedButton` stays pinned at the bottom for easy access to booking.
- **Booking Screen**: Uses a `Scaffold` with AppBar and a `Column`. At the top, a `_BookingSummaryCard` shows a small image and key trip info. Below, a `Form` with multiple `TextFormField`s collects traveller details, followed by controls for number of travellers, room type `ChoiceChip`s, and an optional notes field. The bottom row displays the computed total price and a `FilledButton` that confirms the booking and shows a success `AlertDialog`.

### Widgets used

This app intentionally uses many different Flutter widgets, including (but not limited to):

- **Structure and layout**: `Scaffold`, `AppBar`, `SafeArea`, `CustomScrollView`, `SingleChildScrollView`, `GridView.builder`, `ListView.separated`, `Column`, `Row`, `Wrap`, `SizedBox`, `Padding`, `Container`, `ClipRRect`, `Positioned`, `Stack`, `SliverAppBar`, `SliverToBoxAdapter`.
- **Input and forms**: `TextField`, `TextFormField`, `Form`, `IconButton`, `ChoiceChip`, `Chip`.
- **Display**: `Text`, `Icon`, `CircleAvatar`, `Image.asset`, `Hero`.
- **Buttons**: `ElevatedButton`, `FilledButton`, `TextButton`, `InkWell`.
- **Feedback and dialogs**: `AlertDialog`.
- **Custom/reusable widgets**: `DestinationCard` (card for each destination), `_BookingSummaryCard`, `_RoomChip`, `_InfoChip`, `_SearchBar`, `_CategoryChips`.

### Navigation flow

- From the **Home Screen**, tapping a destination card uses `Navigator.push` with a `MaterialPageRoute` to open the **Detail Screen` and passes a `Destination` object as hard‑coded data.
- On the **Detail Screen**, the back arrow pops to the previous screen, while the home icon uses `Navigator.popUntil((route) => route.isFirst)` to go directly back to the Home Screen. Pressing \"Book now\" pushes the **Booking Screen**, again passing the same `Destination` object.
- On the **Booking Screen**, the AppBar back button pops back to the Detail Screen, the home icon pops back to the Home Screen, and the \"Confirm\" button validates the `Form` and then shows an `AlertDialog` that confirms the booking and pops the booking screen when closed.

