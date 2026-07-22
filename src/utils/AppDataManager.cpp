// src/utils/AppDataManager.cpp

// imports
#include "AppDataManager.h"
#include <QStandardPaths>
// - imports

// AppDataManager
class AppDataManager
{
   // Get

    // rootPath
    static const QString rootPath()
    {
        return QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation) + QLatin1Char('/') + QStringLiteral("BlendViewer");
    }
    // - rootPath

    // configPath
    static const QString configPath()
    {
        return rootPath() + QLatin1Char('/') + QStringLiteral("config");
    }
    // - configPath

    // cachePath
    static const QString cachePath()
    {
        return rootPath() + QLatin1Char('/') + QStringLiteral("cache");
    }
    // - cachePath

    // logsPath
    static const QString logsPath()
    {
        return rootPath() + QLatin1Char('/') + QStringLiteral("logs");
    }
    // - logsPath

    // importsPath
    static const QString importsPath()
    {
        return rootPath() + QLatin1Char('/') + QStringLiteral("imports");
    }
    // - importsPath

   // - Get

   // Operations

    // initialize
    static bool initialize()
    {
        return true;
    }
    // - initialize

    // verifyManifest
    static bool verifyManifest()
    {
        return true;
    }
    // - verifyManifest

    // ensureDirectoryStructure
    static bool ensureDirectoryStructure()
    {
        return true;
    }
    // - ensureDirectoryStructure

    // reset
    static bool reset()
    {
        return true;
    }
    // - reset

   // - Operations
};
// - AppDataManager
