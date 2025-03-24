import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppLocalizations {
  static AppLocalizations shared = AppLocalizations._();
  Map<dynamic, dynamic> _localisedValues = {};

  AppLocalizations._();

  static AppLocalizations of(BuildContext context) {
    return shared;
  }

  String text(String key) {
    return _localisedValues[key] ?? "$key not found";
  }

  // defined text
  String get appName => text('app_name');
  String get sum_transaction_money => text('sum_transaction_money');
  String get link => text('link');
  String get linked_status_wait_confirm => text('linked_status_wait_confirm');
  String get linked_status_wait_account_add_by_admin_confirm => text('linked_status_wait_account_add_by_admin_confirm');
  String get linked_status_wait_confirm_cancel => text('linked_status_wait_confirm_cancel');
  String get sessionExpiredMessage =>
      text('common_message_error_session_expired');
  String get commonMessageConnectionError =>
      text('common_message_connection_error');
  String get commonMessageServerMaintenance =>
      text('common_message_server_maintenance');
  String get commonMessagePasswordError =>
      text('common_message_password_error');
  String get commonMessageEmailError => text('common_message_email_error');
  String get commonMessageNoData => text('common_message_no_data');
  String get commonMessageInDevelopment =>
      text('common_message_function_in_development');
  String get commonMessageEmailPlaceholder =>
      text('common_message_email_placeholder');
  String get commonMessagePasswordPlaceholder =>
      text('common_message_password_placeholder');
  String get loginPageForgetPasswordButton =>
      text('login_page_forget_password_button');
  String get loginPageLoginButton => text('login_page_login_button');
  String get home_transfer => text('home_transfer');
  String get home_withdraw => text('home_withdraw');
  String get home_deposit => text('home_deposit');
  String get add_bank => text('add_bank');
  String get cancel_transaction_success => text('cancel_transaction_success');
  String get account_info => text('account_info');
  String get phone_not_found => text('phone_not_found');
  String get unlink_confirm => text('unlink_confirm');
  String get tap_to_mobile_top_up => text('tap_to_mobile_top_up');
  String get link_confirm => text('link_confirm');
  String get common_yes => text('common_yes');
  String get common_no => text('common_no');
  String get card_acc_number => text('card_acc_number');
  String get unlink => text('unlink');
  String get unlink_cancel => text('unlink_cancel');
  String get unlink_confirm_cancel => text('unlink_confirm_cancel');
  String get transaction_limit => text('transaction_limit');
  String get manage_wallet => text('manage_wallet');
  String get link_type => text('link_type');
  String get account_number => text('account_number');
  String get expiration_date => text('expiration_date');
  String get activation_date => text('activation_date');
  String get card_number => text('card_number');
  String get full_name => text('full_name');
  String get name_of_owner => text('name_of_owner');
  String get home_scan_qr => text('home_scan_qr');
  String get home_bill => text('home_bill');
  String get home_plane_ticket => text('home_plane_ticket');
  String get home_insurance => text('home_insurance');
  String get home_see_more => text('home_see_more');
  String get home => text('home');
  String get home_wallet => text('home_wallet');
  String get home_transaction => text('home_transaction');
  String get home_setting => text('home_setting');
  String get homeUtilityMessage => text('home_utility_message');
  String get payment_electric => text('payment_electric');
  String get common_see_all => text('common_see_all');
  String get payment_water => text('payment_water');
  String get payment_internet => text('payment_internet');
  String get payment_tv => text('payment_tv');
  String get payment_phone => text('payment_phone');
  String get payment_loan => text('payment_loan');
  String get payment_phone_money => text('payment_phone_money');
  String get payment_house => text('payment_house');
  String get payment_school => text('payment_school');
  String get payment_vs => text('payment_vs');
  String get payment_hospital => text('payment_hospital');
  String get payment_other => text('payment_other');
  String get payment => text('payment');
  String get bill_code => text('bill_code');
  String get bill => text('bill');
  String get service => text('service');
  String get service_id => text('service_id');
  String get user_id => text('user_id');
  String get total_bill => text('total_bill');
  String get payment_account => text('payment_account');
  String get choose_account => text('choose_account');
  String get notification => text('notification');
  String get all => text('all');
  String get system => text('system');
  String get personal => text('personal');
  String get transaction_history => text('transaction_history');
  String get money_in => text('money_in');
  String get money_out => text('money_out');
  String get account_setting => text('account_setting');
  String get security_setting => text('security_setting');
  String get general_setting => text('general_setting');
  String get help_setting => text('help_setting');
  String get dark_mode_setting => text('dark_mode_setting');
  String get logout_setting => text('logout_setting');
  String get add_account => text('add_account');
  String get personal_information => text('personal_information');
  String get name => text('name');
  String get birthday => text('birthday');
  String get phone_number => text('phone_number');
  String get gender => text('gender');
  String get male => text('male');
  String get female => text('female');
  String get update => text('update');
  String get password_setting => text('password_setting');
  String get pincode_setting => text('pincode_setting');
  String get advanced_setting => text('advanced_setting');
  String get lock_method => text('lock_method');
  String get change_password => text('change_password');
  String get auto_lock => text('auto_lock');
  String get cancel => text('cancel');
  String get confirm => text('confirm');
  String get now => text('now');
  String get read_all_noti => text('read_all_noti');
  String get pin_code => text('pin_code');
  String get finger => text('finger');
  String get overview => text('overview');
  String get transaction_type_payment => text('transaction_type_payment');
  String get mobile_top_up_title => text('mobile_top_up_title');
  String get pay_late => text('pay_late');
  String get pay_pre => text('pay_pre');
  String get choose_tele => text('choose_tele');
  String get choose_value => text('choose_value');
  String get choose_tele_note => text('choose_tele_note');
  String get choose_tele_note_other => text('choose_tele_note_other');
  String get withdrawal_account => text('withdrawal_account');
  String get approve_notice => text('approve_notice');
  String get confirm_transaction => text('confirm_transaction');
  String get cancel_transaction => text('cancel_transaction');
  String get transaction_type_cashin => text('transaction_type_cashin');
  String get transaction_type_casbout => text('transaction_type_casbout');
  String get transaction_type_transfer_out => text('transaction_type_transfer_out');
  String get receiving_account => text('receiving_account');
  String get link_card_success => text('link_card_success');
  String get message_logout => text('message_logout');
  String get choose_recipient => text('choose_recipient');
  String get popular_recipients => text('popular_recipients');
  String get key_search => text('key_search');
  String get phonebook => text('phonebook');
  String get friend => text('friend');
  String get send => text('send');
  String get content => text('content');
  String get next => text('next');
  String get info_admin => text('info_admin');
  String get confirm_transfer_money => text('confirm_transfer_money');
  String get total_money => text('total_money');
  String get money_source => text('money_source');
  String get total_money_in_wallet => text('total_money_in_wallet');
  String get input_otp => text('input_otp');
  String get input_pin => text('input_pin');
  String get confirm_cashin => text('confirm_cashin');
  String get common_fail => text('common_fail');
  String get transaction_created => text('transaction_created');
  String get account_cashin => text('account_cashin');
  String get wallet_limit => text('wallet_limit');
  String get transfer_success => text('transfer_success');
  String get receiver => text('receiver');
  String get fee => text('fee');
  String get date => text('date');
  String get not_in_the_phonebook => text('not_in_the_phonebook');
  String get close_account => text('close_account');
  String get waitting_confirm => text('waitting_confirm');
  String get delete_this_wallet => text('delete_this_wallet');
  String get delete_wallet_success => text('delete_wallet_success');
  String get message_delete_wallet_success =>
      text('message_delete_wallet_success');
  String get login => text('login');
  String get forgot_pin_code => text('forgot_pin_code');
  String get forgot_password => text('forgot_password');
  String get forgot_password_notice => text('forgot_password_notice');
  String get create_password => text('create_password');
  String get confirm_password => text('confirm_password');
  String get create_password_notice => text('create_password_notice');
  String get camera => text('camera');
  String get gallery => text('gallery');
  String get email => text('email');
  String get cmt => text('cmt');
  String get address => text('address');
  String get common_message_error_email_validate =>
      text('common_message_error_email_validate');
  String get change_password_success => text('change_password_success');
  String get update_user_success => text('update_user_success');
  String get copy => text('copy');
  String get permission_camera_deny => text('permission_camera_deny');
  String get input_current_pass => text('input_current_pass');
  String get input_new_pass => text('input_new_pass');
  String get input_confirm_pass => text('input_confirm_pass');
  String get update_password_success => text('update_password_success');
  String get policy => text('policy');
  String get policy_content => text('policy_content');
  String get policy_setting => text('policy_setting');
  String get common_success => text('common_success');
  String get completion_time => text('completion_time');
  String get transaction_code => text('transaction_code');
  String get reference_code => text('reference_code');
  String get confirmed_transaction => text('confirmed_transaction');
  String get pending_transaction => text('pending_transaction');
  String get canceled_transaction => text('canceled_transaction');
  String get tap_to_transfer => text('tap_to_transfer');
  String get save_recipient => text('save_recipient');
  String get face_picture_title => text('face_picture_title');
  String get picture_warning_msg => text('picture_warning_msg');
  String get cccd_warning_msg => text('cccd_warning_msg');
  String get basic_info_title => text('basic_info_title');
  String get company_name_title => text('company_name_title');
  String get common_not_empty_field => text('common_not_empty_field');
  String get company_address_title => text('company_address_title');
  String get licence_number_title => text('licence_number_title');
  String get date_of_licence_title => text('date_of_licence_title');
  String get place_of_licence_title => text('place_of_licence_title');
  String get tax_code_number_title => text('tax_code_number_title');
  String get version_app => text('version_app');
  String get identity_confirmation_title => text('identity_confirmation_title');
  String get id_title => text('id_title');
  String get front_title => text('front_title');
  String get back_title => text('back_title');
  String get org => text('org');
  String get select_account_type => text('select_account_type');
  String get select_account_type_warn => text('select_account_type_warn');
  String get select_scan_type => text('select_scan_type');
  String get select_scan_type_detail => text('select_scan_type_detail');
  String get scan_QR_Code => text('scan_QR_Code');
  String get scan_NFC => text('scan_NFC');


  String get passport => text('passport');
  String get welcome_gtel_msg => text('welcome_gtel_msg');
  String get input_account_number_warn => text('input_account_number_warn');
  String get company_info => text('company_info');
  String get camera_warning_msg => text('camera_warning_msg');
  String get card_authen_success_msg => text('card_authen_success_msg');
  String get card_hold_warning => text('card_hold_warning');
  String get card_info_not_valid_warn => text('card_info_not_valid_warn');
  String get phone_not_validate => text('phone_not_validate');
  String get camera_permission_warn => text('camera_permission_warn');
  String get nfc_enable_warn => text('nfc_enable_warn');
  String get nfc_position_title => text('nfc_position_title');
  String get nfc_position_notice => text('nfc_position_notice');
  String get change_key => text('change_key');
  String get create_new_key => text('create_new_key');
  String get login_by_vneid =>text('login_by_vneid');


  /// common*/
  String get nextButton => text('next_button');
  String get moneyTransferIn => text('money_transfer_in');

  Future<void> reloadLanguageBundle({required String languageCode}) async {
    String path = "assets/jsons/localization_vi.json";
    String jsonContent = "";
    try {
      jsonContent = await rootBundle.loadString(path);
    } catch (_) {
      //use default Vietnamese
      jsonContent =
          await rootBundle.loadString("assets/jsons/localization_vi.json");
    }
    _localisedValues = json.decode(jsonContent);
  }
}
