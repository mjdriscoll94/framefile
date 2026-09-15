import SwiftData

enum FrameFileSchemaV1: VersionedSchema {
    static let versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] {
        [ScreenshotItem.self, ScreenshotCategoryRecord.self]
    }
}

enum FrameFileMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [FrameFileSchemaV1.self]
    }

    static var stages: [MigrationStage] {
        []
    }
}

enum FrameFileContainer {
    static func make(inMemory: Bool = false) throws -> ModelContainer {
        let schema = Schema(versionedSchema: FrameFileSchemaV1.self)
        // Keep the original store name so updates continue using existing local data.
        let configuration = ModelConfiguration(
            "ScreenStash",
            schema: schema,
            isStoredInMemoryOnly: inMemory
        )

        return try ModelContainer(
            for: schema,
            migrationPlan: FrameFileMigrationPlan.self,
            configurations: configuration
        )
    }
}
