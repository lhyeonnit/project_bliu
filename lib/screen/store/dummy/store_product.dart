final List<Map<String, dynamic>> stores = List.generate(10, (index) {
  return {
    'rank': index + 1,
    'logo': 'https://example.com/logo.png', // 임시 로고 이미지 URL
    'name': '가게 이름 $index',
    'description': '스포티 (Sporty), 베이비(0-24개월)',
    'scrapCount': '175만',
    'images': [
      'https://example.com/image1.png',
      'https://example.com/image2.png',
      'https://example.com/image3.png',
    ] // 가로로 스크롤할 수 있는 임시 이미지 URL들
  };
});
