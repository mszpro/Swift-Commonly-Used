
// Save a Data object to the temporary directory on disk
// guard let storedURL = saveToTempDirectory(dataToSave: item.itemData, fileExtension: "mov") else { return }; self.fileToPreview = storedURL
func saveToTempDirectory(dataToSave: Data?, fileExtension: String = ".jpg") -> URL? {
    guard let dataObject = dataToSave else { return nil }
    let tempDirectory = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
    let filePath = tempDirectory.appendingPathComponent(UUID().uuidString + fileExtension)
    do {
        try (dataObject as NSData).write(to: filePath)
        return filePath
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

// Clears the temporary directory

extension FileManager {
    func clearTmpDirectory() {
        do {
            let tmpDirectory = try contentsOfDirectory(atPath: NSTemporaryDirectory())
            try tmpDirectory.forEach {[unowned self] file in
                let path = String.init(format: "%@%@", NSTemporaryDirectory(), file)
                try self.removeItem(atPath: path)
            }
        } catch {
            print(error)
        }
    }
}
