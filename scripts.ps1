# $keyHex = $env:key

# Input string
$inputString = "pavan1234567"

$keyLength = 64  # 32 bytes for AES-256

# Convert the string to bytes using UTF-8 encoding
$stringBytes = [System.Text.Encoding]::UTF8.GetBytes($inputString)

# Create a SHA-256 hash object
$sha256 = [System.Security.Cryptography.SHA256]::Create()

# Compute the hash of the input string
$hashBytes = $sha256.ComputeHash($stringBytes)

# Close the SHA-256 hash object
$sha256.Dispose()

# Convert the hash bytes to a hexadecimal string (64 characters)
$hexadecimalKey = [System.BitConverter]::ToString($hashBytes) -replace '-'

# Display the 64-character hexadecimal key
Write-Host "64-Character Hexadecimal Key: $hexadecimalKey"

# Define your plaintext data and key
$plaintext = "Hello, Pavan...!"
$key = $hexadecimalKey  # 32 bytes key for AES-256

# Convert the key to bytes (UTF-8 encoding)
$keyBytes = [System.Text.Encoding]::UTF8.GetBytes($key)

# Create a new AES object with the specified key and AES mode
$AES = New-Object System.Security.Cryptography.AesCryptoServiceProvider
$AES.KeySize = 256  # Set the key size to 256 bits for AES-256
$AES.Key = $keyBytes
$AES.Mode = [System.Security.Cryptography.CipherMode]::CBC

# Generate a random initialization vector (IV)
$AES.GenerateIV()
$IV = $AES.IV

# Convert plaintext to bytes (UTF-8 encoding)
$plaintextBytes = [System.Text.Encoding]::UTF8.GetBytes($plaintext)

# Encrypt the data
$encryptor = $AES.CreateEncryptor()
$encryptedBytes = $encryptor.TransformFinalBlock($plaintextBytes, 0, $plaintextBytes.Length)

# Convert the IV and encrypted bytes to Base64 strings for storage/transmission
$IVBase64 = [System.Convert]::ToBase64String($IV)
$encryptedBase64 = [System.Convert]::ToBase64String($encryptedBytes)

# Display the encrypted data and IV
Write-Host "Encrypted Data (Base64): $encryptedBase64"
Write-Host "Initialization Vector (Base64): $IVBase64"

# Convert the IV and encrypted bytes from Base64
$IV = [System.Convert]::FromBase64String($IVBase64)
$encryptedBytes = [System.Convert]::FromBase64String($encryptedBase64)

# Create a decryptor
$decryptor = $AES.CreateDecryptor()
$decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)

# Convert the decrypted bytes back to plaintext
$decryptedText = [System.Text.Encoding]::UTF8.GetString($decryptedBytes)

# Display the decrypted data
Write-Host "Decrypted Data: $decryptedText"
