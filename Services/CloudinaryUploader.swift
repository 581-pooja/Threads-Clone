import UIKit

struct CloudinaryUploader {
    static func uploadImageToCloudinary(_ image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        let cloudName = "dtce49lrj"
        let uploadPreset = "profile_images"

        guard let imageData = image.jpegData(compressionQuality: 0.25) else {
            completion(.failure(NSError(domain: "ImageError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image."])))
            return
        }

        let url = URL(string: "https://api.cloudinary.com/v1_1/\(cloudName)/image/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()

        // Add upload_preset
        body.append(string: "--\(boundary)\r\n")
        body.append(string: "Content-Disposition: form-data; name=\"upload_preset\"\r\n\r\n")
        body.append(string: "\(uploadPreset)\r\n")

        // Add image file
        body.append(string: "--\(boundary)\r\n")
        body.append(string: "Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n")
        body.append(string: "Content-Type: image/jpeg\r\n\r\n")
        body.append(imageData)
        body.append(string: "\r\n")

        body.append(string: "--\(boundary)--\r\n")
        request.httpBody = body

        // Perform upload
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("Upload failed with error: \(error.localizedDescription)")
                return
            }

            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let imageUrl = json["secure_url"] as? String else {
                print("Upload failed: Invalid response from Cloudinary.")
                completion(.failure(NSError(domain: "UploadError", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid response from Cloudinary."])))
                return
            }
            print("✅ Upload successful! Image URL: \(imageUrl)")
            completion(.success(imageUrl))
        }.resume()
    }
}

// MARK: - Helper Extension
extension Data {
    mutating func append(string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

