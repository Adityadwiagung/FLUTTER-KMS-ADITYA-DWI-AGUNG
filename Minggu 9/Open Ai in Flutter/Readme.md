Beberapa hal yang saya pelajari pada materi kali ini yaitu:
1. Open Ai merupakan suatu library yang dapat digunakan untuk memanfaatkan teknologi AI yang disediakan oleh Open Ai dan library ini dapat diintregrasikan dengan berbagai aplikasi seperti API, web dan mobile.
2. untuk menggunakan Open AI, kita harus menginstall berbagai package yaiut envied, envied_generator dan build_runner
3. untuk dapat menggunakan Open AI, kita harus membuat file konfigurasi berupa env terlebih dahulu dan menjalankan blade_runner untuk membaca .env. Kemudian kita perlu melakukan Post request kepada API dari Open Ai yaitu: https://api.openai.com/v1/completions. contoh request post body api open ai:
{
        "model": "text-davinci-003",
        "prompt": "You are a car expert. Please give me a car recommendation from Honda budget 5000000000",
        "temperature": 0.4,
        "max_tokens": 64,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
}