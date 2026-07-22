// src/utils/AppDataManager.h

// Includes
#include <QString>

// AppDataManager
class AppDataManager
{
    private:
        static constexpr int kCurrentSchemaVersion = 1;

    public:
        static const QString rootPath();
        static const QString configPath();
        static const QString cachePath();
        static const QString logsPath();
        static const QString importsPath();

        static bool initialize();
        static bool ensureDirectoryStructure();
        static bool verifyManifest();
        static bool reset();
};
// - AppDataManager
