-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_user_documents" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "fileId" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_user_documents" ("createdAt", "fileId", "id", "location", "userId") SELECT "createdAt", "fileId", "id", "location", "userId" FROM "user_documents";
DROP TABLE "user_documents";
ALTER TABLE "new_user_documents" RENAME TO "user_documents";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
