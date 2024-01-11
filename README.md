![](_assets/cover.png)
# Rinjani Visitor🚞

Aplikasi pembelian paket wisata di pulau lombok.

[ < Link Figma > ](https://www.figma.com/file/zsxBMODaHeBTryvAeV3lHO/rinjaniVisitor?type=design&node-id=1%3A3&mode=design&t=tvNXCJ8M6fpKfFeA-1)


## Getting Started

### CV. Softcopy: Code Signing Information
For code signing, you can get the keystore inside `Rinjani Culture/Google Play/Signing Key` folder, just copy `key.properties` into  `android/` folder in rinjani visitor flutter folder, and `upload-keystore.jks` into `D:/` disk drive, and you're good to go.

### prerequites
- Flutter 3.16.x
- Android SDK with CommandLine 

you can follow all step by step from official Flutter Documentation

### Project Setup
```bash
git clone github.com/thisreponame
flutter pub get
# for first time user, this command should be run atleast once
dart run build_runner build 
```
> [!NOTE]
> Because this project rely heavily on generated code, we advised to run `dart run build_runner watch` command to generate necessary code in real time when working with this project.
> You can stop this process using command `ctrl+C` inside same terminal / CMD you run `dart run build_runner watch` command before.



### Folder Structure
- `core` - this is where static data and function is stored, such as global services (Dio), theme config, [dart extension](https://dart.dev/language/extension-methods), and utils (image converter, image compressor, exception handler, etc)
- `features` - All the features in the program are placed here. Each feature has a folder structure consisting of domain, data, and presentation. The independent nature of the structure makes it easier for teams to change dependencies for a feature without having to affect other code
  - `[feature-name]/data` - contains `RepositoryImpl`, `RemoteDataSource`, `LocalDataSource`, `Request`, and `Response` class. responsible for communicate with local and/or remote sources, using entities / models as communication contract between `data` and `presentation` layer.
  - `[feature-name]/domain` - contains entities or stand-alone models, which are the basis for data types that bridge communication between `data` and `presentation` layer.  
  - `[feature-name]/presentation` - Responsible for handling the user interface (UI) of the application. It contains all the code related to the visual representation of the app, such as widgets, viewModel (we used riverpod for this approach), and pages, or feature-to-feature communication like service.
test

### Riverpod usability
We used riverpod as state management system and dependency injection system. 

For dependency inject usage, some rules should be applied for easier to swap native android module and API specs, and also to avoid side effect and unintended behaviour: 
- `RepositoryImpl` can only receive dependency injection from local and remote resource in the same `[feature-name]` parent folder.
  - ONLY inject `RepositoryImpl` class to `ViewModel` class in same `[feature-name]` parent folder. 
- `ViewModel` class can receive dependency injection from `RepositoryImpl` class at same `[feature-name]` folder and `ViewModel` class from same and different `[feature-name]` folder. (ex: use `AuthViewModel` to provide access to `BookingHistoryViewModel` page).
