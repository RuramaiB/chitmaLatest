import CryptoJS from 'crypto-js';

const SECRET_KEY = 'thankstopeshelandmunashe'; // Replace with your own secret key

export function encryptData(data) {
  const encryptedData = CryptoJS.AES.encrypt(JSON.stringify(data), SECRET_KEY).toString();
  return encryptedData;
}

export function decryptData(encryptedData) {
  const bytes = CryptoJS.AES.decrypt(encryptedData, SECRET_KEY);
  const decryptedData = JSON.parse(bytes.toString(CryptoJS.enc.Utf8));
  return decryptedData;
}
