const prisma = require("../utils/prisma");
const { EventLogs } = require("./eventLogs");


const UserDocuments = {
    new: async function(filename, userId, docpath) {
        try {
            const userDocument = await prisma.user_documents.create({
                data: {
                    filename: filename,
                    userId: userId,
                    docpath: docpath,
                },
            });
            return userDocument;
        } catch (error) {
            console.error(error);
        }
    },
    get: async function(clause = {}) {
        try {
            const userDocuments = await prisma.user_documents.findMany({
                where: clause,
            });
            return userDocuments;
        } catch (error) {
            console.error(error);
        }
    },
    delete: async function(userId, filename) {
        try {
            await prisma.user_documents.deleteMany({
                where: {
                    userId,
                    filename,
                },
            });
            return true;
        } catch (error) {
            console.error(error);
            return false;
        }
    },
};

module.exports = { UserDocuments };