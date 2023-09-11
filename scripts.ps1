# $keyHex = $env:key

# # Define the key length (32 bytes for AES-256)
# $keyLength = 16


# # Define your plaintext data and key
# $plaintext = "Hello, Pavan...!"
# $key = $keyHex  # 16, 24, or 32 bytes key for AES-128, AES-192, or AES-256

# # Convert the key to bytes (UTF-8 encoding)
# $keyBytes = [System.Text.Encoding]::UTF8.GetBytes($key)

# # Create a new AES object with the specified key and AES mode
# $AES = New-Object System.Security.Cryptography.AesCryptoServiceProvider
# $AES.Key = $keyBytes  # Make sure the key is correctly set here
# $AES.Mode = [System.Security.Cryptography.CipherMode]::CBC

# # Generate a random initialization vector (IV)
# $AES.GenerateIV()
# $IV = $AES.IV

# # Convert plaintext to bytes (UTF-8 encoding)
# $plaintextBytes = [System.Text.Encoding]::UTF8.GetBytes($plaintext)

# # Encrypt the data
# $encryptor = $AES.CreateEncryptor()
# $encryptedBytes = $encryptor.TransformFinalBlock($plaintextBytes, 0, $plaintextBytes.Length)

# # Convert the IV and encrypted bytes to Base64 strings for storage/transmission
# $IVBase64 = [System.Convert]::ToBase64String($IV)
# $encryptedBase64 = [System.Convert]::ToBase64String($encryptedBytes)

# # Display the encrypted data and IV
# Write-Host "Encrypted Data (Base64): $encryptedBase64"
# Write-Host "Initialization Vector (Base64): $IVBase64"

# # Convert the IV and encrypted bytes from Base64
# $IV = [System.Convert]::FromBase64String($IVBase64)
# $encryptedBytes = [System.Convert]::FromBase64String($encryptedBase64)

# # Create a decryptor
# $decryptor = $AES.CreateDecryptor()
# $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)

# # Convert the decrypted bytes back to plaintext
# $decryptedText = [System.Text.Encoding]::UTF8.GetString($decryptedBytes)

# # Display the decrypted data
# Write-Host "Decrypted Data: $decryptedText"

# Input decimal number
$decimalNumber = "pavan9611097057"

# Convert decimal to hexadecimal with 16 bytes (32 hexadecimal characters)
$hexadecimal = $decimalNumber.ToString("X16")

# Display the hexadecimal result
Write-Host "Decimal: $decimalNumber"
Write-Host "Hexadecimal (16 bytes): 0x$hexadecimal"
