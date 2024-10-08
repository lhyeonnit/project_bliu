//회원가입 약관 동의
import 'package:bliu/screen/login_join/join_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JoinAgreeScreen extends StatefulWidget {
  @override
  _JoinAgreeScreenState createState() => _JoinAgreeScreenState();
}

class _JoinAgreeScreenState extends State<JoinAgreeScreen> {
  bool _serviceAgreement = false;
  bool _privacyPolicy = false;
  bool _ageConfirmation = false;
  bool _allAgreed = false;

  void _updateAllAgreed(bool? value) {
    setState(() {
      _allAgreed = value!;
      _serviceAgreement = value;
      _privacyPolicy = value;
      _ageConfirmation = value;
    });
  }

  void _checkAllAgreed() {
    setState(() {
      _allAgreed = _serviceAgreement && _privacyPolicy && _ageConfirmation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/login/ic_back.svg"),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 동작
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '회원가입 약관동의',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              '회원가입을 위해 약관에 동의해 주세요!',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            _buildAgreementOption(
              title: '서비스 약관 동의',
              value: _serviceAgreement,
              onChanged: (value) {
                setState(() {
                  _serviceAgreement = value!;
                  _checkAllAgreed();
                });
              },
            ),
            _buildAgreementOption(
              title: '개인정보 처리 방침',
              value: _privacyPolicy,
              onChanged: (value) {
                setState(() {
                  _privacyPolicy = value!;
                  _checkAllAgreed();
                });
              },
            ),
            _buildAgreementOption(
              title: '만 14세 이상입니다.',
              value: _ageConfirmation,
              onChanged: (value) {
                setState(() {
                  _ageConfirmation = value!;
                  _checkAllAgreed();
                });
              },
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: CheckboxListTile(
                value: _allAgreed,
                onChanged: _updateAllAgreed,
                title: Text('전체 동의합니다.'),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: Colors.pinkAccent,
              ),
            ),
            Spacer(),
            Divider(thickness: 1.5, color: Colors.grey[300]),
            SizedBox(
              width: double.infinity, // 버튼을 화면의 너비만큼 길게 설정
              child: ElevatedButton(
                onPressed: _allAgreed
                    ? () {
                  // 다음 버튼 눌렀을 때 동작
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JoinFormScreen(),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _allAgreed ? Colors.black : Colors.grey[300],
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  '다음',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgreementOption({
    required String title,
    required bool value,
    required Function(bool?) onChanged,
  }) {
    return Column(
      children: [
        CheckboxListTile(
          value: value,
          onChanged: onChanged,
          title: Text(title),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          activeColor: Colors.pinkAccent,
          secondary: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
