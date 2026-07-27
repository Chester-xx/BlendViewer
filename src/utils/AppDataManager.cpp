// src/utils/AppDataManager.cpp

// imports
#include "AppDataManager.h"
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QJsonObject>
#include <QJsonDocument>
// - imports

// AppDataManager

bool AppDataManager::writeManifest()
{
    QJsonObject manifest;

    // create schema object inside manifest
    manifest[QStringLiteral("schemaVersion")] = kCurrentSchemaVersion;

    // pass to json document
    QJsonDocument doc(manifest);

    // create manifest file object
    QFile manifestFile(rootPath() + QLatin1Char('/') + QLatin1String("manifest.json"));

    // check the file can be opened to write
    if (!manifestFile.open(QIODevice::WriteOnly | QIODevice::Truncate)) return false;

    // write the current schema version for manifest.json
    manifestFile.write(doc.toJson(QJsonDocument::Indented));

    manifestFile.close();

    return true;
}

// rootPath
const QString AppDataManager::rootPath()
{
    static const QString path = QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation) + QLatin1Char('/') + QStringLiteral("BlendViewer");
    return path;
}
// - rootPath

// configPath
const QString AppDataManager::configPath()
{
    return rootPath() + QLatin1Char('/') + QStringLiteral("config");
}
// - configPath

// cachePath
const QString AppDataManager::cachePath()
{
    return rootPath() + QLatin1Char('/') + QStringLiteral("cache");
}
// - cachePath

// logsPath
const QString AppDataManager::logsPath()
{
    return rootPath() + QLatin1Char('/') + QStringLiteral("logs");
}
// - logsPath

// importsPath
const QString AppDataManager::importsPath()
{
    return rootPath() + QLatin1Char('/') + QStringLiteral("imports");
}
// - importsPath



// initialize
bool AppDataManager::initialize()
{
    //
    if (!ensureDirectoryStructure()) return false;

    return verifyManifest();
}
// - initialize

// verifyManifest
bool AppDataManager::verifyManifest()
{
    // define manifest file with relative path
    QFile manifestFile(rootPath() + QLatin1Char('/') + QLatin1String("manifest.json"));

    // check it exists
    if (!manifestFile.exists()) return reset();

    // check it can be opened for reading
    if (!manifestFile.open(QIODevice::ReadOnly)) return reset();

    // read contents with respect to parsing errors
    QJsonParseError parseError;
    const QJsonDocument doc = QJsonDocument::fromJson(manifestFile.readAll(), &parseError);
    manifestFile.close();

    // check parsing did not fail
    if (parseError.error != QJsonParseError::NoError || !doc.isObject()) return reset();

    // define manifest as object and get schema version number
    const QJsonObject manifest = doc.object();
    const int storedVersion = manifest.value(QStringLiteral("schemaVersion")).toInt(-1);

    // reset manifest if version is different
    if (storedVersion != kCurrentSchemaVersion) return reset();

    return true;
}
// - verifyManifest

// ensureDirectoryStructure
bool AppDataManager::ensureDirectoryStructure()
{
    // create needed paths
    const QStringList requiredDirs =
    {
        rootPath(),
        configPath(),
        cachePath(),
        logsPath(),
        importsPath()
    };

    // check each required path successfully created
    for (const QString& dirPath : requiredDirs)
    {
        QDir dir(dirPath);

        if (!dir.exists() && !dir.mkpath(dirPath)) return false;
    }

    return true;
}
// - ensureDirectoryStructure

// reset
bool AppDataManager::reset()
{
    // get rootpath
    QDir root(rootPath());

    // check appdata path exists
    if (root.exists())
    {
        // get list of files and folders
        const QStringList entries = root.entryList(QDir::Dirs | QDir::Files | QDir::NoDotAndDotDot);

        for (const QString& entryName : entries)
        {
            // if entry described is imports - dont delete
            if (entryName == QLatin1String("imports")) continue;

            // define object path and info
            const QString entryPath = root.filePath(entryName);
            const QFileInfo entryInfo(entryPath);

            // delete dir and sub dir
            if (entryInfo.isDir())
            {
                QDir subDir(entryPath);

                if (!subDir.removeRecursively()) return false;
            }
            // delete file
            else
            {
                if (!QFile::remove(entryPath)) return false;
            }
        }
    }

    // check dir structure has been wiped
    if (!ensureDirectoryStructure()) return false;

    // return manifest write result
    return writeManifest();
}
// - reset

// - AppDataManager
