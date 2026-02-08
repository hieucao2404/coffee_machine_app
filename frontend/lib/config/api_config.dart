class ApiConfig {
    //Backend API base URL
    // Use localhost for desktop/emulator, or your computer's IP for physical device
    static const String baseUrl = 'http://localhost:5000';

    //API endpoints
    static const String productsEndpoint = '/api/products';
    static const String materialsEndpoint = '/api/material';
    static const String operationsEndpoint = '/api/operation';
    static const String processesEndpoint = '/api/process';
    static const String brewEndpoint = '/api/brew';

    //Connection timeout
    static const Duration connectTimeout = Duration(seconds: 30);
    static const Duration receiveTimeout = Duration(seconds: 30);

    //Image base URL
    static String getImageUrl(String? imageUrl) {
        if (imageUrl == null || imageUrl.isEmpty){
            return '';
        }
        //If imageUrl is already a full URL, return as is
        if(imageUrl.startsWith('http')){
            return imageUrl;
        }
        //Otherwise, prepend base URL
        return '$baseUrl$imageUrl';
    }
}