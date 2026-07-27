// src/utils/AppDataManager.h

#pragma once

// Includes
#include <QString>

// AppDataManager
class AppDataManager
{
    private:
        static constexpr int kCurrentSchemaVersion = 1;

        // Writes a fresh manifest.json at rootPath() reflecting kCurrentSchemaVersion
        static bool writeManifest();

    public:
        static const QString rootPath();
        static const QString configPath();
        static const QString cachePath();
        static const QString logsPath();
        static const QString importsPath();

        // Resolves QStandardPaths root, called once from main() before engine.load()
        static bool initialize();

        // Creates any missing directories in the expected tree
        static bool ensureDirectoryStructure();

        // Reads manifest.json; if missing/corrupt, or schema version mismatches,
        // triggers reset(). Returns true if AppData is valid and ready after this call.
        static bool verifyManifest();

        // Wipes the entire AppData root and recreates it from scratch at the
        // current schema version. Called when verifyManifest() detects an
        // outdated or corrupt manifest.
        static bool reset();
};
// - AppDataManager
