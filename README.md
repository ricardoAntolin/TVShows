
# TVShows

# Requirements

Since .xcodeproj is not on repository because is generated through Xcodegen, before open project on Xcode please install mint:

```brew install mint```

Intall mint dependencies(Xcodegen, Swiftgen and SwiftLint):

```mint bootstrap```

and then generate .xcodeproj:

```mint run xcodegen```

# Project structure

The project is structured as a multimodule project where every architecture layer is contained in a separated module, based on clean architecture layers and basic redux like pattern on presentation.

All layer uses combine for data streams async requests.
Dependencies using SPM configured [here](project_packages.yml)
    - `OHHTTPStubs`: Stubbing tests
    - Point Free `SnapshotTesting`: Screnshot tests
    - `SDWebImageSwiftUI`: Load remote images

All dependencies and target/schemes configurations are handled by Xcodegen and configured on several .yml
Assets, Fonts and Localizables are handled by swiftgen configuration on [`swiftgen.yml`](swiftgen.yml)

### TVShows aka presentation

In presentation layer is structured based on basic redux like implementation with SwiftUI framework. For previews has testing mocks dependency implemented.

For large applications with several screenflows could be insteresting make a separate module for each screen flow, not applied to this project because has only one flow.

### Domain

Contains repository definitions, use cases and domain models.
In this module is where all existing business logic lives.

### Data

Contains domain repository implementations data source providers definitions.  
This module orchestate between different data source providers(API, local DB, analitics provider, ...) in this case there is only one provider

### Network Provider

Contains the API network calls logic. Using native URLSession.
Implement data provider definition.

### Testing

Testing was separated in:
    - Unit testing for all layers: 
        - API integration tests
        - Network provider tests
        - Data repository tests
        - Use case tests
        - Reducer tests
    - Screenshot tests:
        - Splash screen test
        - TVShows list test
        - TVShows details test
    - E2E UITest
        - Happy path test