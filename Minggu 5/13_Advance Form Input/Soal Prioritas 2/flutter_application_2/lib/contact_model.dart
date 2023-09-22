import 'package:flutter/material.dart';

class ContactModel{
  final String name;
  final String phone;
  final DateTime tanggal;
  final Color warna;
  final String? namaFile;

  ContactModel({
    required this.name,
    required this.phone,
    required this.tanggal,
    required this.warna,
    this.namaFile,
  });
}